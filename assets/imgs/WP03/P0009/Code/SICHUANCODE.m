%% Optimal Control Problem with CasADi on a constrained fractional heat control. 
%% Problem formulation
% Parameters for the problem
clear all;
close all;
clc;
Nx = 60; % Space discretization
Nt = 200; % Time discretization : need to check the CFL condition
C0 = 0; % Bound on the control below
C1 = 1; % Bound on the control above
epsilon=0.001;
saveon=0;

theta=1/3;
INPUT={8,1,theta,30,'M';
       20,1,0,30,'M';
       20,0,theta,60,'M';
       20,0,theta,15,'M';
       20,0,theta,60,'T';
       20,0,theta,400,'Q';
       10,0,1,50,'N';
       20,0,1,100,'N';
       5,0,1,25,'N';
       };
   SZIN=size(INPUT);

DATA=zeros(Nx,Nt+1,SZIN(1));
MU=1;
for l=1:SZIN(1)
       strcat('iterationSTART',num2str(l),'Out of',num2str(SZIN(1)))
      L=INPUT{l,1};
      origin=INPUT{l,2};
      target=INPUT{l,3};
      FinalTime=INPUT{l,4};
      Mode=INPUT{l,5};
      
        xi = 0; xf = L; % Domain of the problem
        xline = linspace(xi,xf,Nx);
        dx = xline(2) - xline(1);

    Y0 = origin*ones(size(xline))'; 
    Y1 = target*ones(size(xline))';
    
     if Mode=='Q'
            opti = casadi.Opti();  % CasADi function
            Y = opti.variable(Nx,Nt+1); % state trajectory
            U = opti.variable(1,Nt+1);   % control
            T=FinalTime;
            g=@(j,k) (Y(j,k)-theta)*(1-Y(j,k));
            for k=1:Nt % loop over control intervals
               for j=2:Nx-1
                  opti.subject_to(dx^2*(Y(j,k+1)-Y(j,k))==(T/Nt)*(MU*(-2*Y(j,k+1)+Y(j+1,k+1)+Y(j-1,k+1))+dx^2*Y(j,k+1)*g(j,k)));
               end
               opti.subject_to(Y(1,k)==U(k));
               opti.subject_to(Y(Nx,k)==U(k));
            end
            opti.subject_to(0<=U(:));         	
            opti.subject_to(U(:)<=1);          	
            opti.subject_to(U(end)<=target+epsilon);
            opti.subject_to(U(end)>=target-epsilon);
            opti.subject_to(Y(:,1)==Y0);
            opti.minimize(sum((Y(:,Nt+1)-Y1).^2)+sum((Y(:,Nt)-Y1).^2));
            for k=1:Nt
                for j=1:Nx
                        opti.set_initial(Y(j,k), origin);
                end
                opti.set_initial(U(k), origin);
            end
            opti.solver('ipopt'); % set numerical backend
            tic
            sol = opti.solve();   % actual solve
            toc
        opti2 = casadi.Opti();  
        Y2 = opti2.variable(Nx,Nt+1); 
        U2 = opti2.variable(1,Nt+1);
        dU = opti2.variable(1,Nt+1);  
        T2 = FinalTime;    
        g2=@(j,k) (Y2(j,k)-theta)*(1-Y2(j,k));
        for k=1:Nt 
            for j=2:Nx-1
                opti2.subject_to(dx^2*(Y2(j,k+1)-Y2(j,k))==(T2/Nt)*(MU*(-2*Y2(j,k+1)+Y2(j+1,k+1)+Y2(j-1,k+1))+dx^2*Y2(j,k+1)*g2(j,k)));
            end
            opti2.subject_to(Y2(1,k)==U2(k));
            opti2.subject_to(Y2(Nx,k)==U2(k));
        end
        opti2.subject_to(0<=U2(:));          
        opti2.subject_to(U2(:)<=1);          
        opti2.subject_to(Y2(:,1)==Y0);
        opti2.subject_to(Y2(:,end)<=Y1+epsilon);
        opti2.subject_to(Y2(:,end)>=Y1-epsilon);
        opti2.subject_to(U2(end)<=theta+epsilon);
        opti2.subject_to(U2(end)>=theta-epsilon);
        for k=1:Nt
                    dU(k)=(T/Nt)^2*(U2(k+1)-U2(k))^2;
        end
        dU(Nt+1)=dU(Nt);
        opti2.minimize(sum(dU)); % minimizing time
        opti2.set_initial(Y2, sol.value(Y));
        opti2.set_initial(U2, sol.value(U));
        opti2.solver('ipopt'); % set numerical backend
        tic
        sol2 = opti2.solve();   % actual solve
        toc
        DATA(:,:,l)=sol2.value(Y2);
    end

    
    %% Optimization problem
    if Mode~='Q'
        opti = casadi.Opti();  % CasADi function
        Y = opti.variable(Nx,Nt+1); % state trajectory
        U1 = opti.variable(1,Nt+1);   % control
        U2 = opti.variable(1,Nt+1);   % control
        T=FinalTime;
        g=@(j,k) (Y(j,k)-theta)*(1-Y(j,k));
        for k=1:Nt % loop over control intervals
           for j=2:Nx-1
              opti.subject_to(dx^2*(Y(j,k+1)-Y(j,k))==(T/Nt)*(MU*(-2*Y(j,k+1)+Y(j+1,k+1)+Y(j-1,k+1))+dx^2*Y(j,k+1)*g(j,k)));
           end
              opti.subject_to(Y(1,k)==U1(k));
              opti.subject_to(Y(Nx,k)==U2(k));
        end
        opti.subject_to(0<=U1(:));         	
        opti.subject_to(U1(:)<=1);
        opti.subject_to(0<=U2(:));         	
        opti.subject_to(U2(:)<=1); 
        opti.subject_to(U1(end)<=target+epsilon);
        opti.subject_to(U1(end)>=target-epsilon);
        opti.subject_to(U2(end)<=target+epsilon);
        opti.subject_to(U2(end)>=target-epsilon);
        opti.subject_to(Y(:,1)==Y0);
        opti.minimize(sum((Y(:,Nt+1)-Y1).^2)+sum((Y(:,Nt)-Y1).^2));
        for k=1:Nt
            for j=1:Nx
                    opti.set_initial(Y(j,k), origin);
            end
            opti.set_initial(U1(k), origin);
                        opti.set_initial(U2(k), origin);

        end
        opti.solver('ipopt'); % set numerical backend
        tic
        sol = opti.solve();   % actual solve
        toc
    end
    if Mode=='M'
        DATA(:,:,l)=sol.value(Y);
        
    end
    if Mode=='T'
        opti2 = casadi.Opti();  
        Y2 = opti2.variable(Nx,Nt+1); 
        U21 = opti2.variable(1,Nt+1);
        U22 = opti2.variable(1,Nt+1);  
        T2 = opti2.variable();     
        g2=@(j,k) (Y2(j,k)-theta)*(1-Y2(j,k));
        for k=1:Nt 
            for j=2:Nx-1
                opti2.subject_to(dx^2*(Y2(j,k+1)-Y2(j,k))==(T2/Nt)*(MU*(-2*Y2(j,k+1)+Y2(j+1,k+1)+Y2(j-1,k+1))+dx^2*Y2(j,k+1)*g2(j,k)));
            end
            opti2.subject_to(Y2(1,k)==U21(k));
            opti2.subject_to(Y2(Nx,k)==U22(k));
        end
        opti2.subject_to(0<=U21(:));          
        opti2.subject_to(U21(:)<=1);
        opti2.subject_to(U21(end)<=theta+epsilon);
        opti2.subject_to(U21(end)>=theta-epsilon);
        opti2.set_initial(U21, sol.value(U1));
        opti2.subject_to(0<=U22(:));          
        opti2.subject_to(U22(:)<=1);
        opti2.subject_to(U22(end)<=theta+epsilon);
        opti2.subject_to(U22(end)>=theta-epsilon);
        opti2.set_initial(U22, sol.value(U2));
        opti2.subject_to(0<=T2);
        opti2.subject_to(Y2(:,1)==Y0);
        opti2.subject_to(Y2(:,end)<=Y1+epsilon);
        opti2.subject_to(Y2(:,end)>=Y1-epsilon);
        opti2.minimize(max(T2,0)); % minimizing time
        opti2.set_initial(Y2, sol.value(Y));
        opti2.set_initial(T2, FinalTime);
        opti2.solver('ipopt'); % set numerical backend
        tic
        sol2 = opti2.solve();   % actual solve
        toc
        DATA(:,:,l)=sol2.value(Y2);
        MINT(l)=sol2.value(T2);

    end
    if Mode=='N'
        opti2 = casadi.Opti();  
        Y2 = opti2.variable(Nx,Nt+1); 
        U21 = opti2.variable(1,Nt+1);
        U22 = opti2.variable(1,Nt+1);
        dU = opti2.variable(1,Nt+1);  
        T2 = FinalTime;     
        g2=@(j,k) (Y2(j,k)-theta)*(1-Y2(j,k));
        for k=1:Nt 
            for j=2:Nx-1
                opti2.subject_to(dx^2*(Y2(j,k+1)-Y2(j,k))==(T2/Nt)*(MU*(-2*Y2(j,k+1)+Y2(j+1,k+1)+Y2(j-1,k+1))+dx^2*Y2(j,k+1)*g2(j,k)));
            end
            opti2.subject_to(Y2(1,k)==U21(k));
            opti2.subject_to(Y2(Nx,k)==U22(k));
        end
        opti2.subject_to(0<=U21(:));          
        opti2.subject_to(U21(:)<=1);
        opti2.subject_to(0<=U22(:));          
        opti2.subject_to(U22(:)<=1);  
        opti2.subject_to(Y2(:,1)==Y0);
        opti2.subject_to(Y2(:,end)<=Y1+epsilon);
        opti2.subject_to(Y2(:,end)>=Y1-epsilon);
        opti2.subject_to(U21(end)<=theta+epsilon);
        opti2.subject_to(U21(end)>=theta-epsilon);
        opti2.subject_to(U22(end)<=theta+epsilon);
        opti2.subject_to(U22(end)>=theta-epsilon);
        for k=1:Nt+1
                    dU(k)=dx^2*(Y2(1,k)-Y2(2,k))^2+dx^2*(Y2(Nx,k)-Y2(Nx-1,k))^2;
        end
        opti2.minimize(sum(dU)); % minimizing time
        opti2.set_initial(Y2, sol.value(Y));
        opti2.set_initial(U21, sol.value(U1));
        opti2.set_initial(U22, sol.value(U2));
        opti2.solver('ipopt'); % set numerical backend
        tic
        sol2 = opti2.solve();   % actual solve
        toc
        DATA(:,:,l)=sol2.value(Y2);
        
    end




