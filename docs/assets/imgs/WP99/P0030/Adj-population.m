% Adjoint of Population Dynamics
clear all,close all 
a0=0;
af=2;
T0 = 0;
Tf=7;
Na=2000;
Nt=2000;
da=(af-a0)/(Na-1);
dt=(Tf-T0)/(Nt-1);
a = a0:da:af;
t = T0:dt:Tf;
%a=a0+(0:Na)*da;       
%t=0+(0:Nt)*dt;

%Birth Rate
b0 = zeros(Na,1);
%b0 = ones(Na,1);
%b0(1:Na) = 20000;
b0(fix(Na/10):Na) = 1;
%B = zeros(Na);

%Death rate
%death = @(x) 1/(af+0.01 - x)^2;
%mu = zeros(Na,1);
%for k=1:Na
 %   mu(k) = death(a(k));
%end

%The Matrix
B = [b0, zeros(Na,Na-1)];
A = 1/da * (-eye(Na) + diag(ones(1,Na-1),1)) - B;

%Initial Data
ap = 1.8;
gamma = da^(-.85); 
p0 = @(x)  7*exp(-.5*gamma*(x-ap).^2);
y0 = zeros(Na,1);
for k=1:Na
 y0(k) =  p0(a(k));
 %exp(-(a(k) - 3)^2/.15);
end

y = zeros(Na,Nt);
y(:,1) = y0;

for n=1:Nt-1
    y(:,n+1) = (eye(Na) - dt * A) \ y(:,n);
end
%%
figure
[A,T] = meshgrid(a,t);
clf 
mesh(A,T,y')
xlabel('age'); ylabel('time');
view(0,90)
shading interp
grid off

%%
v = VideoWriter('peaks.mp4','MPEG-4');
open(v);
fig = figure;
ax  = axes('Parent',fig);
t1  = title(ax,'time');
l1 = line(a,y(:,1));
ylim([-5 8])
xlim([0 af])
xlabel('age');
ylabel('q(a)');
for it = 1:2:Nt
l1.YData = y(:,it);
%title(num2str(it))
frame = getframe(fig);
t1.String = ['t =',num2str(t(it))] ;
writeVideo(v,frame);
pause(0.005)
end
close(v)
%%
%figure
%l1 = surf(y');
%shading interp
%view(0,90)
%for it = 1:10:Nt
 %   newy = y';
%newy(it:end,:) = 0;
%l1.ZData = newy;
%title(num2str(it))
%pause(0.01)
%end