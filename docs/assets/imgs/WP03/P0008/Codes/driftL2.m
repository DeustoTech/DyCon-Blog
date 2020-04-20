%% Optimal Control Problem with CasADi
% Parameters for the problem
clear all;
close all;
clc;
Nx = 200; % Space discretization
Nt = 200; % Time discretization : need to check the CFL condition
C0 = 0; % Bound on the control below
C1 = 1; % Bound on the control above
L=15;
theta=0.33;
sigma=10;
bound=1;
epsilon=0.01;
saveon=0;
filename='40weirdto1.pdf';


% gaussian=@(x)exp(-x.^2/sigma);
% m=ones(Nx,1);
% for i=1:Nx
%    m(i)=-(2*(i-Nx/2))/sigma; 
% end
CC=35;
CG=3;
sigma=350;
sigma2=10;
weird=@(x)CG*exp(-x.^2/sigma2)+exp(CC*abs(x)/sigma)-1;
m=ones(Nx,1);
for i=1:Nx
   m(i)=(CC*(sign(i-Nx/2))*(1/sigma)*exp(abs((i-Nx/2))/sigma)-CG*(2*(i-Nx/2))*(1/sigma2)*exp(-(i-Nx/2).^2/sigma2))/(CG*exp(-(i-Nx/2).^2/sigma2)+CC*exp(abs((i-Nx/2))/sigma)-1); 
end
xi = -L; xf = L; % Domain of the problem
xline2 = linspace(xi,xf,Nx+2);
profile=figure
plot(xline2,weird(xline2),'--','Color','b');


% well=@(x)exp(abs(x)/sigma);
% m=ones(Nx,1);
% for i=1:Nx
%    m(i)=(sign(i-Nx/2))/sigma; 
% end

FinalTime = 150; % Initial guess on the final time


TARGET=1;



xi = -L; xf = L; % Domain of the problem
% Discretization of the Space
xline = linspace(xi,xf,Nx+2);
xline = xline(2:end-1);
%xline = xline(2:end-1);
dx = xline(2) - xline(1);
Y00 = 0*xline'; % Initial data of the given trajectory
Y01 = 0*xline'+1; % Initial data of the given trajectory
Y1 = theta*ones(size(xline))'; % Initial data of the target trajectory
%% Optimization problem
opti = casadi.Opti();  % CasADi function
%% ---- Input variables ---------
Y = opti.variable(Nx,Nt+1); % state trajectory
U = opti.variable(2,Nt+1);   % control
%m = opti.variable(Nx);     %drift

%T = opti.variable();      % final time
T=FinalTime;

%% ---- Dynamic constraints --------
g=@(j,k) (Y(j,k)-theta)*(1-Y(j,k));
for k=1:Nt % loop over control intervals
   % Euler forward method
   %x_next = X(:,k) + (T/Nt)*f(X(:,k),U(:,k)); 
   %x_next = X(:,k) + (T/Nt)*f(X(:,k),U(:,k));
   for j=2:Nx-1
       opti.subject_to(dx^2*(Y(j,k+1)-Y(j,k))==(T/Nt)*(-2*Y(j,k+1)+Y(j+1,k+1)+Y(j-1,k+1)+0.5*dx*m(j)*(Y(j+1,k+1)-Y(j-1,k+1))+dx^2*Y(j,k+1)*g(j,k)));
   end
       opti.subject_to(dx^2*(Y(1,k+1)-Y(1,k))==(T/Nt)*(-2*Y(1,k+1)+Y(2,k+1)+U(1,k+1)+0.5*dx*m(1)*(Y(2,k+1)-U(1,k+1))+dx^2*Y(1,k+1)*g(1,k)));
       opti.subject_to(dx^2*(Y(Nx,k+1)-Y(Nx,k))==(T/Nt)*(-2*Y(Nx,k+1)+U(2,k+1)+Y(Nx-1,k+1)+0.5*dx*m(Nx)*(U(2,k+1)-Y(Nx-1,k+1))+dx^2*Y(Nx,k+1)*g(Nx,k)));
   
   %opti.subject_to(X(:,k+1)==x_next); % close the gaps
end


%% ---- Control constraints -----------
opti.subject_to(0<=U(:));           % control is limited
opti.subject_to(U(:)<=1);           % control is limited

%opti.subject_to(m(:)>=0);           % m is limited
%opti.subject_to(m(:)<=100*L*bound);           % m is limited

%% ---- State constraints --------
% opti.subject_to(X(:,1)==Y0-Y1);
% opti.subject_to(X(:,Nt+1)==0);
opti.subject_to(Y(:,1)==Y00);
%opti.subject_to(Y(:,1)==Y01);

% opti.subject_to(Y(:)<=1);
% opti.subject_to(0<=Y(:));

%opti.subject_to(Y(:,Nt+1)==theta);

%% ---- Optimization objective  ----------
%opti.minimize(T); % minimizing time
opti.minimize(((Y(:,Nt+1)-TARGET*ones(Nx,1))')*((Y(:,Nt+1)-TARGET*ones(Nx,1)))+((Y(:,Nt)-TARGET*ones(Nx,1))')*((Y(:,Nt)-TARGET*ones(Nx,1))))
%% ---- initial guesses for solver ---
%opti.set_initial(X, repmat(Y0-Y1,[1 Nt+1]));
opti.set_initial(Y, 0);
opti.set_initial(U, 0);
% opti.set_initial(Y, 1);
% opti.set_initial(U, 1);
%opti.set_initial(T, FinalTime);

%% ---- solve NLP              ------
opti.solver('ipopt'); % set numerical backend
tic
sol = opti.solve();   % actual solve
toc
%% Post-processing
SOLY=sol.value(Y)
SOLU=sol.value(U);
SOLY2=[SOLU(1,:); SOLY; SOLU(1,:)];

surf(SOLY);
zlim([-0.1 1]);
colormap('jet');
colorbar
shading interp
xline2 = linspace(xi,xf,Nx+2);

PICTURE=figure
for i=1:Nt
    if(rem(i,Nt/10)==0)
        COLOR=(11-i/(Nt/10))/10*[1 0 0];
        plot(xline2,SOLY2(:,i),'Color',COLOR);
        hold on;
    end
end
xlabel('space');
ylabel('state');
yticks([0 theta 1]);
ylim([-0.05 1.05]);
yticklabels({'0', '\theta', '1'})
if saveon==1
    set(PICTURE,'PaperSize',[6 5]); %set the paper size to what you want 
    print(PICTURE,filename,'-dpdf');
end


PICTURE2=figure
for i=1:Nt
    if(rem(i,Nt/10)==0)
        COLOR=(11-i/(Nt/10))/10*[1 0 0];
        plot(xline2,SOLY2(:,i),'Color',COLOR);
        hold on;
    end
end
%plot(xline2,gaussian(xline2),'--','Color','b');
%plot(xline2,well(xline2),'--','Color','b');
plot(xline2,weird(xline2)-3,'--','Color','b');

xlabel('space');
ylabel('state');
%ylim([-0.05 1.05]);
ylim([-0.05 3]);
yticks([0 theta 1])
yticklabels({'0', '\theta', '1'})
if saveon==1
    set(PICTURE2,'PaperSize',[6 5]); %set the paper size to what you want 
    print(PICTURE2,strcat(filename,'2'),'-dpdf');
end

profile=figure
plot(xline2,weird(xline2),'--','Color','b');



