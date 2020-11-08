%Assignment 3 question 1
%Name : Rahul D
%Roll no: 180102054

syms f(x)
f(x) = exp(-1 * x * x);

%Actual value of g(1)
actual_val = 0.74682413;

subintervals = [50 ; 100 ; 200];
rect  = [];
trap = [];
simp = [];

for N = [50, 100, 200]
    
    x_cor = linspace(0,1,N+1);
    h = x_cor(2)-x_cor(1);
    y_cor = zeros(N+1,1);
    ym_cor = zeros(N,1);
    
    for i = 1:N+1
        y_cor(i) = f(x_cor(i));
    end
    
    for i = 1:N
        ym_cor(i) = f(x_cor(i)+h/2);
    end
    
    rect_I = sum(y_cor(1:N)) * h;
    trap_I = (2 * sum(y_cor(2:N)) + y_cor(1) + y_cor(N+1)) * h/2;
    simp_I = (2 * sum(y_cor(2:N)) + y_cor(1) + y_cor(N+1) + 4 * sum(ym_cor))*h/6;
    
    rect = [rect ; rect_I];
    trap = [trap ; trap_I];
    simp = [simp ; simp_I];

end

E_R = rect-actual_val;
E_T = trap - actual_val;
E_S = simp - actual_val;
VarNames = {'N','R rule','T rule','S rule','E R','E T','E S'};
T = table(subintervals,rect,trap,simp,E_R,E_T,E_S, 'VariableNames',VarNames)