%% scrip phase portrait
close all;
clear all;

%strategy phase portrait
filenameP1='L12-01';
%stationary solution [0,L]
filenameP2='L12-022';
% not used

onoff=0;
saveon=0;

L=100;
theta=0.30;
controlTO=0;
init=theta;


% number of steady states ploted
NS=500;
NPh=50;

theta1=2/3*(theta+1)-1/3*sqrt(4*theta^2-10*theta+4);
dato=sqrt(2*((theta+1)/3-theta/2-1/4))

%define equations
tspan = linspace(0,L/2,200);
y0 = [init; 0];
[~, Y5] = ode113(@functionALLEE,tspan,y0);
Y5=Y5';
%tspan = linspace(0,L/2,200);
%y0 = [0.001; 0];
[~, Y6] = ode113(@functionALLEE2,tspan,y0);
Y6=Y6';

%% Continuum of steady states

AAA=linspace(Y6(1,1),controlTO,NS);

tspan = linspace(0,L/2,200);
    for i=1:NS
            y0 = [AAA(i); 0];
            [~, CP] = ode113(@functionALLEE,tspan,y0);
            CSU{i}=CP';
            [~, CP] = ode113(@functionALLEE2,tspan,y0);
            CSD{i}=fliplr(CP');
            
    end

%% Separatrix
F=@(u) u.^2.*(-1/4*u.^2+(theta+1)/3*u-theta/2);
%F=@(u) -u.^2.*(+1/3*u-1/2);
theta1=2/3*(theta+1)-1/3*sqrt(4*theta^2-10*theta+4);
%theta1=-2/3*(theta+1)+1/3*sqrt(4*theta^2-10*theta+4);
uspan0=linspace(0,theta1,50);
%uspan0=linspace(0,0,500);
uspan1=linspace(0,1,500);
v0plus=@(u)sqrt(2*(F(0)-F(u)));
v0minus=@(u)-sqrt(2*(F(0)-F(u)));
v1plus=@(u)sqrt(2*(F(1)-F(u)));
v1minus=@(u)-sqrt(2*(F(1)-F(u)));


tspanSP = linspace(0,40,2000);
y0 = [theta1; 0];
[~, YYS1] = ode113(@functionALLEE,tspanSP,y0);
[~, YYS2] = ode113(@functionALLEE2,tspanSP,y0);
% Y4=y.y;
YYS1=YYS1';
YYS2=YYS2';

%section separatrix
y0 = [theta1; 0];
tspanSecP = linspace(0,L/2,200);
[~, YYSec2] = ode113(@functionALLEE,tspanSecP,y0);
[~, YYSec1] = ode113(@functionALLEE2,tspanSecP,y0);
YYSec2=fliplr(YYSec2');
YYSec1=YYSec1';

%% STRATEGY IN THE PHASE PORTRAIT
xspan=linspace(AAA(1),theta,100);
%recta=v(xspan);


y0 = [0.16; 0];
y = ode113(@functionALLEE,tspan,y0);
Y8=y.y;
y0 = [0.16; 0];
y = ode113(@functionALLEE2,tspan,y0);
Y88=y.y;


tspan = linspace(0,35,2000);
y0 = [0.01; -0.001];
[~, Y] = ode113(@functionALLEE,tspan,y0);
%Y=y.y;
Y=Y';


PP=figure;
hold on
    for i=1:NS
        CSplotU=CSU{i};
        CSplotD=CSD{i};

        if onoff==1
                    plot(CSplotU(1,:),CSplotU(2,:),'k');
                    plot(CSplotD(1,:),CSplotD(2,:),'k');

        end
        hold on
        plot(CSplotU(1,end),CSplotU(2,end),'r*');
        plot(CSplotD(1,1),CSplotD(2,1),'r*');

    end        
    
    xlim([-0.3 1]);
    ylim([-0.3 0.3]);

    line([1 1],[-2,2]);
    line([0 0],[-2,2]);
    hold on

    plot(uspan0,v0plus(uspan0),'k','LineWidth',2);
plot(uspan0,v0minus(uspan0),'k','LineWidth',2);
plot(uspan1,v1plus(uspan1),'k','LineWidth',2);
plot(uspan1,v1minus(uspan1),'k','LineWidth',2);
    title('Control Strategy in the Phase Portrait');
    xlabel('u');
    ylabel('u_x');
    if saveon==1
            set(PP,'PaperSize',[6 5]); %set the paper size to what you want 
            print(PP,filenameP1,'-dpdf');
    end
    
PST=figure;
for i=1:NS
    hold on
    CSplotU=CSU{i};
    CSplotD=CSD{i};
    szU=size(CSplotU);
    szU=szU(2);
    szD=size(CSplotU);
    szD=szD(2);
    tspanD=linspace(0,L/2,szU);
    tspanU=linspace(L/2,L,szD);
    COLOR=(NS-i)/NS*[0.6,0.6,0.6];
    plot(tspanU,CSplotU(1,:),'Color',COLOR);
    plot(tspanD,CSplotD(1,:),'Color',COLOR);
end
    sz=size(Y5);
    sz=sz(2);
    tspan=linspace(0,L/2,sz);
    plot(tspan,fliplr(Y5(1,:)),'g','LineWidth',2);
    sz=size(Y6);
    sz=sz(2);
    tspan=linspace(L/2,L,sz);
    plot(tspan,Y6(1,:),'g','LineWidth',2);
    
    tspan=linspace(0,L,30);
    C=theta*ones(30,1);
    plot(tspan,C,'b--','LineWidth',2);
    


    title('Control Strategy in [0,L]');
    xlabel('Space');
    ylabel('u');
    if saveon==1
            set(PST,'PaperSize',[6 5]); %set the paper size to what you want  
            print(PST,filenameP2,'-dpdf')
    end

    
