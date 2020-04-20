NS=100;
N=100;
L=10;
sigma=40;
function1=@geneALLEE;
theta=0.33;
saveon=0;
%E=@(u,v)0.5*v^2+F

theta=0.33;
theta1=2/3*(theta+1)-1/3*sqrt(4*theta^2-10*theta+4);



theta=0.33;
F=@(u) u.^2.*(-1/4*u.^2+(theta+1)/3*u-theta/2);


v0plus=@(u)sqrt(2*(F(0)-F(u)));
v0minus=@(u)-sqrt(2*(F(0)-F(u)));

v1plus=@(u)sqrt(2*(F(1)-F(u)));
v1minus=@(u)-sqrt(2*(F(1)-F(u)));



% Ns=NS;
% 
% figure(1)
% a=linspace(1-0.1,0,Ns);
% tspan=linspace(0,L,N);
% for i=1:Ns
%     init=[a(i),0];
%     [tt,Y5]=ode45(function1,tspan,init);
%     plot([-tt ;tt],[Y5(:,1) ;Y5(:,1)],'*');
%     xlim([-L L]);
%     ylim([0 2]);
%     title(strcat('a=',num2str(a(i))));
%     pause(0.1);
% end

for i=1:NS
a(i)=i/NS;
    init=[a(i),0];
    tspan = linspace(0,L,1000);

    [tt,Y5]=ode45(function1,tspan,init);
    %tt=tspan';
    
% target=[a,0];
% 
% y0 = target;
%[times, Y5] = ode45(functions1,tspan,y0);
data(i).u = Y5(:,1);
data(i).ux = Y5(:,2);
data(i).L=tt;
Y5=Y5';

%%% Trial
%Y5(:,end);
% radialsol=@(r)interp1(tt,Y5(1,:),r);
%angle=(0:1:360)*pi/180;
%[ang,r]=meshgrid(angle,times);
%r=tt;

%data(i).xms = r.*cos(ang);
%data(i).yms = r.*sin(ang);
% data(i).xms = r;
% data(i).zms = radialsol(r);


end

for i=1:NS
        plot([-data(i).L data(i).L],[data(i).u  data(i).u],'b');
            ylim([0 1]);
        pause(0.1);

end



F11=figure
    plot(data(10).u,data(10).ux,'k','LineWidth',2);
                            set(gca,'FontSize',15)

    hold;
    xlim([-0.1 1.1]);
    ylim([-0.45 0.45]);
    title(strcat('a=',num2str(a(i))));
    TT=linspace(-1,theta1,100);
    plot(TT,v0plus(TT),'b','LineWidth',2.5);
    hold on
    plot(TT,v0minus(TT),'b','LineWidth',2.5);
    TT2=linspace(-1,2,100);
    line([1 1],[-2,2]);
    line([theta theta],[-2,2],'Color',[0.5 0.5 0.5],'LineStyle','--');
    line([0 0],[-2,2]);
    xticks([0 theta 1])
    xticklabels({'0','$\theta$','1'})
    plot(TT2,v1plus(TT2),'r','LineWidth',2);
    hold on
    plot(TT2,v1minus(TT2),'r','LineWidth',2);
    xlabel('$u$','interpreter','latex','fontsize',20);
    ylabel('$u_x$','interpreter','latex','fontsize',20);
    filenameP2=strcat('Drift-L=',num2str(L),'a1');
    title(strcat('Trajectory for $a$=',num2str(a(1),'%.2f')),'interpreter','latex','fontsize',20);
    if saveon==1
      set(F11,'PaperSize',[6 5]); %set the paper size to what you want 
      print(F11,filenameP2,'-dpdf');
    end
    
F12=figure


    plot(data(10).L,data(10).u,'b','LineWidth',2.5);
    reset(gca);
                        set(gca,'FontSize',15)
    hold on;
    plot(-data(10).L,data(10).u,'b','LineWidth',2.5);
    ylim([0 1]);
    yticks([0 theta 1]);
    yticklabels({'0','$\theta$','1'});
    xlabel('$x$','interpreter','latex','fontsize',20);
    ylabel('$u$','interpreter','latex','fontsize',20);
    title(strcat('Nontrivial solution, $\sigma=$',num2str(sigma)),'interpreter','latex','fontsize',20);
    filenameP2=strcat('Nontrivial-Drift-L=',num2str(L),'a1');
    if saveon==1
      set(F12,'PaperSize',[6 5]); %set the paper size to what you want 
      print(F12,filenameP2,'-dpdf');
    end


