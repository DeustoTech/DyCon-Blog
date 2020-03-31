close all;
clear all;
epsilon=10^(-10);
%J=@(alpha,lambda,theta) alpha.^2.*(1/4*(1+lambda*theta)-lambda*alpha*(4*theta+4)/(9*pi)+lambda*3*alpha.^2/32);

filename1='05boundary0';
filename2='05xsmall-theta';
filename5='05xcrit-theta';
filename3='05xmiddle-theta';
filename4='05xhigh-theta';
saveon=0;

theta=0.33;
theta1=2/3*(theta+1)-1/3*sqrt(4*theta^2-10*theta+4);

F=@(u) u.^2.*(-1/4*u.^2+((theta+1)/3)*u-theta/2);
df=@(u) -3*u.^2+2*(1+theta)*u-theta;
s=(1+theta)/3;
val_a=[0,0.3];val_a=[0,0.3];


FFa= @(alpha,beta,a) integral(@(x)F(alpha.*sin(x.*pi)+beta.*sin(3*x.*pi)+a)-F(a),0,1,'ArrayValued',true);
Ja=@(alpha,beta,lambda,a) 0.25*pi^2*alpha.^2+(9/4)*pi^2*beta.^2-lambda*FFa(alpha,beta,a);
%J=@(alpha,beta,lambda) Ja(alpha,beta,lambda,0);

%FF= @(alpha,beta) integral(@(x)F(alpha.*sin(x.*pi)+beta.*sin(3*x.*pi)),0,1,'ArrayValued',true);
%J=@(alpha,beta,lambda) 0.25*pi^2*alpha.^2+(9/4)*pi^2*beta.^2-lambda*FF(alpha,beta);


%changed and multiplied by 2 after the mistake
LBtheta=pi^2/df(s);
UBtheta=min(pi^2/df(theta),4/(F(1)-F(theta)));
UB0=8*(F(1)-F(theta))/(F(1)^2);
%UB0=500;
%val_a=[0,0.1,0.2,0.3,0.4,0.5];
%val_a=[0,0.1,0.15,0.2,0.25,0.3];
%val_a=[0,0.3];
%val_a=[0.3];

lamb1=LBtheta/2;
lamb2=(1*UBtheta+1*LBtheta);
lamb3=2*UB0;
lamb3=10*UBtheta;

%lamb4=LBtheta/2.4
lamb4=(0.3*UBtheta+0.7*LBtheta);

%%
F1=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,2*UB0,0);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([-20 10]);
            shading interp;
            view(2);
            %caxis([0 theta1])
            
            F2=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,2*UB0,0.1);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([-20 10]);
            shading interp;
            view(2);
            %caxis([0 theta1])
            
            F3=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,2*UB0,0.2);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([-20 10]);
            shading interp;
            view(2);
            %caxis([0 theta1])
            
                        F4=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,2*UB0,0.3);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([-20 10]);
            shading interp;
            view(2);
            %caxis([0 theta1])

            F5=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y2 =@(x,y) Ja(x,y,2*UB0,theta);
surf(X,Y,y2(X,Y));
colormap('jet');
            colorbar
            caxis([-20 10]);
            shading interp;
            view(2);
            %caxis([0 theta1])


%title(strcat('Value of J for $\lambda$=',num2str(lamb1)),'Interpreter','latex');
%xlabel('$\alpha$','Interpreter','latex') % y-axis label

%%
a=0;
cmin=-2.1;
cmax=10;
NN=30;
lambdas=linspace(1/10*LBtheta,2*UB0,NN)

F11=figure;
for i=1:length(lambdas)
    %filename=strcat('FE1E3-a',num2str(a),'lamb',num2str(i),'.pdf');
    filename=strcat('FE1E3-a',num2str(a),'lamb',num2str(i),'.png');
alphas = linspace(-1,1.5,200);
betas = linspace(-1,1,201);
[X,Y]=meshgrid(alphas,betas);
 y3 =@(x,y) Ja(x,y,lambdas(i),a).*(abs(Ja(x,y,lambdas(i),a))<=1)+(abs(Ja(x,y,lambdas(i),a))>1).*sign(Ja(x,y,lambdas(i),a)).*(abs(Ja(x,y,lambdas(i),a)).^(1/3));
surf(X,Y,y3(X,Y));
colormap('jet');
xlim([-1 1.5]);
ylim([-1 1]);
            colorbar
            caxis([cmin cmax]);
            shading interp;
            view(2);
            set(gca,'FontSize',25)
            %caxis([0 theta1])
            title(strcat('$\lambda$=',num2str(lambdas(i),4),', $a$=',num2str(a)),'interpreter','latex','fontsize',30);
            xlabel('e_1','fontsize',30);
            ylabel('e_3','fontsize',30);
            pause(0.15)
            set(F11,'PaperSize',[6 5]);
            %print(F11,filename,'-dpdf');
            print(F11,filename,'-dpng')
end

