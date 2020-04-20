%% Optimal Control Problem with CasADi on a constrained fractional heat control. 
%% Problem formulation
% Parameters for the problem
clear all;
close all;
clc;
Nx = 50; % Space discretization
Nt = 200; % Time discretization : need to check the CFL condition
C0 = 0; % Bound on the control below
C1 = 1; % Bound on the control above
L=5;
theta=0.33;
sigma=10;
bound=1;
epsilon=0.01;
saveon=1;


FinalTime = 200; % Initial guess on the final time


TARGET=theta;



xi = -L; xf = L; % Domain of the problem
% Discretization of the Space
xline = linspace(xi,xf,Nx+2);
xline = xline(2:end-1);
%xline = xline(2:end-1);
dx = xline(2) - xline(1);
Y00 = 0*xline'; % Initial data of the given trajectory
Y01 = 0*xline'+1; % Initial data of the given trajectory
Y1 = theta*ones(size(xline))'; % Initial data of the target trajectory

Nl=30;
SIGMA=zeros(Nl,1);
MINT=zeros(Nl,1);
Epsilon=linspace(10^(-4),0.5*10^(2),Nl)

for l=1:Nl
       strcat('iteration ',num2str(l))
        sigma=1/Epsilon(l);
        
        well=@(x)exp(x.^2/sigma);
        m=ones(Nx,1);
        m2=ones(Nx,1);
        for i=1:Nx
           m(i)=(sign(i-Nx/2))/sigma;
           m2(i)=(sign(i-Nx/2))/sigma; 
        end

%% Optimization problem
opti = casadi.Opti();  % CasADi function
%% ---- Input variables ---------
Y = opti.variable(Nx,Nt+1); % state trajectory
U = opti.variable(2,Nt+1);   % control
T=FinalTime;
%% ---- Dynamic constraints --------
g=@(j,k) (Y(j,k)-theta)*(1-Y(j,k));
for k=1:Nt % loop over control intervals
   for j=2:Nx-1
       opti.subject_to(dx^2*(Y(j,k+1)-Y(j,k))==(T/Nt)*(-2*Y(j,k+1)+Y(j+1,k+1)+Y(j-1,k+1)+0.5*dx*m(j)*(Y(j+1,k+1)-Y(j-1,k+1))+dx^2*Y(j,k+1)*g(j,k)));
   end
       opti.subject_to(dx^2*(Y(1,k+1)-Y(1,k))==(T/Nt)*(-2*Y(1,k+1)+Y(2,k+1)+U(1,k+1)+0.5*dx*m(1)*(Y(2,k+1)-U(1,k+1))+dx^2*Y(1,k+1)*g(1,k)));
       opti.subject_to(dx^2*(Y(Nx,k+1)-Y(Nx,k))==(T/Nt)*(-2*Y(Nx,k+1)+U(2,k+1)+Y(Nx-1,k+1)+0.5*dx*m(Nx)*(U(2,k+1)-Y(Nx-1,k+1))+dx^2*Y(Nx,k+1)*g(Nx,k)));
end
%% ---- Control constraints -----------
opti.subject_to(0<=U(:));           % control is limited
opti.subject_to(U(:)<=1);           % control is limited
%% ---- State constraints --------
opti.subject_to(Y(:,1)==Y00);
%opti.subject_to(Y(:,1)==Y01);
%% ---- Optimization objective  ----------
opti.minimize(((Y(:,Nt+1)-TARGET*ones(Nx,1))')*((Y(:,Nt+1)-TARGET*ones(Nx,1)))+((Y(:,Nt)-TARGET*ones(Nx,1))')*((Y(:,Nt)-TARGET*ones(Nx,1))))
%% ---- initial guesses for solver ---
opti.set_initial(Y, 0);
opti.set_initial(U, 0);
%% ---- solve NLP              ------
opti.solver('ipopt'); % set numerical backend
tic
sol = opti.solve();   % actual solve
toc






opti2 = casadi.Opti();  % CasADi function
Y2 = opti2.variable(Nx,Nt+1); % state trajectory
U2 = opti2.variable(2,Nt+1);   % control
T2 = opti2.variable();      % final time
g2=@(j,k) (Y2(j,k)-theta)*(1-Y2(j,k));
for k=1:Nt % loop over control intervals
   for j=2:Nx-1
       opti2.subject_to(dx^2*(Y2(j,k+1)-Y2(j,k))==(abs(T2)/Nt)*(-2*Y2(j,k+1)+Y2(j+1,k+1)+Y2(j-1,k+1)+0.5*dx*m2(j)*(Y2(j+1,k+1)-Y2(j-1,k+1))+dx^2*Y2(j,k+1)*g2(j,k)));
   end
       opti2.subject_to(dx^2*(Y2(1,k+1)-Y2(1,k))==(abs(T2)/Nt)*(-2*Y2(1,k+1)+Y2(2,k+1)+U2(1,k+1)+0.5*dx*m2(1)*(Y2(2,k+1)-U2(1,k+1))+dx^2*Y2(1,k+1)*g2(1,k)));
       opti2.subject_to(dx^2*(Y2(Nx,k+1)-Y2(Nx,k))==(abs(T2)/Nt)*(-2*Y2(Nx,k+1)+U2(2,k+1)+Y2(Nx-1,k+1)+0.5*dx*m2(Nx)*(U2(2,k+1)-Y2(Nx-1,k+1))+dx^2*Y2(Nx,k+1)*g2(Nx,k)));
end
opti2.subject_to(0<=U2(:));           % control is limited
opti2.subject_to(U2(:)<=1);           % control is limited
opti2.subject_to(0<=T2);
%% ---- State constraints --------
opti2.subject_to(Y2(:,1)==Y00);
opti2.subject_to(Y2(:,end)<=Y1+epsilon);
opti2.subject_to(Y2(:,end)>=Y1-epsilon);
%% ---- Optimization objective  ----------
opti2.minimize(max(T2,0)); % minimizing time
%% ---- initial guesses for solver ---
opti2.set_initial(Y2, sol.value(Y));
opti2.set_initial(U2, sol.value(U));
opti2.set_initial(T2, FinalTime);
opti2.set_initial(m2, sol.value(m));
%% ---- solve NLP              ------
opti2.solver('ipopt'); % set numerical backend
tic
sol2 = opti2.solve();   % actual solve
toc


SIGMA(l)=sigma;
MINT(l)=opti2.value(T2);

end
save('Wellworkspace3');
saveon=1;
filename='MincontroltimeWELL.pdf';
filename2='Mincontroltime2WELL.pdf';
Mincontr=figure
plot(SIGMA,MINT,'*');
xlabel('\sigma');
ylabel('Min T');
title('Minimum Controllability time');
if saveon==1
    set(Mincontr,'PaperSize',[6 5]); %set the paper size to what you want 
    print(Mincontr,filename,'-dpdf');
end

Mincontr2=figure
SIGMAp=SIGMA(1:end);
MINTp=MINT(1:end);
for i=1:length(SIGMAp)
    SIGMA1(i)=1/SIGMAp(i);
end
plot(SIGMA1,MINTp,'*');
        set(gca,'FontSize',15)
xlabel('$1/\sigma$','Interpreter','Latex');
ylabel('Min $T$','Interpreter','Latex');
xlim([0,52])
title('Minimum Controllability time','Interpreter','Latex');
if saveon==1
    set(Mincontr2,'PaperSize',[6 5]); %set the paper size to what you want 
    print(Mincontr2,filename2,'-dpdf');
end
