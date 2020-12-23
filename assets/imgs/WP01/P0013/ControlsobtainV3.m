%%
%In this document we work on $G=(0,\pi)$. Indeed, we can expicitely get the
%eigenfunctions of the Laplacian there. In particular, we define:
clear
eigenf =@(i,x) sin(i.*x);



%%
%Let us see that happens in the case in which $\rho=1_{(1,2)}$; that is, in
%which we have 

 auxf12= @(j) -(exp(-j.^2)-exp(-2.*j.^2))./j.^3.*(rem(j,2)==1);

Coeffs12M40e0=[];
B12M40= auxf12(1:40)';
for i=1:40
    for j=1:40
        trigfvar = @(x) sin(i.*x).*sin(j.*x);
        expfvar= @(t) ((exp(-i.^2.* t)-exp(-2.*i.^2.*t)).*(exp(-j.^2.* t)-exp(-2.*j.^2.*t)))./(i.^2.*j.^2.*t.^2);
        Coeffs12M40e0(i,j)= integral(expfvar,0,1)*integral(trigfvar,1,2);
    end
end
Coord12M40e0 = mldivide(Coeffs12M40e0,B12M40);
'Case M40 done'
Coeffs12M50e0=[];
B12M50= auxf12(1:50)';
for i=1:50
    for j=1:50
        trigfvar = @(x) sin(i.*x).*sin(j.*x);
        expfvar= @(t) ((exp(-i.^2.* t)-exp(-2.*i.^2.*t)).*(exp(-j.^2.* t)-exp(-2.*j.^2.*t)))./(i.^2.*j.^2.*t.^2);
        Coeffs12M50e0(i,j)= integral(expfvar,0,1)*integral(trigfvar,1,2);
    end
end
Coord12M50e0 = mldivide(Coeffs12M50e0,B12M50);
'Case M50 done'

B12M60= auxf12(1:60)';
Coeffs12M60e0=[];
for i=1:60
    for j=1:60
        trigfvar = @(x) sin(i.*x).*sin(j.*x);
        expfvar= @(t) ((exp(-i.^2.* t)-exp(-2.*i.^2.*t)).*(exp(-j.^2.* t)-exp(-2.*j.^2.*t)))./(i.^2.*j.^2.*t.^2);
        Coeffs12M60e0(i,j)= integral(expfvar,0,1)*integral(trigfvar,1,2);
    end
end

Coord12M60e0 = mldivide(Coeffs12M60e0,B12M60);
'Case M60 done'

%%
%Let us now do the opperations in the case in which $\rho=1_{(0,1)}$.


auxf01= @(j) -(1-exp(-j.^2))./j.^3.*(rem(j,2)==1);

B01M40= auxf01(1:40)';
Coeffs01M40e0=[];
for i=1:40
    for j=1:40
        trigfvar = @(x) sin(i.*x).*sin(j.*x);
        expfvar= @(t) ((1-exp(-i.^2.*t)).*(1-exp(-j.^2.*t)))./(i.^2.*j.^2.*t.^2);
        Coeffs01M40e0(i,j)= integral(expfvar,0,1)*integral(trigfvar,1,2);
    end
end
Coord01M40e0 = mldivide(Coeffs01M40e0,B01M40);
'Case M40 done'
B01M50= auxf01(1:50)';
Coeffs01M50e0=[];
for i=1:50
    for j=1:50
        trigfvar = @(x) sin(i.*x).*sin(j.*x);
        expfvar= @(t) ((1-exp(-i.^2.*t)).*(1-exp(-j.^2.*t)))./(i.^2.*j.^2.*t.^2);
        Coeffs01M50e0(i,j)= integral(expfvar,0,1)*integral(trigfvar,1,2);
    end
end
Coord01M50e0 = mldivide(Coeffs01M50e0,B01M50);
'Case M50 done'
B01M60= auxf01(1:60)';
Coeffs01M60e0=[];
for i=1:60
    for j=1:60
        trigfvar = @(x) sin(i.*x).*sin(j.*x);
        expfvar= @(t) ((1-exp(-i.^2.*t)).*(1-exp(-j.^2.*t)))./(i.^2.*j.^2.*t.^2);
        Coeffs01M60e0(i,j)= integral(expfvar,0,1)*integral(trigfvar,1,2);    
    end
end
Coord01M60e0 = mldivide(Coeffs01M60e0,B01M60);
'Case M60 done'

%%
%Now we are going to work whe \rho=1_{(1,2)}. Let us first get some numerical values:
[control12M40(0.5,1.5), control12M60(0.5,1.5),control12M80(0.5,1.5),control12M100(0.5,1.5)]
[control12M40(0.25,1.5), control12M60(0.25,1.5),control12M80(0.25,1.5),control12M100(0.25,1.5)]
[control12M40(0.125,1.5), control12M60(0.125,1.5),control12M80(0.125,1.5),control12M100(0.125,1.5)]
[control12M40(0.5,1.3), control12M60(0.5,1.3),control12M80(0.5,1.3),control12M100(0.5,1.3)]
[control12M40(0.25,1.3), control12M60(0.25,1.3),control12M80(0.25,1.3),control12M100(0.25,1.3)]
[control12M40(0.125,1.3), control12M60(0.125,1.3),control12M80(0.125,1.3),control12M100(0.125,1.3)]
[control12M40(0.9,1.3), control12M60(0.9,1.3),control12M80(0.9,1.3),control12M100(0.9,1.3)]
[control12M40(0.95,1.3), control12M60(0.95,1.3),control12M80(0.95,1.3),control12M100(0.95,1.3)]
[control12M40(0.99,1.3), control12M60(0.99,1.3),control12M80(0.99,1.3),control12M100(0.99,1.3)]
%As we can see, we have a decent convergence with the M40 in the segment
%[0,0.95], but the last part just requires more computation. Still, it is
%good to see the controllability properties. 
%%
%Let us move to doing the graphs in the case of uniform distribution in
%(1,2). In particular, we focus on $V_{40}$, $V_{50}$ and $V_{60}$. 
%For that, we are going to use the surf command. 
X=1:0.0025:2;
T=0:0.0025:0.99;

%Let us now obtain the variabl Z1260
Z1260=[];
i=0;
for x=1:0.0025:2
    i=i+1;
    j=0;
    for t=0:0.0025:0.99
        j=j+1;
        Z1260(i,j)= control12M60(t,x);
    end
    if rem(i,50)==0
        i
    end
end
'Variable Z1260 obtained'
Z1250=[];
i=0;
for x=1:0.0025:2
    i=i+1;
    j=0;
    for t=0:0.0025:0.99
        j=j+1;
        Z1250(i,j)= control12M50(t,x);
    end
    if rem(i,50)==0
        i
    end
end
'Variable Z1250 obtained'



