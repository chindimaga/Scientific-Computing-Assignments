%Assignment 2 question 1
%Name : Rahul D
%Roll no: 180102054

syms f(x)
f(x) = 1/(1+x^2);

%x,y in the array x_cor,y_cor
x_cor = zeros(8,1);
y_cor = zeros(8,1);
N = length(x_cor);
for i = 1:8
    x_cor(i) = -5 + (10*i / 8);
    y_cor(i) = f(x_cor(i));
end

%Poly_coff will store the polynomial coeffficients of the LagrangePs interpolating polynomial.
Poly_coff=0;
for i=1:N
    p=1;
    for j=1:N
        if j~=i
            c = poly(x_cor(j))/(x_cor(i)-x_cor(j));
            p = conv(p,c);
        end
    end
    term = p*y_cor(i);
    Poly_coff= Poly_coff + term;
end

%Plot all data
scatter(x_cor,y_cor,'filled','DisplayName','cordinates')
hold on
fplot(@(x) polyval(Poly_coff,x),[-4,5],'g','DisplayName','Lagranges Poly')
fplot(@(x) f(x),[-5,5],'r')
hold off
legend