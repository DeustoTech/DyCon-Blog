clear all, close all, clc


%% mesh sizes and parameters

% spatial mesh
X_max = 6; % length of space domain
Nx = 20; % number of mesh points
x_line = linspace(-X_max,X_max,Nx); % discretization of the space domain
dx = x_line(2) - x_line(1); % space increment

% temporal mesh
T = 5; % time horizon
Nt = 80; % number of mesh points
t_line = linspace(0,T,Nt); % discretization of the time domain
dt = t_line(2) - t_line(1); % time increment

% parameters
k = dt/(dx^2);
b = dt/(2*dx);

% meshgrid
[x, y] = meshgrid(t_line,x_line);
[nx, ny] = meshgrid(0:1/10:T, -X_max:1/10:X_max);

%% reference trajectory

ref = 4*sin(2*t_line);

%% plot reference trajectory

figure(1)
f1 = plot(t_line,ref, 'r', 'LineWidth', 2);
title('Reference trajectory z(t)=4sin(2t)')
xlabel('t')
ylabel('4sin(2t)')

% saveas(f1,'ref.png')

%% initial density

y0 = exp(-2*x_line.^2);

C = sqrt(pi/2)*erf(sqrt(2)*X_max); % normalizing constant
y0 = (1/C) * y0'; % normalized initial density


%% plot initial density

figure(2)
ny0 = interp1(x_line,y0,-X_max:1/10:X_max,'spline');
f2 = plot(-X_max:1/10:X_max, ny0, 'r', 'LineWidth', 2);
title('Initial probability density p_0(x) = exp(-2x^2)/C')
xlabel('x')
ylabel('p_0(x)')
axis([-6 6 -.001 .8])

%set(gca, 'color', 'k')

saveas(f2, 'init.png')

%% uncontrolled solution

Yf = zeros(Nx,Nt);
Yf(:,1) = y0;

for n = 1 : Nt-1
    for j = 2 : Nx-1
        % euler step
        Yf(j,n+1) =  Yf(j,n) + k * (Yf(j+1,n) - 2*Yf(j,n) + Yf(j-1,n));
    end
    % zero flux boundary conditions
    Yf(Nx,n+1) = Yf(Nx-1,n+1); 
    Yf(1,n+1) = Yf(2,n+1);
end

%% plot uncontrolled solution

figure(3)
nheat = interp2(x, y, Yf, nx, ny, 'cubic');
f3 = surf(nx, ny, nheat);
title('Uncontrolled solution')
xlabel('t')
ylabel('x')
zlabel('p(x,t)')

% saveas(f3, 'unctrb.png');

figure(4)
f4 = plot(x_line,Yf); % este hay que mejorarlo un poco
title('Evolution of the uncontrolled density with time')
xlabel('x')
ylabel('p(x,t)')

% saveas(f4, 'unctrbevo.png')

figure(5)
f5 = pcolor(nx, ny, nheat);
title('Uncontrolled solution from above')
xlabel('t')
ylabel('x')
f5.FaceColor = 'interp';
shading interp
colorbar

% saveas(f5, 'unctrbab.png')

%% animation uncontrolled

% for n = 1 : Nt
%     plot(x_line, Yf(:,n))
%     pause(.1)
% end

%% optimal control problem

opti = casadi.Opti();
Y = opti.variable(Nx,Nt); % state variable
U = opti.variable(Nx,Nt); % control variable

%% system dynamics

for n = 1 : Nt-1
    for j = 2 : Nx-1
        term1 = k*(Y(j+1,n)-2*Y(j,n)+Y(j-1,n));
        term2 = b*Y(j,n)*(U(j+1,n)-U(j-1,n));
        term3 = b*U(j,n)*(Y(j+1,n)-Y(j-1,n));
        opti.subject_to(Y(j,n+1) == Y(j,n) + term1 - term2 - term3);
    end
end

%% initial conditions and zero flux boundary conditions

% initial condition
opti.subject_to(Y(:,1) == y0); 

% zero flux boundary conditions
for n = 2 : Nt % zero flux boundary conditions
    opti.subject_to(Y(Nx,n) == Y(Nx-1,n)/(1-dx*U(Nx,n)));
    opti.subject_to(Y(1,n) == Y(2,n)/(1+dx*U(1,n)));
end

%% admissible control constraints

opti.subject_to(-2<=U(:)<=2);

%% cost functional

cost = 0;

% running cost
for n = 1 : Nt 
    for i = 1 : Nx
        cost = cost + (x_line(i)-ref(n))^2*Y(i,n);
    end
end

% terminal cost
for i = 1 : Nx 
    cost = cost + (x_line(i)-ref(n))^2*Y(i,Nt);
end

% control cost
for n = 1 : Nt % control cost
    for i = 1 : Nx
        cost = cost + Y(i,n)*U(i,n)^2;
    end
end

%% solution of the optimization problem

% set optimization objective
opti.minimize(cost);

% solution of the optimization problem
p_opts = struct('expand',true);
s_opts = struct('max_iter',1000); 
opti.solver('ipopt',p_opts,s_opts); 

tic
sol = opti.solve(); 
toc

%% plot solutions

sol_x = sol.value(Y);
sol_u = sol.value(U);

figure(6)

nsol = interp2(x, y, sol_x, nx, ny, 'cubic');
f6 = surf(nx, ny, nsol);
title('Controlled solution')
xlabel('t')
ylabel('x')
zlabel('p(x,t)')
% shading interp

%saveas(f6, 'ctrb.png')

figure(7)
f7 = plot(x_line, sol_x);
title('Evolution of the controlled density with time')
xlabel('x')
ylabel('p(x,t)')

% saveas(f7, 'ctrbevo.png')

figure(8)
f8 = pcolor(nx, ny, nsol);
title('Controlled solution from above')
xlabel('t')
ylabel('x')
f8.FaceColor = 'interp'
shading interp
colorbar

% saveas(f8, 'ctrbab.png')

%% simulation brownian motion
figure(8)
clf
u = @(x,t) interp2(x_line, t_line , sol_u', x, t);

N = 100; % number of particles
Xd = normrnd(0,sqrt(1/2),N,1);
% Xd = 12*(rand(N,1)-.5);
X = zeros(N, Nt);
X(:,1) = Xd;
for n = 2 : Nt
    X(:,n) = X(:,n-1) + dt *1*(arrayfun(@(i) u(i,n*dt),X(:,n-1))) + 5*dt*dx*normrnd(0,sqrt(1/2),N,1);   
end % cambiar +1 0 0 según control o no control

%%
surf(1:Nt,x_line,sol_x) % 
%surf(1:Nt,x_line,Yf)
shading interp
view(0,-90)
color = jet(N);
xlabel('Time steps','FontSize',18)
ylabel('x','FontSize',18)
xlim([1 Nt])
ylim([-6 6])
title('N=100 controlled Brownian particles','FontSize',18) % title('N=100 uncontrolled Brownian particles')
%%
for itx = 1:N
   linsn(itx) = line(1,X(itx,1),'Marker','none','MarkerSize',6,'Color',0.2 + 0.8*color(itx,:)) ;
   lins(itx) = line(1,X(itx,1),'Marker','O','MarkerSize',6,'Color',color(itx,:)) ;
   lins(itx).MarkerFaceColor = color(itx,:);
   lins(itx).MarkerEdgeColor = 0.7*color(itx,:);
end
%
for it = 1:Nt
    for itx = 1:N
       lins(itx).YData = X(itx,it);
       lins(itx).XData = it;
       linsn(itx).YData = X(itx,1:it);
       linsn(itx).XData = 1:it;
    end
    pause(0.1)
end 