%Let us now obtain the variable Z1240
Z1240=[];
i=0;
for x=1:0.0025:2
    i=i+1;
    j=0;
    for t=0:0.0025:0.99
        j=j+1;
        Z1240(i,j)= control12M40(t,x);
    end
    if rem(i,50)==0
        i
    end
end
'Variable Z1240 obtained'

%%

hold off
%We continue with the graph of Z1260
surf(T,X,Z1260, "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('The induced control in $V_{60}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(1,2)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12V60', 'pdf') %Save figure
%We continue with the graph of Z1250
surf(T,X,Z1250, "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('The induced control in $V_{50}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(1,2)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12V50', 'pdf') %Save figure
%We continue with the graph of Z1240
surf(T,X,Z1240, "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('The induced control in $V_{40}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(1,2)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12V40', 'pdf') %Save figure

%Let us now get the brut differences between what happens in $V_{60}$ and what
%happened in $V_{50}$.
surf(T,X,Z1260-Z1250,"EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('Difference between the approximations in $V_{80}$ and $V_{100}$ when $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12Vdif10080', 'pdf') %Save figure
%%
% %Let us zoom what happens when $t\in(0,1/2)$

hold off
X=1:0.0025:2;
T=0:0.0025:0.99;
%We continue with the graph of Z1260
surf(T(1:200),X,Z1260(:,1:200), "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
xlim([0 0.5])
colorbar
title('The induced control in $V_{60}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(1,2)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12V60t05', 'pdf') %Save figure
%We continue with the graph of Z1260
surf(T(1:200),X,Z1260(:,1:200), "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
xlim([0 0.5])
colorbar
title('The induced control in $V_{50}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(1,2)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12V50t05', 'pdf') %Save figure
%We continue with the graph of Z1240
surf(T(1:200),X,Z1240(:,1:200), "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
xlim([0 0.5])
colorbar
title('The induced control in $V_{40}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(1,2)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12V40t05', 'pdf') %Save figure

%Let us now get the brut differences between what happens in V_{60} and what
%happened in $V_{50}$.
surf(T(1:200),X,Z1260(:,1:200)-Z1250(:,1:200),"EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('Difference between the approximations in $V_{50}$ and $V_{60}$ when $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12Vdif10080t05', 'pdf') %Save figure

%%
% I get a graph to see what happens and understand the optical effect.
surf(T(1:200),X,Z12100(:,1:200),"EdgeColor", "none")
colorbar
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
%legend('$V_{100}$','Interpreter',"latex")
title('An approximation of the optimal control for $y^0=\frac{1}{2}$ in $V_{100}$ when $\rho=1_{(1,2)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.

%%
%To continue with, we see what happens when $\rho=1_{(0,1)}$. We start
%getting the functions. 

X=1:0.0025:2;
T=0:0.0025:0.99;

%Let us now obtain the variabl Z1260
Z0160=[];
i=0;
for x=1:0.0025:2
    i=i+1;
    j=0;
    for t=0:0.0025:0.99
        j=j+1;
        Z0160(i,j)= control01M60(t,x);
    end
    if rem(i,50)==0
        i
    end
end
'Variable Z0160 obtained'

Z0150=[];
i=0;
for x=1:0.0025:2
    i=i+1;
    j=0;
    for t=0:0.0025:0.99
        j=j+1;
        Z0150(i,j)= control01M50(t,x);
    end
    if rem(i,50)==0
        i
    end
end
'Variable Z0150 obtained'

%Let us now obtain the variable Z1240
Z0140=[];
i=0;
for x=1:0.0025:2
    i=i+1;
    j=0;
    for t=0:0.0025:0.99
        j=j+1;
        Z0140(i,j)= control01M40(t,x);
    end
    if rem(i,50)==0
        i
    end
end
'Variable Z0140 obtained'

%%
%Let us start now get the graphs with $\rho=1_{(0,1)}$. 


%We continue with the graph of Z0160
surf(T,X,Z0160, "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('The induced control in $V_{60}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01V60', 'pdf') %Save figure
%We continue with the graph of Z0160
surf(T,X,Z0150, "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('The induced control in $V_{50}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01V50', 'pdf') %Save figure
%We continue with the graph of Z1240
surf(T,X,Z0140, "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('The induced control in $V_{40}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01V40', 'pdf') %Save figure

%Let us now get the brut differences between what happens in $V_{60}$ and what
%happened in $V_{50}$.
surf(T,X,Z0160-Z0150,"EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('Difference between the approximations in $V_{80}$ and $V_{90}$ when $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01Vdif10080', 'pdf') %Save figure
%% 
% %In order to see better the differences we zoom on [0,1/2] to see the
% %differences. 


%We start with the graph of Z1260
surf(T(1:200),X,Z0160(:,1:200), "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
xlim([0 0.5])
colorbar
title('The induced control in $V_{60}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01V60t05', 'pdf') %Save figure

%We continue with the graph of Z1260
surf(T(1:200),X,Z0150(:,1:200), "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
xlim([0 0.5])
colorbar
title('The induced control in $V_{50}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01V50t05', 'pdf') %Save figure

%We continue with the graph of Z1240
surf(T(1:200),X,Z0140(:,1:200), "EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
xlim([0 0.5])
colorbar
title('The induced control in $V_{40}$ for $y^0=\frac{1}{2}$ and $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01V40t05', 'pdf') %Save figure

%Let us now get the brut differences between what happens in $V_{60}$ and what
%happened in $V_{50}$.
surf(T(1:200),X,Z0160(:,1:200)-Z0150(:,1:200),"EdgeColor", "none")
xlabel('$t$','Interpreter',"latex")
ylabel('$x$','Interpreter',"latex")
colorbar
title('Difference between the approximations in $V_{50}$ and $V_{60}$ when $\rho=1_{(0,1)}$','Interpreter',"latex")
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01Vdif10080t05', 'pdf') %Save figure

%%
%Since we are minimizing a functional, it is also interesting to get an
%idea of how the solutions looks like when t=0. 
Xbis=0:pi/5000:pi;
Zbis60= [];
i=0;
for x=Xbis
    i=i+1;
    Zbis60(i)=  control12M60(0,x);
end
Zbis50= [];
i=0;
for x=Xbis
    i=i+1;
    Zbis50(i)=  control12M50(0,x);
end
Zbis40= [];
i=0;
for x=Xbis
    i=i+1;
    Zbis40(i)=  control12M40(0,x);
end
hold off
plot(Xbis, Zbis40)
title('The extension of the control when $\rho=1_{(1,2)}$ to $t=0$','Interpreter',"latex")
legend('$V_{40}$', "Interpreter",'Latex')
xlim([0 pi])
hold on 
plot(Xbis, Zbis50, "Displayname", '$V_{50}$')
plot(Xbis, Zbis60, "Displayname", '$V_{60}$')
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12t0', 'pdf') %Save figure
%%
%We now repeat the process with the uniform distribution in $(0,1)$.
Xbis=0:pi/5000:pi;
Z01bis60= [];
i=0;
for x=Xbis
    i=i+1;
    Z01bis60(i)=  control01M60(0,x);
end
Z01bis50= [];
i=0;
for x=Xbis
    i=i+1;
    Z01bis50(i)=  control01M50(0,x);
end
Z01bis40= [];
i=0;
for x=Xbis
    i=i+1;
    Z01bis40(i)=  control01M40(0,x);
end
hold off
plot(Xbis, Z01bis40)
title('The extension of the control when $\rho=1_{(0,1)}$ to $t=0$','Interpreter',"latex")
legend('$V_{40}$', "Interpreter",'Latex')
xlim([0 pi])
hold on 
plot(Xbis, Z01bis50, "Displayname", '$V_{50}$')
plot(Xbis, Z01bis60, "Displayname", '$V_{60}$')
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01t0', 'pdf') %Save figure

%%
%To conclude with, I want to see what happens when we use the approximated
%controls. Let us start in the case of $\rho=1_{(1,2)}$ and $V_{60}$.
SolM6012aux1= pdepe(0,@truecontrol12M60aux1,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux1 obtained'
SolM6012aux2= pdepe(0,@truecontrol12M60aux2,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux2 obtained'
SolM6012aux3= pdepe(0,@truecontrol12M60aux3,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux3 obtained'
SolM6012aux4= pdepe(0,@truecontrol12M60aux4,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux4 obtained'
SolM6012aux5= pdepe(0,@truecontrol12M60aux5,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux5 obtained'
SolM6012aux6= pdepe(0,@truecontrol12M60aux6,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux6 obtained'
SolM6012aux7= pdepe(0,@truecontrol12M60aux7,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux7 obtained'
SolM6012aux8= pdepe(0,@truecontrol12M60aux8,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux8 obtained'
SolM6012aux9= pdepe(0,@truecontrol12M60aux9,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux9 obtained'
SolM6012aux10= pdepe(0,@truecontrol12M60aux10,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux10 obtained'
SolM6012aux11= pdepe(0,@truecontrol12M60aux11,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux11 obtained'
SolM6012aux12= pdepe(0,@truecontrol12M60aux12,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux12 obtained'
SolM6012aux13= pdepe(0,@truecontrol12M60aux13,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux13 obtained'
SolM6012aux14= pdepe(0,@truecontrol12M60aux14,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux14 obtained'
SolM6012aux15= pdepe(0,@truecontrol12M60aux15,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux15 obtained'
SolM6012aux16= pdepe(0,@truecontrol12M60aux16,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux16 obtained'
SolM6012aux17= pdepe(0,@truecontrol12M60aux17,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux17 obtained'
SolM6012aux18= pdepe(0,@truecontrol12M60aux18,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux18 obtained'
SolM6012aux19= pdepe(0,@truecontrol12M60aux19,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux19 obtained'
SolM6012aux20= pdepe(0,@truecontrol12M60aux20,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux20 obtained'
SolM6012aux21= pdepe(0,@truecontrol12M60aux21,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6012aux21 obtained'
SolM6012= (SolM6012aux1+SolM6012aux2+SolM6012aux3+SolM6012aux4+SolM6012aux5+SolM6012aux6+SolM6012aux7 +SolM6012aux8+SolM6012aux9+SolM6012aux10+SolM6012aux11+SolM6012aux12+SolM6012aux13+SolM6012aux14+SolM6012aux15+SolM6012aux16+SolM6012aux17+SolM6012aux18+SolM6012aux19+SolM6012aux20+SolM6012aux21)/21;
%%
%Let us now do the same with M50. 
SolM5012aux1= pdepe(0,@truecontrol12M50aux1,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux1 obtained'
SolM5012aux2= pdepe(0,@truecontrol12M50aux2,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux2 obtained'
SolM5012aux3= pdepe(0,@truecontrol12M50aux3,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux3 obtained'
SolM5012aux4= pdepe(0,@truecontrol12M50aux4,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux4 obtained'
SolM5012aux5= pdepe(0,@truecontrol12M50aux5,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux5 obtained'
SolM5012aux6= pdepe(0,@truecontrol12M50aux6,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux6 obtained'
SolM5012aux7= pdepe(0,@truecontrol12M50aux7,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux7 obtained'
SolM5012aux8= pdepe(0,@truecontrol12M50aux8,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux8 obtained'
SolM5012aux9= pdepe(0,@truecontrol12M50aux9,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux9 obtained'
SolM5012aux10= pdepe(0,@truecontrol12M50aux10,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux10 obtained'
SolM5012aux11= pdepe(0,@truecontrol12M50aux11,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux11 obtained'
SolM5012aux12= pdepe(0,@truecontrol12M50aux12,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux12 obtained'
SolM5012aux13= pdepe(0,@truecontrol12M50aux13,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux13 obtained'
SolM5012aux14= pdepe(0,@truecontrol12M50aux14,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux14 obtained'
SolM5012aux15= pdepe(0,@truecontrol12M50aux15,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux15 obtained'
SolM5012aux16= pdepe(0,@truecontrol12M50aux16,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux16 obtained'
SolM5012aux17= pdepe(0,@truecontrol12M50aux17,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux17 obtained'
SolM5012aux18= pdepe(0,@truecontrol12M50aux18,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux18 obtained'
SolM5012aux19= pdepe(0,@truecontrol12M50aux19,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux19 obtained'
SolM5012aux20= pdepe(0,@truecontrol12M50aux20,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux20 obtained'
SolM5012aux21= pdepe(0,@truecontrol12M50aux21,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5012aux21 obtained'
SolM5012= (SolM5012aux1+SolM5012aux2+SolM5012aux3+SolM5012aux4+SolM5012aux5+SolM5012aux6+SolM5012aux7 +SolM5012aux8+SolM5012aux9+SolM5012aux10+SolM5012aux11+SolM5012aux12+SolM5012aux13+SolM5012aux14+SolM5012aux15+SolM5012aux16+SolM5012aux17+SolM5012aux18+SolM5012aux19+SolM5012aux20+SolM5012aux21)/21;

%%
%Let us now do the same with M40. 
SolM4012aux1= pdepe(0,@truecontrol12M40aux1,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux1 obtained'
SolM4012aux2= pdepe(0,@truecontrol12M40aux2,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux2 obtained'
SolM4012aux3= pdepe(0,@truecontrol12M40aux3,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux3 obtained'
SolM4012aux4= pdepe(0,@truecontrol12M40aux4,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux4 obtained'
SolM4012aux5= pdepe(0,@truecontrol12M40aux5,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux5 obtained'
SolM4012aux6= pdepe(0,@truecontrol12M40aux6,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux6 obtained'
SolM4012aux7= pdepe(0,@truecontrol12M40aux7,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux7 obtained'
SolM4012aux8= pdepe(0,@truecontrol12M40aux8,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux8 obtained'
SolM4012aux9= pdepe(0,@truecontrol12M40aux9,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux9 obtained'
SolM4012aux10= pdepe(0,@truecontrol12M40aux10,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux10 obtained'
SolM4012aux11= pdepe(0,@truecontrol12M40aux11,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux11 obtained'
SolM4012aux12= pdepe(0,@truecontrol12M40aux12,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux12 obtained'
SolM4012aux13= pdepe(0,@truecontrol12M40aux13,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux13 obtained'
SolM4012aux14= pdepe(0,@truecontrol12M40aux14,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux14 obtained'
SolM4012aux15= pdepe(0,@truecontrol12M40aux15,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux15 obtained'
SolM4012aux16= pdepe(0,@truecontrol12M40aux16,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux16 obtained'
SolM4012aux17= pdepe(0,@truecontrol12M40aux17,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux17 obtained'
SolM4012aux18= pdepe(0,@truecontrol12M40aux18,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux18 obtained'
SolM4012aux19= pdepe(0,@truecontrol12M40aux19,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux19 obtained'
SolM4012aux20= pdepe(0,@truecontrol12M40aux20,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux20 obtained'
SolM4012aux21= pdepe(0,@truecontrol12M40aux21,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4012aux21 obtained'
SolM4012= (SolM4012aux1+SolM4012aux2+SolM4012aux3+SolM4012aux4+SolM4012aux5+SolM4012aux6+SolM4012aux7 +SolM4012aux8+SolM4012aux9+SolM4012aux10+SolM4012aux11+SolM4012aux12+SolM4012aux13+SolM4012aux14+SolM4012aux15+SolM4012aux16+SolM4012aux17+SolM4012aux18+SolM4012aux19+SolM4012aux20+SolM4012aux21)/21;



%%

%%
%Let us see what happens now when $\rho=1_{(0,1)}$. 
SolM6001aux1= pdepe(0,@truecontrol01M60aux1,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux1 obtained'
SolM6001aux2= pdepe(0,@truecontrol01M60aux2,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux2 obtained'
SolM6001aux3= pdepe(0,@truecontrol01M60aux3,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux3 obtained'
SolM6001aux4= pdepe(0,@truecontrol01M60aux4,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux4 obtained'
SolM6001aux5= pdepe(0,@truecontrol01M60aux5,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux5 obtained'
SolM6001aux6= pdepe(0,@truecontrol01M60aux6,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux6 obtained'
SolM6001aux7= pdepe(0,@truecontrol01M60aux7,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux7 obtained'
SolM6001aux8= pdepe(0,@truecontrol01M60aux8,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux8 obtained'
SolM6001aux9= pdepe(0,@truecontrol01M60aux9,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux9 obtained'
SolM6001aux10= pdepe(0,@truecontrol01M60aux10,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux10 obtained'
SolM6001aux11= pdepe(0,@truecontrol01M60aux11,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux11 obtained'
SolM6001aux12= pdepe(0,@truecontrol01M60aux12,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux12 obtained'
SolM6001aux13= pdepe(0,@truecontrol01M60aux13,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux13 obtained'
SolM6001aux14= pdepe(0,@truecontrol01M60aux14,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux14 obtained'
SolM6001aux15= pdepe(0,@truecontrol01M60aux15,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux15 obtained'
SolM6001aux16= pdepe(0,@truecontrol01M60aux16,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux16 obtained'
SolM6001aux17= pdepe(0,@truecontrol01M60aux17,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux17 obtained'
SolM6001aux18= pdepe(0,@truecontrol01M60aux18,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux18 obtained'
SolM6001aux19= pdepe(0,@truecontrol01M60aux19,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux19 obtained'
SolM6001aux20= pdepe(0,@truecontrol01M60aux20,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM6001aux20 obtained'
SolM6001= (SolM6001aux1+SolM6001aux2+SolM6001aux3+SolM6001aux4+SolM6001aux5+SolM6001aux6+SolM6001aux7 +SolM6001aux8+SolM6001aux9+SolM6001aux10+SolM6001aux11+SolM6001aux12+SolM6001aux13+SolM6001aux14+SolM6001aux15+SolM6001aux16+SolM6001aux17+SolM6001aux18+SolM6001aux19+SolM6001aux20)/20;
%%
%We now consider the case M50. 
SolM5001aux1= pdepe(0,@truecontrol01M50aux1,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux1 obtained'
SolM5001aux2= pdepe(0,@truecontrol01M50aux2,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux2 obtained'
SolM5001aux3= pdepe(0,@truecontrol01M50aux3,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux3 obtained'
SolM5001aux4= pdepe(0,@truecontrol01M50aux4,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux4 obtained'
SolM5001aux5= pdepe(0,@truecontrol01M50aux5,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux5 obtained'
SolM5001aux6= pdepe(0,@truecontrol01M50aux6,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux6 obtained'
SolM5001aux7= pdepe(0,@truecontrol01M50aux7,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux7 obtained'
SolM5001aux8= pdepe(0,@truecontrol01M50aux8,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux8 obtained'
SolM5001aux9= pdepe(0,@truecontrol01M50aux9,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux9 obtained'
SolM5001aux10= pdepe(0,@truecontrol01M50aux10,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux10 obtained'
SolM5001aux11= pdepe(0,@truecontrol01M50aux11,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux11 obtained'
SolM5001aux12= pdepe(0,@truecontrol01M50aux12,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux12 obtained'
SolM5001aux13= pdepe(0,@truecontrol01M50aux13,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux13 obtained'
SolM5001aux14= pdepe(0,@truecontrol01M50aux14,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux14 obtained'
SolM5001aux15= pdepe(0,@truecontrol01M50aux15,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux15 obtained'
SolM5001aux16= pdepe(0,@truecontrol01M50aux16,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux16 obtained'
SolM5001aux17= pdepe(0,@truecontrol01M50aux17,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux17 obtained'
SolM5001aux18= pdepe(0,@truecontrol01M50aux18,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux18 obtained'
SolM5001aux19= pdepe(0,@truecontrol01M50aux19,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux19 obtained'
SolM5001aux20= pdepe(0,@truecontrol01M50aux20,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM5001aux20 obtained'
SolM5001= (SolM5001aux1+SolM5001aux2+SolM5001aux3+SolM5001aux4+SolM5001aux5+SolM5001aux6+SolM5001aux7 +SolM5001aux8+SolM5001aux9+SolM5001aux10+SolM5001aux11+SolM5001aux12+SolM5001aux13+SolM5001aux14+SolM5001aux15+SolM5001aux16+SolM5001aux17+SolM5001aux18+SolM5001aux19+SolM5001aux20)/20;

%%
%We now consider the case M40. 
SolM4001aux1= pdepe(0,@truecontrol01M40aux1,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux1 obtained'
SolM4001aux2= pdepe(0,@truecontrol01M40aux2,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux2 obtained'
SolM4001aux3= pdepe(0,@truecontrol01M40aux3,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux3 obtained'
SolM4001aux4= pdepe(0,@truecontrol01M40aux4,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux4 obtained'
SolM4001aux5= pdepe(0,@truecontrol01M40aux5,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux5 obtained'
SolM4001aux6= pdepe(0,@truecontrol01M40aux6,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux6 obtained'
SolM4001aux7= pdepe(0,@truecontrol01M40aux7,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux7 obtained'
SolM4001aux8= pdepe(0,@truecontrol01M40aux8,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux8 obtained'
SolM4001aux9= pdepe(0,@truecontrol01M40aux9,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux9 obtained'
SolM4001aux10= pdepe(0,@truecontrol01M40aux10,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux10 obtained'
SolM4001aux11= pdepe(0,@truecontrol01M40aux11,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux11 obtained'
SolM4001aux12= pdepe(0,@truecontrol01M40aux12,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux12 obtained'
SolM4001aux13= pdepe(0,@truecontrol01M40aux13,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux13 obtained'
SolM4001aux14= pdepe(0,@truecontrol01M40aux14,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux14 obtained'
SolM4001aux15= pdepe(0,@truecontrol01M40aux15,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux15 obtained'
SolM4001aux16= pdepe(0,@truecontrol01M40aux16,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux16 obtained'
SolM4001aux17= pdepe(0,@truecontrol01M40aux17,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux17 obtained'
SolM4001aux18= pdepe(0,@truecontrol01M40aux18,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux18 obtained'
SolM4001aux19= pdepe(0,@truecontrol01M40aux19,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux19 obtained'
SolM4001aux20= pdepe(0,@truecontrol01M40aux20,@ini,@heatbc,linspace(0,pi,500),linspace(0,1,1000));
'SolM4001aux20 obtained'
SolM4001= (SolM4001aux1+SolM4001aux2+SolM4001aux3+SolM4001aux4+SolM4001aux5+SolM4001aux6+SolM4001aux7 +SolM4001aux8+SolM4001aux9+SolM4001aux10+SolM4001aux11+SolM4001aux12+SolM4001aux13+SolM4001aux14+SolM4001aux15+SolM4001aux16+SolM4001aux17+SolM4001aux18+SolM4001aux19+SolM4001aux20)/20;

%%
%To conlude with, we do the plot:
hold off
X=linspace(0,pi,500);
Z40=SolM4001(999,:);
plot(X, Z40)
xlim([0, pi])
title('The controlled solution in $t=1$  with $\rho=1_{(0,1)}$','Interpreter',"latex")
legend('$V_{40}$', "Interpreter",'Latex')
hold on
Z50=SolM5001(999,:);
plot(X, Z50, 'Displayname', '$V_{50}$')
Z60=SolM6001(999,:);
plot(X, Z60, 'Displayname', '$V_{60}$')
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph01t1', 'pdf') %Save figure
hold off
Z40=SolM4012(999,:);
plot(X, Z40)
xlim([0, pi])
title('The controlled solution in $t=1$  with $\rho=1_{(1,2)}$','Interpreter',"latex")
legend('$V_{40}$', "Interpreter",'Latex')
hold on
Z50=SolM5012(999,:);
plot(X, Z50, 'Displayname', '$V_{50}$')
Z60=SolM6012(999,:);
plot(X, Z60, 'Displayname', '$V_{60}$')
Sizegcf= get(gcf, 'PaperPosition');
set(gcf, 'PaperSize', [Sizegcf(3) Sizegcf(4)]); %Set the paper to have width 5 and height 5.
saveas(gcf, 'Graph12t1', 'pdf') %Save figure


%%
% In this section we define the local function. Let us start with
% $\rho=1_{(1,2)}$.
function [y]= control12M40(t,x)
    coords= [-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];
    y=0;
    timecoord=[];
    for i=1:40
        timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end

function [y]= control12M50(t,x)
    coords= [-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    y=0;
    timecoord=[];
    for i=1:50
        timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end

function [y]= control12M60(t,x)
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    y=0;
    timecoord=[];
    for i=1:60
        timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end



function [y]= control12M90(t,x)
    coords= [-1.91579924027938;3.29070823769650;-16.8616299035398;24.8995224037838;-111.953298303917;153.640922894398;-614.292790816068;740.436234695888;-2711.04378148086;2596.79299727784;-9263.34732128670;5371.96956307117;-22653.1224767648;-2975.67755494398;-29429.8323810911;-77803.7133247245;38969.5272630698;-363494.068518586;339388.153075864;-1069625.10292221;1019240.96591435;-2223536.69120182;1862845.09356469;-3252333.34342751;1942412.15839339;-3082417.40292689;117447.481023174;-1648945.88071349;-3307579.19075659;-1846180.09702368;-5951849.45644172;-7963571.89278399;-7106540.25327228;-18490638.6307023;-13482335.8264070;-20959583.6631694;-36054271.4450607;-1703580.75575109;-73263758.1296422;33485873.5703113;-100020881.679447;56300391.3597199;-88236082.7416916;45847080.6996847;-43477702.3368415;16421781.7151334;-4461514.20778225;-1250570.74495010;4538333.28194942;-1196787.54126709;332415.488592794;-561322.462247836;3877967.97292002;-2621258.78134774;5572742.92657155;2115457.51984412;-3530939.78691335;423059.409230599;324592.655112089;-26988069.8815948;29539581.0726937;-48190766.1391229;43628655.8340470;-6071048.20889673;13550078.8199188;76376725.8853384;-2020525.80110346;90570614.1162444;76457826.9907255;-13645834.4076945;217187004.509801;-141253582.476645;291385591.316458;-163717871.061719;228015146.224527;-71641042.2924931;90280417.3330009;35864317.4119839;-14028948.8969398;78901528.5774138;-43973628.3135143;61640630.7681128;-29809178.2521699;28989858.4072632;-11212970.7998686;8623405.78707805;-2396598.54751433;1506863.14366904;-230305.503211911;118188.057568042];
    y=0;
    timecoord=[];
    for i=1:90
        timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:90
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end

function [y]= control12M100(t,x)
    coords= [-1.93009945891536;3.40475708322408;-17.3862738108442;27.1098654785941;-120.691178587068;181.546686390519;-707.944946333727;991.559801736200;-3436.06895057030;4289.42764482604;-13522.2979535070;14160.3091365349;-42091.6122160606;32693.4184957781;-99004.7315586372;35784.6622716786;-155583.492855544;-82103.3992495567;-76115.4080642392;-541972.419682722;384790.877151198;-1521911.11595857;1321530.94994641;-2691666.58236076;2183671.55870834;-2895219.24814013;1777062.60557386;-1064429.91381655;-393086.572507802;1653995.54647950;-2674423.26400594;1855802.51619611;-3471049.00502739;-435225.592944473;-7358097.43010196;4682222.87175459;-25473060.8605998;30280032.2021319;-60836751.1890310;71230117.2333943;-92439815.6104230;96129465.7128322;-88747814.4110748;77645361.5476780;-47293493.3229744;30543105.2530701;-5272799.59128416;-2293546.34688526;6409531.05247290;-4709855.53308095;953373.507531621;581166.635777131;2925065.74105836;-1040969.62203255;4898461.24798408;677720.110576417;-3886984.10491125;1175523.05778373;-908061.510717396;-18083447.7823505;19413446.9920051;-34655286.1745437;2996785.86299151;-7358335.32864440;-73328038.2917939;26901641.6787304;-116679860.998446;-19408207.7156909;-33109301.2764276;-126771001.647750;114731437.682870;-162541709.112717;188766071.976987;-86249025.0069878;172761207.260031;-25743140.5272155;150402450.860627;-72275240.4079969;123426258.297759;-131219651.096242;8679792.75022429;-74682301.1320081;-186499085.148874;63206559.9993858;-327119848.697951;146241151.563664;-315351781.575495;120294745.507111;-196744943.281860;47805620.9160280;-79476432.4370653;223012.644756985;-18182859.8809159;-10202795.6781632;-812360.465389014;-5463934.98564664;665086.764795629;-1346601.13812923;126915.890481532;-137461.016593958];
    y=0;
    timecoord=[];
    for i=1:100
        timecoord(i)= (exp(-(1-t).*i.^2)-exp(-2.*(1-t).*i.^2))./((1-t).*i.^2);
    end
    for i=1:100
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end

%We now continue with $\rho=1_{(0,1)}$. 
function [y]= control01M40(t,x)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];
    y=0;
    timecoord=[];
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end

function [y]= control01M50(t,x)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    y=0;
    timecoord=[];
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end

function [y]= control01M60(t,x)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    y=0;
    timecoord=[];
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end

function [y]= control01M90(t,x)
    coords= [27930.8240922353;207248.027714041;651757.094139044;2970879.20462007;8829574.99781095;31218590.6170088;77902455.2004645;256644251.061882;486628994.544646;1709241828.06489;2236914251.96757;9349093503.67213;7615037240.49888;42077623967.0913;18679502161.0058;155221602752.563;29904409391.5753;465660684487.188;19348843925.8750;1121128715973.99;-33956239082.3866;2115591690451.07;-84353801806.7556;2984787907590.01;2035022660.44305;2802103124975.09;229661033918.219;1019420877047.59;187820293119.245;-1347177262592.05;-389462612149.086;-2193200364417.60;-243958230.133200;-1132462840379.22;4338916384582.53;-526777881656.519;11501102044293.1;-536289470412.329;11312929865515.3;5210719374855.80;-4956552908802.26;20670535422225.3;-21244145226887.5;32419574242914.5;2558335577670.57;18277281405894.1;81307296109372.6;-18474297182234.9;160382435587461;-40986486790226.8;159677357661208;-26015946791188.1;75807688294898.4;-627895056798.983;-764782816562.078;1095958406958.51;1114331372220.61;-745475248737.740;43879892820015.2;36491744788206.6;45947233577882.0;94481302789027.9;-1888708071328.95;103229007696272;-39444145876605.0;42250198111557.7;-32609521644295.5;-24654860557002.8;-7866788035054.37;-34794139303962.3;1897602202910.29;24524883392.5321;-2590863524792.77;27547009758269.7;-6207013273160.28;24829617206368.7;-5155848646474.72;8207049733696.61;-3708739683700.68;-2467068448194.14;-3209984111137.78;-3995780198610.97;-2375462996996.47;-2103110616714.58;-1146106343970.77;-652340864752.591;-315449825874.526;-126224221843.695;-38147630585.8197;-12677302548.8206];
    y=0;
    timecoord=[];
    for i=1:90
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:90
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end

function [y]= control01M100(t,x)
    coords = [-10531.3163925746;-11278.3653197023;-241535.477902467;-73082.3764699041;-3278676.86926973;-333832.870589647;-29039696.1720941;-4147827.54456378;-182180719.302667;-60271857.9047492;-846701640.375789;-562348053.478830;-2967701436.92902;-3579156588.46383;-7802211512.68387;-16673581490.8119;-14809833901.4713;-59198530465.7318;-18014768718.0109;-163382684545.082;-7766534309.05409;-352009028258.577;11692767448.1458;-585325520756.603;-28947594.6300046;-726021521715.747;-94258396001.5613;-619255822477.874;-232859057996.506;-285236199455.683;-238830294496.968;13204896709.2795;-1102541353.21898;53638494243.3309;209867889162.367;-11703335027.8431;-69503430712.2706;90713175464.8961;-650839801380.310;95171193897.3455;-385492320066.519;-644924081367.420;1490010017807.93;-1949638288689.34;3806451148543.82;-2507449403814.45;4420551844161.02;-1588136289555.74;2926236157007.06;-269097014500.232;1063087244213.58;152851004635.328;165953364946.970;-6587223095.02280;-47470863655.4053;56764662611.9604;109575430915.465;50252271453.5423;778631464368.465;-176981036947.058;1113994928617.23;360325178494.723;57386053314.4453;1575734047958.37;-1254354493979.99;1487920126646.98;-879225670338.447;-274272572018.304;405896228585.963;-1143135201551.11;436279954176.296;-7740583046.25627;-249356833319.708;633237914355.002;411351147149.162;-730902707497.967;1718929550465.02;-1715793085859.46;1276509691152.18;-259665577595.320;-515674518812.283;1791919368236.76;-931043408050.329;1784663317796.96;698466019875.207;124353366894.960;2275043259056.16;-1031232068814.74;2245937778489.73;-910468984937.736;1204262851719.98;-323477951157.704;344441551209.318;662915830.551778;25341711610.0669;42852233332.1886;-13048309028.9669;14412339333.4822;-2922429376.25487;1588019758.46344];
    y=0;
    timecoord=[];
    for i=1:100
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:100
        y=y+ sin(i.*x).* coords(i).*timecoord(i);
    end
end
%And here we have some functions needed for getting the solutions of the
%averaged heat equation

function [pl,ql,pr,qr] = heatbc(xl,ul,xr,ur,t)
  pl = ul;
  ql = 0;
  pr = ur;
  qr = 0;
end

function [y]= ini(z)
    y=0.5;
end
% And here we have the difference controls. Let us start with $M=60$
function [c,f,s]= truecontrol12M60aux1(x,t,u,dudx) 
    c = 1;
    f = dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux2(x,t,u,dudx) 
    c = 1;
    f = 1.05*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux3(x,t,u,dudx) 
    c = 1;
    f = 1.1*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux4(x,t,u,dudx) 
    c = 1;
    f = 1.15*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux5(x,t,u,dudx) 
    c = 1;
    f = 1.2*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux6(x,t,u,dudx) 
    c = 1;
    f = 1.25*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux7(x,t,u,dudx) 
    c = 1;
    f = 1.3*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux8(x,t,u,dudx) 
    c = 1;
    f = 1.35*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux9(x,t,u,dudx)
    c = 1;
    f = 1.4*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux10(x,t,u,dudx) 
    c = 1;
    f = 1.45*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux11(x,t,u,dudx) 
    c = 1;
    f = 1.5*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux12(x,t,u,dudx) 
    c = 1;
    f = 1.55*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux13(x,t,u,dudx) 
    c = 1;
    f = 1.6*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux14(x,t,u,dudx) 
    c = 1;
    f = 1.65*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux15(x,t,u,dudx) 
    c = 1;
    f = 1.7*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux16(x,t,u,dudx) 
    c = 1;
    f = 1.75*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux17(x,t,u,dudx) 
    c = 1;
    f = 1.8*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux18(x,t,u,dudx) 
    c = 1;
    f = 1.85*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux19(x,t,u,dudx) 
    c = 1;
    f = 1.9*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux20(x,t,u,dudx) 
    c = 1;
    f = 1.95*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M60aux21(x,t,u,dudx) 
    c = 1;
    f = 2*dudx;
    coords=[-1.93255980341392;3.48127597098717;-17.4727086747765;28.4115038386275;-122.462231770863;198.037287206552;-731.494772641764;1150.81079644878;-3658.01467320614;5488.23678742306;-15080.8831612107;21313.8840953662;-50454.0074030776;66933.8520190545;-133550.101780635;168320.808981204;-264270.098492897;335316.305266993;-325248.157610507;536251.491601364;26370.4892242253;808180.847622067;1238848.05085267;1755892.07852703;3154798.38625994;5464378.04165012;3784350.61705633;15998097.9584851;-1237584.76855965;37845090.4051008;-16669414.8314361;71624025.2357522;-43036889.6817623;109744095.487830;-72948804.0487786;137323247.625685;-93344275.4745663;140646955.245139;-93989064.5393174;117492123.568358;-75326836.8131125;79537417.5965978;-47962468.6189353;43710404.2398486;-24188795.3529627;20511556.6811904;-9935224.50768034;9833824.44681501;-3832195.42369619;5848508.93707618;-1760653.50884182;3726237.84974416;-896586.384214123;1950598.85684572;-367160.956361324;722606.706517283;-95266.3770359797;167157.065340141;-11548.8041481408;18356.6274045214];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:60
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:60
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end


function [c,f,s]= truecontrol01M60aux1(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux2(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.95*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux3(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c=1;
    timecoord=[];
    f = 0.9*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux4(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.85*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux5(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.8*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux6(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.75*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux7(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.7*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux8(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.65*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux9(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.6*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux10(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.55*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux11(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.5*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux12(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.45*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux13(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.4*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux14(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.35*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux15(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.3*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux16(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.25*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux17(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.2*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux18(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.15*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux19(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.1*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M60aux20(x,t,u,dudx)
    coords= [-4086.03779247791;-13783.2096020909;-89626.6714659286;-211560.501896197;-1096868.58123720;-2716886.11012593;-8130902.49133846;-28159928.7877278;-37313117.8399575;-226440951.064215;-86968338.9529658;-1406989036.09887;116916555.762519;-6837973816.13018;1961475369.97421;-26379515788.3587;9114115825.13413;-81791783017.2459;26202084801.0720;-205642618246.871;50028157868.7555;-421377272981.665;55728891328.3648;-704125569237.905;502428835.343298;-953224189969.100;-128696889339.483;-1019966657260.50;-252971800249.183;-787097096936.470;-227756033240.650;-239678805800.386;-1295033566.10092;499016457034.211;264942800254.904;1124100030851.82;346880208802.050;1143220211441.43;275367890225.725;108615024823.054;374777985156.823;-1902540006532.87;862085013215.406;-4043671030760.56;1497109956515.19;-5182122428464.64;1790801287276.12;-4793864203082.71;1527758914058.06;-3341761450751.10;944549547898.474;-1760737515921.85;418254325825.466;-686223071849.487;126746777593.326;-188065780332.087;23651630747.4871;-32593876357.4365;2051638874.67646;-2709737906.50411];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.05*dudx;
    if (x>1).*(x<2)
    for i=1:60
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:60
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end






function [c,f,s]= truecontrol12M50aux1(x,t,u,dudx) 
    c = 1;
    f = dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux2(x,t,u,dudx) 
    c = 1;
    f = 1.05*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux3(x,t,u,dudx) 
    c = 1;
    f = 1.1*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux4(x,t,u,dudx) 
    c = 1;
    f = 1.15*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux5(x,t,u,dudx) 
    c = 1;
    f = 1.2*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux6(x,t,u,dudx) 
    c = 1;
    f = 1.25*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux7(x,t,u,dudx) 
    c = 1;
    f = 1.3*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux8(x,t,u,dudx) 
    c = 1;
    f = 1.35*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux9(x,t,u,dudx)
    c = 1;
    f = 1.4*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux10(x,t,u,dudx) 
    c = 1;
    f = 1.45*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux11(x,t,u,dudx) 
    c = 1;
    f = 1.5*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux12(x,t,u,dudx) 
    c = 1;
    f = 1.55*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux13(x,t,u,dudx) 
    c = 1;
    f = 1.6*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux14(x,t,u,dudx) 
    c = 1;
    f = 1.65*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux15(x,t,u,dudx) 
    c = 1;
    f = 1.7*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux16(x,t,u,dudx) 
    c = 1;
    f = 1.75*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux17(x,t,u,dudx) 
    c = 1;
    f = 1.8*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux18(x,t,u,dudx) 
    c = 1;
    f = 1.85*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux19(x,t,u,dudx) 
    c = 1;
    f = 1.9*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux20(x,t,u,dudx) 
    c = 1;
    f = 1.95*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M50aux21(x,t,u,dudx) 
    c = 1;
    f = 2*dudx;
    coords=[-1.90992880528607;3.38813976574018;-16.6232094501234;26.0959908926501;-108.388289456641;165.163017632952;-580.320779791412;829.719970439845;-2471.06063025177;3165.07493134545;-7923.33895771056;8375.50429525851;-16489.8171241449;10242.9425785871;-5275.49067288428;-29329.2117051453;121681.713861926;-214321.201012474;588430.225398915;-673711.870293014;1663485.39013696;-1255394.71374822;3207366.50986190;-854862.100929670;3879360.41061437;3156393.15613713;780746.803321325;14213665.3518570;-9201255.10509750;33755570.4173411;-26243447.7906856;57867291.9528646;-45166201.6162773;77170728.4741617;-57242312.9155577;82104427.6797309;-56197626.4040449;70076551.6005811;-43217552.8880758;47657337.3232820;-25797348.3527099;25356550.1134460;-11627359.0888128;10208369.7467204;-3748181.61597277;2932191.34075146;-774927.671986034;536439.307503238;-77700.2467891168;47012.9474258393];
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:50
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:50
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end


function [c,f,s]= truecontrol12M40aux1(x,t,u,dudx) 
    c = 1;
    f = dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];    
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux2(x,t,u,dudx) 
    c = 1;
    f = 1.05*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux3(x,t,u,dudx) 
    c = 1;
    f = 1.1*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux4(x,t,u,dudx) 
    c = 1;
    f = 1.15*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux5(x,t,u,dudx) 
    c = 1;
    f = 1.2*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux6(x,t,u,dudx) 
    c = 1;
    f = 1.25*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux7(x,t,u,dudx) 
    c = 1;
    f = 1.3*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux8(x,t,u,dudx) 
    c = 1;
    f = 1.35*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux9(x,t,u,dudx)
    c = 1;
    f = 1.4*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux10(x,t,u,dudx) 
    c = 1;
    f = 1.45*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux11(x,t,u,dudx) 
    c = 1;
    f = 1.5*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux12(x,t,u,dudx) 
    c = 1;
    f = 1.55*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux13(x,t,u,dudx) 
    c = 1;
    f = 1.6*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux14(x,t,u,dudx) 
    c = 1;
    f = 1.65*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux15(x,t,u,dudx) 
    c = 1;
    f = 1.7*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux16(x,t,u,dudx) 
    c = 1;
    f = 1.75*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux17(x,t,u,dudx) 
    c = 1;
    f = 1.8*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux18(x,t,u,dudx) 
    c = 1;
    f = 1.85*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux19(x,t,u,dudx) 
    c = 1;
    f = 1.9*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux20(x,t,u,dudx) 
    c = 1;
    f = 1.95*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end
function [c,f,s]= truecontrol12M40aux21(x,t,u,dudx) 
    c = 1;
    f = 2*dudx;
    coords=[-1.93975287912074;3.70027035585361;-17.7162322245862;31.7719421008295;-127.152677164692;235.213874767066;-789.372670166892;1460.09465615647;-4167.79680856720;7495.19023631838;-18510.3275847650;31749.0869071014;-68820.2501284373;111207.379408274;-213894.939330764;323058.513524923;-555635.751856177;780181.372026527;-1205986.09914963;1567804.42834355;-2183969.07951035;2619099.18487031;-3289325.28460960;3624967.82362525;-4096517.33914741;4129882.48835506;-4179473.85791298;3832387.73195126;-3443340.66324212;2849909.70904092;-2240840.48989074;1656577.09560309;-1112593.73293930;723839.091391360;-397597.193017818;222715.736387984;-91508.4848591505;42649.0050281747;-10248.8595410874;3747.82686889472];   
    s=0;
    timecoord=[];
    if (x>1).*(x<2)
        for i=1:40
            timecoord(i)= (exp(-(1-t)*i^2)-exp(-2*(1-t)*i^2))/((1-t)*i^2);
        end
        for i=1:40
            s=s+ sin(i.*x).* coords(i).*timecoord(i);
        end
    end
end

function [c,f,s]= truecontrol01M50aux1(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux2(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.95*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux3(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c=1;
    timecoord=[];
    f = 0.9*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux4(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.85*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux5(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.8*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux6(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.75*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux7(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.7*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux8(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.65*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux9(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.6*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux10(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.55*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux11(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.5*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux12(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.45*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux13(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.4*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux14(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.35*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux15(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.3*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux16(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.25*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux17(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.2*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux18(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.15*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux19(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.1*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M50aux20(x,t,u,dudx)
    coords= [-11037.8588607350;48419.3804949788;-257768.174071248;890550.666342443;-3705908.27954329;10626060.8925615;-35383314.7513787;88228914.6629252;-242654381.490155;540808244.424562;-1255832490.85110;2540868934.48099;-5043722870.94822;9356442183.39725;-15930220346.6227;27304648640.4578;-39590023871.0996;63195147336.5243;-76183408645.8639;114556644350.652;-107932927829.066;156656428806.946;-94797135016.5734;144574854794.410;-265660718.833869;47646841518.1272;155546698816.449;-103093025168.569;270507601974.366;-214187969578.307;224233970296.830;-205513972254.263;-1159575766.61246;-93910595093.7801;-275518193221.918;19736947021.5438;-426170154405.217;54641844253.5428;-389921043773.516;20882652562.3401;-244713405262.742;-19035897586.8370;-106862739728.895;-28468365553.9098;-31029243751.7508;-16824097095.5213;-5305263206.76803;-5234309533.60827;-385219811.844271;-713752801.795393];
    s=0;
    c = 1;
    timecoord=[];
    f = 0.05*dudx;
    if (x>1).*(x<2)
    for i=1:50
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:50
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end


function [c,f,s]= truecontrol01M40aux1(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux2(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.95*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux3(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c=1;
    timecoord=[];
    f = 0.9*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux4(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.85*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux5(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.8*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux6(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.75*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux7(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.7*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux8(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.65*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux9(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.6*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux10(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.55*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux11(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.5*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux12(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.45*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux13(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.4*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux14(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.35*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux15(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.3*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux16(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.25*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux17(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.2*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux18(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.15*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux19(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.1*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
function [c,f,s]= truecontrol01M40aux20(x,t,u,dudx)
    coords= [-2182.28679328800;8442.70158037968;-47676.9197967973;142323.871573316;-611170.941248989;1480840.41534069;-5008095.20406600;10269444.1242011;-28395292.2945707;50395350.7118696;-116795441.186551;181171721.766233;-356577622.556591;484686802.044160;-810619804.373998;964129125.190764;-1343304981.30048;1398057489.11212;-1506664160.71561;1414826689.03996;-841986069.342580;973307873.694598;444915720.682789;766653723.841672;1292437613.41769;1687485002.65280;758550370.136035;3599039035.31309;-789205323.574114;5075888393.05509;-1964161759.28667;4847096849.09844;-1917732385.08016;3180050141.61250;-1089647347.79627;1393497128.90725;-357487358.427870;371370049.537670;-53424959.6893959;45902098.3700100];  
    s=0;
    c = 1;
    timecoord=[];
    f = 0.05*dudx;
    if (x>1).*(x<2)
    for i=1:40
        timecoord(i)= (1-exp(-(1-t)*i^2))/((1-t)*i^2);
    end
    for i=1:40
        s=s+ sin(i.*x).* coords(i).*timecoord(i);
    end
    end
end
