%% scrip phase portrait

filenameP1='1';
filenameP2='2';
filenameP3='3';

% functions1=@functionALLEE;
% functions2=@functionALLEE2;
 functions1=@functionKPP;
 functions2=@functionKPP2;

 
 
L=20;
%theta=0.33;
onoff=1;

% number of steady states ploted
NS=50;
NPh=20;


%theta1=2/3*(theta+1)-1/3*sqrt(4*theta^2-10*theta+4);
%dato=sqrt(2*((theta+1)/3-theta/2-1/4));


%define equations
tspan = linspace(0,L/2,200);
y0 = [0.00001; 0];
y = ode113(functions1,tspan,y0);
Y5=y.y;
%tspan = linspace(0,L/2,200);
%y0 = [0.001; 0];
y = ode113(functions2,tspan,y0);
Y6=y.y;


%F=figure
%hold on
%plot(Y5(1,:),Y5(2,:),'g')
%plot(Y6(1,:),Y6(2,:),'m')
%xspan=linspace(0.01,theta,100);
v=@(y)(Y6(2,end))/(Y6(1,end)-theta).*y-theta.*Y6(2,end)./(Y6(1,end)-theta);
%recta=v(xspan);
%plot(xspan,recta,'r');
%xlim=[-0.1 0.6]


%% Continuum of steady states off when KPP

% AAA=linspace(Y6(1,end),theta,NS);
% tspan = linspace(0,L,200);
%     for i=1:NS
%             y0 = [AAA(i); v(AAA(i))];
%             [~, CP] = ode113(functions1,tspan,y0);
%             CS{i}=CP';
%     end

%% Separatrix OFF KPP
%theta=0.33;
% tspanSP = linspace(0,100,2000);
% y0 = [theta1; 0];
% [~, YYS1] = ode113(functions1,tspanSP,y0);
% [~, YYS2] = ode113(functions2,tspanSP,y0);
% % Y4=y.y;
% YYS1=YYS1';
% YYS2=YYS2';

