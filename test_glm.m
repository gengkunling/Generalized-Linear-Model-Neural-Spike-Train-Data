x1 = [2100 2300 2500 2700 2900 3100 ...
     3300 3500 3700 3900 4100 4300]';
 x2 = [2100 2300 2500 2700 2900 3100 ...
     3300 3500 3700 3900 4100 4300]'; 
 x = [x1, x2];
 
n = [48 42 31 34 31 21 23 23 21 16 17 21]';
y = [1 2 0 3 8 8 14 17 19 15 17 21]';
y = y./n;
n = ones(size(y));
b = glmfit(x,[y, n],'binomial','link','probit');
b
yfit = glmval(b,x,'probit');
figure
plot(x, y./n,'o',x,yfit./n,'-','LineWidth',2)