end

save('fuckingdata');

% INPUT={8,1,theta,30,'M';
%        20,1,0,30,'M';
%        20,0,theta,60,'M';
%        20,0,theta,15,'M';
%        20,0,theta,60,'T';
%        20,0,theta,400,'Q';
%        10,0,1,50,'N';
%        20,0,1,100,'N';
%        5,0,1,25,'N';
%        };
for l=1:SZIN(1)
    
    F1=figure;
reset(gca);
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
    surf((DATA(:,:,l))'); shading interp; view(2)
    colormap('jet');
    colorbar
    %caxis([0 1])
    set(F1,'PaperSize',[6 5]); %set the paper size to what you want 
    ylim([0, Nt]);
    set(gca,'FontSize',15)
    xlabel('$x$','interpreter','latex','fontsize',20);
    ylabel('$t$','interpreter','latex','fontsize',20);       
    xticks([0 Nx])
    xticklabels({'0',num2str(INPUT{l,1})});
               % set(ticsS,'Interpreter','latex');
            yticks([0 Nt])
    if INPUT{l,5}~='T'
    yticklabels({'0',num2str(INPUT{l,4})})
    end
    if INPUT{l,5}=='T'
    yticklabels({'0',num2str(MINT(l))})
    end
         title('Controlled state','interpreter','latex','fontsize',20);
    filename=strcat('ContrState','-',num2str(l),'.pdf')
print(F1,filename,'-dpdf');


F2=figure
reset(gca);
set(groot,'defaultAxesTickLabelInterpreter','latex'); 
    if INPUT{l,5}=='Q'
    plot((DATA(1,:,l))','b','LineWidth',2.5); 
    set(F2,'PaperSize',[6 5]); %set the paper size to what you want 
    xlim([0, Nt]);
    set(gca,'FontSize',15)
    xlabel('$t$','interpreter','latex','fontsize',20);
    ylabel('$a$','interpreter','latex','fontsize',20);       

               % set(ticsS,'Interpreter','latex');
        xticks([0 Nt])
        if INPUT{l,5}~='T'
            xticklabels({'0',num2str(INPUT{l,4})})
        end
        if INPUT{l,5}=='T'
            xticklabels({'0',num2str(MINT(l))})
        end
              title('Control','interpreter','latex','fontsize',20);
    filename2=strcat('Contr','-',num2str(l),'.pdf')

            
    end
    
    if INPUT{l,5}~='Q'
    plot((DATA(1,:,l))','b','LineWidth',2.5); 
    hold on
        plot((DATA(1,:,l))','r','LineWidth',2.5); 
    set(F2,'PaperSize',[6 5]); %set the paper size to what you want 
    xlim([0, Nt]);
    set(gca,'FontSize',15)
    xlabel('$t$','interpreter','latex','fontsize',20);
    ylabel('$a$','interpreter','latex','fontsize',20);       
               % set(ticsS,'Interpreter','latex');
        xticks([0 Nt])
        if INPUT{l,5}~='T'
            xticklabels({'0',num2str(INPUT{l,4})})
        end
        if INPUT{l,5}=='T'
            xticklabels({'0',num2str(MINT(l))})
        end 
                      title('Control','interpreter','latex','fontsize',20);
    filename2=strcat('Contr','-',num2str(l),'.pdf')

    end
    
    

    
print(F2,filename2,'-dpdf');
    

F3=figure
reset(gca);
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(gca,'FontSize',15)
set(F3,'PaperSize',[6 5]); %set the paper size to what you want 
    for i=1:Nt
        if(rem(i,Nt/20)==0)
            COLOR=(20-20/Nt*i)/20*[1 0 0];
            plot(DATA(:,i,l),'Color',COLOR);
            hold on;
        end
    end
set(gca,'FontSize',15)

xlabel('$x$','interpreter','latex','fontsize',20);
%ylabel('state','interpreter','latex','fontsize',20);
xticks([0 Nx]);
xticklabels({'0', num2str(INPUT{l,1})})

%yticks([0 theta 1]);
ylim([-0.05 1.05]);
%yticklabels({'0', '\theta', '1'})


    title('State','interpreter','latex','fontsize',20);
    filename3=strcat('State','-',num2str(l),'.pdf')

    print(F3,filename3,'-dpdf');

    
    
    pause(1)
end
  

% INPUT={8,1,theta,30,'M';
%        20,1,0,30,'M';
%        20,0,theta,60,'M';
%        20,0,theta,15,'M';
%        20,0,theta,60,'T';
%        20,0,theta,400,'Q';
%        10,0,1,50,'N';
%        20,0,1,100,'N';
%        5,0,1,25,'N';
%        };

F4=figure
reset(gca);
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(gca,'FontSize',15)
set(F4,'PaperSize',[6 5]); %set the paper size to what you want 
plot(DATA(:,end-1,2),'b','LineWidth',2);
set(gca,'FontSize',15)
xlabel('$x$','interpreter','latex','fontsize',20);
%ylabel('state','interpreter','latex','fontsize',20);
xticks([0 Nx]);
xticklabels({'0', num2str(INPUT{2,1})})
%yticks([0 theta 1]);
ylim([-0.05 1.05]);
%yticklabels({'0', '\theta', '1'})
    title('Barrier','interpreter','latex','fontsize',20);
    filename4=strcat('Barrier1D','.pdf')
    print(F4,filename4,'-dpdf');






