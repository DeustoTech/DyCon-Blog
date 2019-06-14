close all

s = [0.1 0.4 0.5 0.8];
N = 50;
x = linspace(-1,1,N+2);
x = x(2:end-1);
h = x(2)-x(1);

f = @(x) 1+0*x;
Phi = @(x) 1-abs(x);

F = zeros(N,1);

for i = 1:N
    xx = linspace(x(i)-h,x(i)+h,N+1);
    xx = 0.5*(xx(2:end)+xx(1:end-1));
    B1 = f(xx).*(Phi((xx-x(i))/h));
    F(i) = ((2*h)/N)*sum(B1); 
end

sol = zeros(N,4);
ureal = zeros(N,4);

for i = 1:4
    A = FEFractionalLaplacian(s(i),1,N);
    sol(:,i) = A\F;
    d = sqrt(pi)/((2^(2*s(1)))*gamma(0.5*(1+2*s(1)))*gamma(1+s(1)));
    ureal(:,i) = d*(1-abs(x).^2).^s(i);
end

figure(1)
plot(x,sol(:,3))
hold on
plot(x,ureal(:,3),'*')
%axis([-L-0.5 L+0.5 -0.2,1.1*m2]);
legend({'Numerical solution','Real solution'},'Location','south');
