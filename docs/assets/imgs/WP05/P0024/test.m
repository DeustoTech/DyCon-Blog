close all

N = 50;
s = [0.1 0.4 0.5 0.8];
x = linspace(-1,1,N+2);
h = x(2)-x(1);
x = x(2:end-1);
const = (2.^(-2.*s)*sqrt(pi))./(gamma(0.5+s).*gamma(1+s));
ureal = zeros(N,4);
u = zeros(N,4);

f = @(x) 1+0*x;
Phi = @(x) 1-abs(x);
F = zeros(N,1);

for i=1:N
    xx = linspace(x(i)-h,x(i)+h,N+1);
    xx = 0.5*(xx(2:end)+xx(1:end-1));
    B1 = f(xx).*(Phi((xx-x(i))/h));
    F(i) = ((2*h)/N)*sum(B1); 
end

for i = 1:4
    ureal(:,i) = const(i)*(1-x.^2).^s(i);
    A = FEFractionalLaplacian(s(i),1,N);
    u(:,i) = A\F;
end

figure
subplot(2,2,1)
plot(x,u(:,1))
hold on 
plot(x,ureal(:,i),'*r')

subplot(2,2,2)
plot(x,u(:,2))

subplot(2,2,3)
plot(x,u(:,3))

subplot(2,2,4)
plot(x,u(:,4))
    