%section separatrix OFF when KPP
% y0 = [theta1; 0];
% %tspanSecP = linspace(0,L/2,200);
% tspanSecP = linspace(0,L/2,200);
% [~, YYSec2] = ode113(functions1,tspanSecP,y0);
% [~, YYSec1] = ode113(functions2,tspanSecP,y0);
% YYSec2=fliplr(YYSec2');
% YYSec1=YYSec1';

%plots
%% OFF when KPP
%     %Solutions above/below
%     tspan = linspace(0,20,2000);
%     dato=sqrt(2*((theta+1)/3-theta/2-1/4))
%     y0 = [0; dato];
%     [~, YYSU] = ode113(functions1,tspan,y0);
%     y0 = [0; -dato];
%     [~, YYSD] = ode113(functions2,tspan,y0);
%     YYSU=YYSU';
%     YYSD=YYSD';
    
    
% FIG=figure%     tspan = linspace(0,20,2000);
%     dato=sqrt(2*((theta+1)/3-theta/2-1/4))
%     y0 = [0; dato];
%     [~, YYSU] = ode113(@functionALLEE,tspan,y0);
%     y0 = [0; -dato];
%     [~, YYSD] = ode113(@functionALLEE2,tspan,y0);
%     YYSU=YYSU';
%     YYSD=YYSD';
    
%     
% FIG=figure
% Ps=size(YYSec2);
% Ps=Ps(2);
% tspanSP=linspace(-50,50,Ps);
% plot(tspanSP,YYSec2(1,:));
% hold on;
% tspanSP=linspace(-50,50,Ps);
% plot(tspanSP,fliplr(YYSec(1,:)));

% Ps=size(YYSU);
% Ps=Ps(2);
% tspanSP=linspace(-50,50,Ps);
% plot(tspanSP,YYSU(1,:));
% hold on;
% tspanSP=linspace(-50,50,Ps);
% plot(tspanSP,fliplr(YYSU(1,:)));

%% STRATEGY IN THE PHASE PORTRAIT OFF when KPP
% xspan=linspace(AAA(1),theta,100);
% recta=v(xspan);
% 
% PP=figure;
%     for i=1:NS
%         CSplot=CS{i};
%         if onoff==1
%                     plot(CSplot(1,:),CSplot(2,:),'k');
%         end
%         hold on
%         plot(CSplot(1,end),CSplot(2,end),'r*');
%     end
%     plot(xspan,recta,'r');
%     xlim([0 theta1]);
%     %ylim([-0.105 0.105]);
%     ylim([-0.2 0.2]);
% 
%     plot(Y5(1,:),Y5(2,:),'g');
%     plot(Y6(1,:),Y6(2,:),'g');
%     plot(YYS1(1,:),YYS1(2,:),'r');
%     plot(YYS2(1,:),YYS2(2,:),'r');
%     title('Control Strategy in the Phase Portrait');
%     xlabel('u');
%     ylabel('u_x');
%     set(PP,'PaperSize',[6 5]); %set the paper size to what you want  
%     print(PP,filenameP1,'-dpdf')
     
% %% STRATEGY SEEING THE STATIONARY SOLUTIONS
% PST=figure;
% for i=1:NS
%     hold on
% %     CSplot=CS{i};
% %     sz=size(CSplot);
% %     sz=sz(2);
% %     tspan=linspace(0,L,sz);
% %     COLOR=(NS-i)/NS*[0.6,0.6,0.6];
% %     plot(tspan,CSplot(1,:),'Color',COLOR);
% end
% %     sz=size(Y5);
% %     sz=sz(2);
% %     tspan=linspace(0,L/2,sz);
% %     plot(tspan,Y5(1,:),'g','LineWidth',2);
% %     sz=size(Y6);
% %     sz=sz(2);
% %     tspan=linspace(L/2,L,sz);
% %     plot(tspan,Y6(1,:),'g','LineWidth',2);
% %     
%     sz=size(YYSec2);
%     sz=sz(2);
%     tspan=linspace(0,L/2,sz);
%     plot(tspan,YYSec2(1,:),'r','LineWidth',2);
%     sz=size(YYSec1);
%     sz=sz(2);
%     tspan=linspace(L/2,L,sz);
%     plot(tspan,YYSec1(1,:),'r','LineWidth',2);
%     
%     tspan=linspace(0,L,30);
%     C=theta*ones(30,1);
%     plot(tspan,C,'b--','LineWidth',0.5);
%     
%     tspan=linspace(0,L,30);
%     CC=theta1*ones(30,1);
%     plot(tspan,CC,'r--','LineWidth',0.5);
%     
%         tspan = linspace(0,20,2000);
%     dato=sqrt(2*((theta+1)/3-theta/2-1/4))
%     
%     
% F=@(u) u.^2.*(-1/4*u.^2+(theta+1)/3*u-theta/2);
% 
% v1plus=@(u)sqrt(2*(F(1)-F(u)));
%     v1minus=@(u)-sqrt(2*(F(1)-F(u)));
%     
%     %y0 = [0; dato];
%     y0 = [0.9; v1plus(0.9)];
%     %y0 = [0; dato];
% % 
% %     [~, YYSU] = ode113(@functionALLEE,tspan,y0);
% %      y0 = [0.9; v1plus(0.9)];
% %     %y0 = [0; dato];
% % 
% %     [~, YYSU2] = ode113(@functionALLEE2,tspan,y0);
%     y0 = [0; -dato];
%     [~, YYSD] = ode113(functions2,tspan,y0);
%     YYSU=YYSU';
%     YYSD=YYSD';
%     
% %     sz=size(YYSU);
% %     sz=sz(2);
% %     tspan=linspace(0,L,sz);
% %     plot(tspan,YYSU(1,:),'r','LineWidth',2);
%     
%      sz=size(YYSD);
%     sz=sz(2);
%     tspan=linspace(0,L,sz);
%     %plot(tspan,YYSD(1,:),'r','LineWidth',2);
% 
% %     title('Control Strategy in [0,L]');
%     title('Maximum stationary solution in Gamma');
%     xlabel('Space');
%     ylabel('u');
%     
%     set(PST,'PaperSize',[6 5]); %set the paper size to what you want  
%     print(PST,filenameP2,'-dpdf')




%% PHASE PORTRAIT
%PHpos=linspace(0,dato,NPh);
dato=sqrt(1/3);
PHpos=linspace(0,dato,NPh);
tspan = linspace(0,20,200);
    for i=1:NPh
            y0 = [0; PHpos(i)];
            [~, PHPrt] = ode113(functions1,tspan,y0);
            PHPR{i}=PHPrt';
    end

    %off if kpp
% PHpos=linspace(0.01,theta1-0.01,NPh);
% tspan = linspace(0,40,200);
%     for i=NPh+1:2*NPh
%             y0 = [PHpos(i-NPh); 0];
%             [~, PHPrt] = ode113(functions1,tspan,y0);
%             PHPR{i}=PHPrt';
%     end
%     
    
    %Solutions above/below off when KPP
%     tspan = linspace(0,20,2000);
%     dato=sqrt(2*((theta+1)/3-theta/2-1/4))
%     y0 = [0; dato];
%     [~, YYSU] = ode113(functions1,tspan,y0);
%     y0 = [0; -dato];
%     [~, YYSD] = ode113(functions2,tspan,y0);
%     YYSU=YYSU';
%     YYSD=YYSD';
F=@(u) -u.^2.*(+1/3*u-1/2);
v0plus=@(u)sqrt(2*(F(0)-F(u)));
v0minus=@(u)-sqrt(2*(F(0)-F(u)));

v1plus=@(u)sqrt(2*(F(1)-F(u)));
v1minus=@(u)-sqrt(2*(F(1)-F(u)));

uspan0=linspace(0,0,500);
uspan1=linspace(-0.5,2,500);

PPhase=figure;
    %for i=1:2*NPh
            for i=1:NPh

        Phplot=PHPR{i};
        plot(Phplot(1,:),Phplot(2,:),'r');
        hold on
    end
    %plot(YYS1(1,:),YYS1(2,:),'r');
    %plot(YYS2(1,:),YYS2(2,:),'r');
    %plot(YYS1(1,:),YYS1(2,:),'r','LineWidth',2)
    %plot(YYS2(1,:),YYS2(2,:),'r','LineWidth',2)
    %plot(YYSU(1,:),YYSU(2,:),'r','LineWidth',2)
    %plot(YYSD(1,:),YYSD(2,:),'r','LineWidth',2)
    plot(uspan0,v0plus(uspan0),'k','LineWidth',2);
plot(uspan0,v0minus(uspan0),'k','LineWidth',2);
plot(uspan1,v1plus(uspan1),'k','LineWidth',2);
plot(uspan1,v1minus(uspan1),'k','LineWidth',2);
    xlim([-0.51 1.5]);
    %ylim([-dato-0.1 dato+0.1]);
    %ylim([-0.2 0.2]);
    ylim([-dato-0.05 dato+0.05]);
    line([1 1],[-2,2]);
    line([0 0],[-2,2]);


    title('Phase Portrait','interpreter','latex','fontsize',20);
    xlabel('$u$','interpreter','latex','fontsize',20');
    ylabel('$u_x$','interpreter','latex','fontsize',20);
    
    set(PPhase,'PaperSize',[6 5]); %set the paper size to what you want  
    print(PPhase,filenameP3,'-dpdf')
    
