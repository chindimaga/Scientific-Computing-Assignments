%Assignment 2 question 2
%Name : Rahul D
%Roll no: 180102054

syms f(x)
f(x) = x+2/x;

%x,y in the array x_cor,y_cor

x_cor = zeros(4,1);
y_cor = zeros(4,1);
N = length(x_cor);
for i = 1:N
    x_cor(i) = i/2;
    y_cor(i) = f(x_cor(i));
end

h = zeros(1,N-1);
u = zeros(1,N-2);
b = zeros(N-1,1);
v = zeros(N-2,1);

for i =1:N-1
    h(i) = x_cor(i+1)-x_cor(i);
    b(i) = 6*(y_cor(i+1)-y_cor(i))/h(i);
end

for i =1:N-2
    u(i) = 2*(h(i)+h(i+1));
    v(i) = b(i+1)-b(i);
end
A = diag(u) + diag(h(2:N-2),1) + diag(h(2:N-2),-1);
m = zeros(N,1);
m(2:N-1) = A\v;


syms S(x)
S(x) = 0;
syms temp(x)
temp(x)=0;
for i =1:N-1
    temp(x) = m(i)/(6*h(i))*(x_cor(i+1)-x)^3+m(i+1)/(6*h(i))*(x-x_cor(i))^3+(y_cor(i+1)/h(i)-m(i+1)*h(i)/6)*(x-x_cor(i))+(y_cor(i)/h(i)-m(i)*h(i)/6)*(x_cor(i+1)-x);
    S(x) = piecewise(x_cor(i)<=x<=x_cor(i+1), temp(x), S(x));
end


%Plot all data
scatter(x_cor,y_cor,'filled','DisplayName','cordinates')
hold on
fplot(@(x) S(x),[0.5,2],'g','DisplayName','Spline')
fplot(@(x) f(x),[0.5,2],'r')
hold off
legend