%%
a=theta;
cmin=-2;
cmax=7.5;
%cmin=-3.3;
%cmax=3.3;
NN=30;
lambdas=linspace(1/10*LBtheta,UB0,NN)
%lambdas=linspace(2*UB0,4*UB0,NN)

F11=figure;
for i=1:length(lambdas)
    %filename=strcat('FE1E3-a','theta','lamb',num2str(i),'.pdf');
        filename=strcat('FE1E3-a','theta','lamb',num2str(i),'.png');

    %    filename=strcat('FE1E3-a','thetaF','lamb',num2str(i),'.pdf');

alphas = linspace(-1,1.5,200);
betas = linspace(-1,1,201);
[X,Y]=meshgrid(alphas,betas);
 %y3 =@(x,y) sign(Ja(x,y,lambdas(i),a)).*(abs(Ja(x,y,lambdas(i),a)).^(1/3));
 y3 =@(x,y) Ja(x,y,lambdas(i),a).*(abs(Ja(x,y,lambdas(i),a))<=1)+(abs(Ja(x,y,lambdas(i),a))>1).*sign(Ja(x,y,lambdas(i),a)).*(abs(Ja(x,y,lambdas(i),a)).^(1/3));

surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([cmin cmax]);
            shading interp;
            view(2);
            xlim([-1 1.5]);
ylim([-1 1]);
                        set(gca,'FontSize',25)
            %caxis([0 theta1])
            title(strcat('$\lambda$=',num2str(lambdas(i),4),', $a$=',num2str(a)),'interpreter','latex','fontsize',30);
            xlabel('e_1','fontsize',30);
            ylabel('e_3','fontsize',30);
            pause(0.15)
            set(F11,'PaperSize',[6 5]);
            %print(F11,filename,'-dpdf');
                        print(F11,filename,'-dpng');

end
%%
%%
a=1;
cmin=-2.1;
cmax=12;
NN=5;
lambdas=linspace(1/10*LBtheta,2*UB0,NN)

F11=figure;
for i=1:length(lambdas)
    filename=strcat('FE1E3-a',num2str(a),'lamb',num2str(i),'.pdf');
alphas = linspace(-1,1.5,200);
betas = linspace(-1,1,201);
[X,Y]=meshgrid(alphas,betas);
 y3 =@(x,y) Ja(x,y,lambdas(i),a).*(abs(Ja(x,y,lambdas(i),a))<=1)+(abs(Ja(x,y,lambdas(i),a))>1).*sign(Ja(x,y,lambdas(i),a)).*(abs(Ja(x,y,lambdas(i),a)).^(1/3));
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([cmin cmax]);
            shading interp;
            view(2);
            %caxis([0 theta1])
            title(strcat('\lambda=',num2str(lambdas(i),4),', a=',num2str(a)));
            xlabel('e_1');
            ylabel('e_3');
            pause(0.5)
            set(F11,'PaperSize',[6 5]);
            print(F11,filename,'-dpdf');
end




%%


cmin=-2.5;
cmax=10;
NN=30;
as=linspace(0,theta1,NN);
lambda1=2*UB0;
F11=figure;
for i=1:length(as)
    filename=strcat('zA-FE1E3-a',num2str(as(i)),'lamb',num2str(lambda1),'.pdf');
alphas = linspace(-1,1.5,200);
betas = linspace(-1,1,201);
[X,Y]=meshgrid(alphas,betas);
 y3 =@(x,y) Ja(x,y,lambda1,as(i)).*(abs(Ja(x,y,lambda1,as(i)))<=1)+(abs(Ja(x,y,lambda1,as(i)))>1).*sign(Ja(x,y,lambda1,as(i))).*(abs(Ja(x,y,lambda1,as(i))).^(1/3));
surf(X,Y,y3(X,Y));
colormap('jet');
colorbar
 caxis([cmin cmax]);
  shading interp;
   view(2);
title(strcat('\lambda=',num2str(lambda1,4),', a=',num2str(as(i),2)));
            xlabel('e_1');
            ylabel('e_3');a=linspace(0,theta1,NN);
            pause(1)
            %set(F11,'PaperSize',[6 5]);
            %print(F11,filename,'-dpdf');
end




%%


F11=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,1/10*LBtheta,a);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([cmin cmax]);
            shading interp;
            view(2);
            %caxis([0 theta1])
            
            
            
            F12=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,LBtheta,a);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([cmin cmax]);
            shading interp;
            view(2);
            %caxis([0 theta1])
            
            
            F13=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,UBtheta,a);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([cmin cmax]);
            shading interp;
            view(2);
            %caxis([0 theta1])
            
            
            F14=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,UB0,a);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([cmin cmax]);
            shading interp;
            view(2);
            %caxis([0 theta1])

            F15=figure;
alphas = linspace(-1,1.5,100);
betas = linspace(-1,1,101);
[X,Y]=meshgrid(alphas,betas);
y3 =@(x,y) Ja(x,y,2*UB0,a);
surf(X,Y,y3(X,Y));
colormap('jet');
            colorbar
            caxis([cmin cmax]);
            shading interp;
            view(2);
            %caxis([0 theta1])

