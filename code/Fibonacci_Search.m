
function [xmin,fmin]=Fibonacci_Search(f,a,b,tol)
% Auto‑generated on 2025-05-10
if nargin<4, tol=1e-4; end
F=[1,1]; 
while F(end)<(b-a)/tol, F=[F,sum(F(end-1:end))]; end
n=numel(F)-2; rho=1-F(n)/F(n+2); d=rho*(b-a);
x1=a+d; x2=b-d; f1=f(x1); f2=f(x2);
for k=1:n-1
    if f1>f2
        a=x1; x1=x2; f1=f2; d=rho*(b-a); x2=b-d; f2=f(x2);
    else
        b=x2; x2=x1; f2=f1; d=rho*(b-a); x1=a+d; f1=f(x1);
    end
end
xmin=(a+b)/2; fmin=f(xmin);
end
