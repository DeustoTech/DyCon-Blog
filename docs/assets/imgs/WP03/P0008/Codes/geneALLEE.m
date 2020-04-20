function f=geneALLEE(t,y)
theta=0.33;
%sigma=0.5;
%sigma=10;
%sigma=20;
sigma=40;
%sigma=1000;




M=@(x)exp(-x.^2/sigma);

N=1;
f=[(y(2));(-2*(-2*t/sigma))*y(2)-y(1)*(1-y(1))*(y(1)-theta)];
end