F21=figure
    plot(data(NS/2).u,data(NS/2).ux,'k');
    hold on;
    xlim([-1 2]);
    ylim([-1 1]);
    TT=linspace(-1,theta1,100);
    plot(TT,v0plus(TT),'b','LineWidth',2);
    hold on
    plot(TT,v0minus(TT),'b','LineWidth',2);
    TT2=linspace(-1,2,100);
    line([1 1],[-2,2]);
    line([theta theta],[-2,2],'Color',[0.5 0.5 0.5],'LineStyle','--');
    line([0 0],[-2,2]);
    xticks([0 theta 1])
    xticklabels({'0','\theta','1'})
    plot(TT2,v1plus(TT2),'r','LineWidth',2);
    hold on
    plot(TT2,v1minus(TT2),'r','LineWidth',2);
    xlabel('u');
    ylabel('u_x');
    filenameP2=strcat('Drift-L=',num2str(L),'a2');
    title(strcat('Trajectory for a=',num2str(a(NS/2),'%.4f')));
     if saveon==1
      set(F21,'PaperSize',[6 5]); %set the paper size to what you want 
      print(F21,filenameP2,'-dpdf');
     end
    
F22=figure
    plot(data(NS/2).L,data(NS/2).u,'b');
    hold on;
    plot(-data(NS/2).L,data(NS/2).u,'b');
    ylim([0 1]);
    yticks([0 theta 1]);
    yticklabels({'0','\theta','1'});
    xlabel('x');
    ylabel('u');
    title('Non trivial solution');
    filenameP2=strcat('Nontrivial-Drift-L=',num2str(L),'a2');
    if saveon==1
      set(F22,'PaperSize',[6 5]); %set the paper size to what you want 
      print(F22,filenameP2,'-dpdf');
    end




% for i=1:Ns
%     F(i)=figure
%     plot(Y5(:,1),Y5(:,2),'k');
%     xlim([-1 2]);
%     ylim([-1 1]);
%     title(strcat('a=',num2str(a(i))));
%     pause(0.1);
%     TT=linspace(-1,theta1,100);
%     plot(TT,v0plus(TT),'b','LineWidth',2);
%     hold on
%     plot(TT,v0minus(TT),'b','LineWidth',2);
%     TT2=linspace(-1,2,100);
%     line([1 1],[-2,2]);
%     line([theta theta],[-2,2],'Color',[0.5 0.5 0.5],'LineStyle','--');
%     line([0 0],[-2,2]);
%     xticks([0 theta 1])
%     xticklabels({'0','\theta','1'})
%     plot(TT2,v1plus(TT2),'r','LineWidth',2);
%     hold on
%     plot(TT2,v1minus(TT2),'r','LineWidth',2);
%     xlabel('u');
%     ylabel('u_x');
%     
% filenameP2=strcat('Stationary solution for R=',num2str(L),' a=',num2str(a,'%.4f'))
%         title(strcat('Stationary solution for R=',num2str(L),' a=',num2str(a,'%.4f')));
%      if saveon==1
%       set(F(i),'PaperSize',[6 5]); %set the paper size to what you want 
%       print(F(i),filenameP2,'-dpdf');
%     end
% end
% % 
% % 
% % Ffinal=figure
% %     TT=linspace(-1,theta1,100);
% %     TT2=linspace(-1,2,100);
% % plot(TT,v0minus(TT),'b','LineWidth',2);
% % 
% % iplot =     plot([data(1).u TT],[data(1).ux v0minus(TT)]);
% 
% zlim([-0.1 1]);
% 
% colormap('jet');
% colorbar
% %caxis([0 theta1]);
% caxis([0 theta1]);
%     xlabel('x');
%     ylabel('y');
%     zlabel('u');
% shading interp
% isurf.Parent.Color = 'none' 
% for i=1:NS
%     a=theta/(NS)*i;
% 
% %     isurf.XData = data(i).xms;
% %     isurf.YData = data(i).yms;
%     isurf.ZData = data(i).zms;
% 
%         title(strcat('Stationary solution for R=',num2str(L),' a=',num2str(a,'%.4f')));
% filenameP2=strcat('ContPath',num2str(L),num2str(a,'%.4f'))
% if saveon==1
%     if rem(i,100)==0
%       set(Ffinal,'PaperSize',[6 5]); %set the paper size to what you want 
%       print(Ffinal,filenameP2,'-dpdf');
%     end
% end
% 
%     %pause(0.01)
% end
% 
% 
% %%
% 
% 
% 
% 
% 
