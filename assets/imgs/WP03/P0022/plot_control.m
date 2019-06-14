%close all
%addpath(genpath('/home/djoroya/Documentos/GitHub/DyCon-toolbox'))
%% 
% Read the data from the external file data.txt

fid= fopen('data_Nx20Nt100_mintime_UP.txt','r');
C = fscanf(fid,'%f',Inf);
T = C(1);                                        
Nx = C(2);
Nt = C(3);
y = C(4:(Nt+1)*Nx+3); 
u = C((Nt+1)*Nx+4:end);
fclose(fid);                          

%% 
% Reshape the state y and the control u into two Nx times Nt+1 matrices
y = reshape(y,Nx,Nt+1);
u = reshape(u,Nx,Nt+1);

%%
% Recover the control for controllability to trajectories

xline = linspace(-1,1,Nx);
dt = T/Nt;
tline = 0:dt:T;

a = -0.3; b = 0.8;
control = (xline>=a).*(xline<=b);
B = diag(control);

utarget = y*0+1;
v = u+B*utarget;

%% 
% For visibility reasons in the plots, set to zero the values of the
% control below the tolerance 10^(-5)
w = v;
w(w<=1e-5) = 0;

%% 
% Again for visibility reasons, generate from w a new control on a refined
% mesh, bot in space an time. 

k = 5;
xlineREF = linspace(-1,1,k*Nx);
p = 2;
tlineREF = linspace(0,T,p*Nt);

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

%%
% Plot of the refined control W2. For attenuating the difference between
% the high and low picks and improving the visibility, the plot is done in 
% logaritmic scale.

figure1 = figure;
axes1 = axes('Parent',figure1);
surf(xlineREF,tlineREF,log10(1+W2)')
caxis([0,3])
shading interp
colormap jet
colorbar
box off
view(axes1,[114.4 51.2]);
xlim([xlineREF(1) xlineREF(end)])
ylim([tlineREF(1) tlineREF(end)])
set(gca,'visible','off')
cbh = colorbar('peer',axes1);
zticks([])
cbh.Ticks = linspace(0,3,5) ; 
cbh.TickLabels = ({'0','8.3\cdot 10^3','1.7\cdot 10^4','2.5\cdot 10^4','3.3\cdot 10^4'});
cbh.FontSize = 24;
cbh.Location = 'southoutside';
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',24)

%%
A = -FEFractionalLaplacian(0.8,1,k*Nx);
a = -0.3; b = 0.8;
B = BInterior(xlineREF,a,b);
idyn = pde('A',A,'B',B);
idyn.Solver = @euleri;
idyn.MassMatrix = massmatrix(xlineREF);
idyn.FinalTime = T;
idyn.Nt = p*Nt;
idyn.mesh = xlineREF;

YTref = interp1(xline,YT(end,:),xlineREF);
solve(idyn,'Control',W2')

%%
A = -FEFractionalLaplacian(0.8,1,Nx);
idyn = pde('A',A,'B',B);
idyn.Solver = @euleri;
idyn.MassMatrix = massmatrix(xline);
idyn.FinalTime = T;
idyn.Nt = 101;
idyn.mesh = xline;

%%
idynTarget = copy(idyn);
idynTarget.InitialCondition = 6*cos(0.5*pi*xline');

U0 = 1+ zeros(idyn.Nt,idyn.Udim);
[~ ,YT]  = solve(idynTarget,'Control',U0);

%%
Y = (y' + YT);

idyn.InitialCondition = Y(1,:);
idyn.StateVector.Numeric = Y;
idyn.Control.Numeric = v';

%%
solve(idyn,'Control',v');
animation(idyn,  ...
               'xx',0.01,       ...
           'Target',YT(end,:),  ...
      'YLimControl',[0 5000],   ...
    'ControlShadow',true,       ...
    'InitCondition',idyn.StateVector.Numeric(1,:))

%%
error('sdsa')
Y(Y<0) = 0;
u(u<0) = 0;
[tt,xx] = ndgrid(idyn.tspan,xline);

[ttt,xxx] = ndgrid(linspace(0,T,200),linspace(-1,1,400));

Fy = griddedInterpolant(tt,xx,Y,'spline')
Fu = griddedInterpolant(tt,xx,u','spline')

%%
Ynew = Fy(ttt,xxx); Ynew(Ynew<0) = 0; 
Unew = Fu(ttt,xxx); Unew(Unew<0) = 0; 
idyn.mesh = linspace(-1,1,400);
idyn.Nt = 200;
idyn.InitialCondition = Ynew(1,:);
idyn.StateVector.Numeric = Ynew;
idyn.Control.Numeric = Unew;
idyn.B = BInterior( linspace(-1,1,400),-1,1);
idyn.A = -FEFractionalLaplacian(0.8,1,400);
idyn.MassMatrix = massmatrix(idyn.mesh);

%%
solve(idyn,'Control',Unew);
animation(idyn,     'xx', 0.01,                              ...
                'Target', YT(end,:),   ...
           'YLimControl', [0 5000],                          ...
                  'YLim', [0 5],                             ...
         'ControlShadow', true,                              ...
         'InitCondition', idyn.StateVector.Numeric(1,:))

%%
colzeros = zeros(200,1);
Ynewzeros = [colzeros Ynew colzeros];
Unewzeros = [colzeros Unew colzeros];

close all
subplot(1,2,1)
surf(Ynew)
shading interp
colormap jet
caxis([0 30])
subplot(1,2,2)
surf(Unew)
caxis([0 500])

shading interp
colormap jet

%%

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
            
    M=dx*sparse(M);
end
