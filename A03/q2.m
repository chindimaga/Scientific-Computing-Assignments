%Assignment 3 question 2
%Name : Rahul D
%Roll no: 180102054

% After decoupling the second order diff equation
% y' = f(x,y,z) = z 
% z' = g(x,y,z) = cos(x*y)

N = 64;
x = [];
y = [];
z = [];
for x_n = [0.25,0.5,0.75,1]
    x_cor = linspace(0,x_n,N+1);
    y_cor = zeros(N+1,1);
    z_cor = zeros(N+1,1);
    
    %Initial conditions
    y_cor(1) = 1;
    z_cor(1) = 0;
    
    h = x_cor(2)-x_cor(1);
    
    for i = 1:N
        
        k1 = h * z_cor(i);
        l1 = h * cos(x_cor(i)*y_cor(i));
        k2 = h * (z_cor(i)+l1/2);
        l2 = h * cos((x_cor(i)+h/2)*(y_cor(i)+k1/2));
        k3 = h * (z_cor(i)+l2/2);
        l3 = h * cos((x_cor(i)+h/2)*(y_cor(i)+k2/2));
        k4 = h * (z_cor(i)+l3);
        l4 = h * cos((x_cor(i)+h)*(y_cor(i)+k3));
        
        y_cor(i+1) = y_cor(i)+ (k1+2*k2+2*k3+k4)/6;
        z_cor(i+1) = z_cor(i)+ (l1+2*l2+2*l3+l4)/6;
        
    end
    x = [x;x_n];
    y = [y;y_cor(N+1)];
    z = [z;z_cor(N+1)];
end


%create table
VarNames = {'x_n','y_n','ydash_n'};
T = table(x,y,z, 'VariableNames',VarNames);

% set desired precision in terms of the number of decimal places for the
% values in table
n_decimal = 6;
new_T = varfun(@(x) num2str(x, ['%' sprintf('.%df', n_decimal)]), T);
new_T.Properties.VariableNames = T.Properties.VariableNames;
new_T.Properties.RowNames = T.Properties.RowNames;

new_T