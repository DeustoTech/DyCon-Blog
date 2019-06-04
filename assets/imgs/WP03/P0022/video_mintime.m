close all
clear all

%fid= fopen('./data_plot/UP/data_Nx20Nt100_mintime_UP.txt','r');
fid= fopen('data_Nx20Nt100_mintime_UP.txt','r');
C = fscanf(fid,'%f',Inf);
T = C(1);                                        
Nx = C(2);
Nt = C(3);
y = C(4:(Nt+1)*Nx+3); 
u = C((Nt+1)*Nx+4:end);
fclose(fid);                          

y = reshape(y,Nx,Nt+1);
u = reshape(u,Nx,Nt+1);

xline = linspace(-1,1,Nx);
dt = T/Nt;
tline = 0:dt:T;

a = -0.3; b = 0.8;
B = construction_matrix_B(xline,a,b);

utarget = y*0+1;
v = u+B*utarget;

w = v;
% w(w<=5e-1) = 0;
% w(:,end) = zeros(Nx,1);


Tmin = strcat('T_{min}');

k = 5;
xlineREF = linspace(-1,1,k*Nx);
p = 2;
tlineREF = linspace(0,T,p*Nt);
j0 = 1;
dtREF = tlineREF(2)-tlineREF(1);

W1 = zeros(k*Nx,Nt+1);
for i = 1:Nx
    if mod(k*i,k) == 0
        W1(k*i,:) = k*w(i,1:end);
    end
end

W2 = zeros(k*Nx,p*Nt);
for j = 1:Nt
    if mod(p*j,p) == 0
       W2(:,p*j) = p*W1(:,j);
    end
end

% s = 0.8;
% A = -FEFractionalLaplacian(s,1,k*Nx);
% M = massmatrix(xlineREF);
% a = -0.3; b = 0.8;
% BREF = construction_matrix_B(xlineREF,a,b);
% 
% Y0 = 0.5*cos(0.5*pi*xlineREF);
% Y0_target = 6*cos(0.5*pi*xlineREF);
% 
% dynamics = pde('A',A,'B',BREF,'InitialCondition',Y0','FinalTime',T,'dt',dtREF);
% dynamics.MassMatrix = M;
% dynamics.mesh = xlineREF;
% [~ ,Y] = solve(dynamics,'Control',W2');

s = 0.8;
A = -FEFractionalLaplacian(s,1,Nx);
M = massmatrix(xline);
a = -0.3; b = 0.8;
BREF = construction_matrix_B(xline,a,b);

Y0 = 0.5*cos(0.5*pi*xline);
Y0_target = 6*cos(0.5*pi*xline);

dynamics = pde('A',A,'B',BREF,'InitialCondition',Y0','FinalTime',T,'Nt',101);
dynamics.MassMatrix = M;
dynamics.mesh = xline;
[~ ,Y] = solve(dynamics,'Control',w');

TargetDynamics = copy(dynamics);
TargetDynamics.InitialCondition = Y0_target;
TargetDynamics.MassMatrix = M;
%TargetDynamics.mesh = xlineREF;
U00 = TargetDynamics.Control.Numeric*0+1;
[~ ,YT] = solve(TargetDynamics,'Control',U00);
    
YT = YT(end,:).';
YT(1) = 0;
YT(end) = 0;

MAX = max(max(dynamics.Control.Numeric));

dynamics.StateVector.Numeric = y'+TargetDynamics.StateVector.Numeric;
dynamics.StateVector.Numeric(:,1) = 0;
dynamics.StateVector.Numeric(:,end) = 0;
%dynamics.StateVector.Numeric(dynamics.StateVector.Numeric<=5e-1) = 0;



function A = FEFractionalLaplacian(s,L,N)

x = linspace(-L,L,N+2);
x = x(2:end-1);
h = x(2)-x(1);
A = zeros(N,N);

c = (s*2^(2*s-1)*gamma(0.5*(1+2*s)))/(sqrt(pi)*gamma(1-s));

for i=1:N-2
    for j=i+2:N
        k = j-i;
        if s==0.5 && k==2
                A(i,j) = 56*log(2)-36*log(3);           
        elseif s==0.5 && k~=2
            A(i,j) = -(4*((k+1)^2)*log(k+1)+4*((k-1)^2)*log(k-1)...
                -6*(k^2)*log(k)-((k+2)^2)*log(k+2)-((k-2)^2)*log(k-2));
        else
            P = 1/(4*s*(1-2*s)*(1-s)*(3-2*s));
            q = 3-2*s;
            B = P*(4*(k+1)^q+4*(k-1)^q-6*k^q-(k-2)^q-(k+2)^q);
            A(i,j) = -2*h^(1-2*s)*B;
        end       
    end
end

for i=1:N-1
    if s==0.5
       A(i,i+1) = 9*log(3)-16*log(2);
    else 
       A(i,i+1) = h^(1-2*s)*((3^(3-2*s)-2^(5-2*s)+7)/(2*s*(1-2*s)*(1-s)*(3-2*s))); 
    end    
end

A = A+A';

for i=1:N
    if s==0.5
       A(i,i) = 8*log(2);
    else 
       A(i,i) = h^(1-2*s)*((2^(3-2*s)-4)/(s*(1-2*s)*(1-s)*(3-2*s)));
    end
end

A = c*A; 
end

function M = massmatrix(mesh)
    N = length(mesh);
    dx = mesh(2)-mesh(1);
    M = 2/3*eye(N);
    for i=2:N-1
        M(i,i+1)=1/6;
        M(i,i-1)=1/6;
    end
    M(1,2)=1/6;
    M(N,N-1)=1/6;
            
    M=dx*M;
 end

function [B] = construction_matrix_B(mesh,a,b)

N = length(mesh);
B = zeros(N,N);

control = (mesh>=a).*(mesh<=b);
B = diag(control);

end