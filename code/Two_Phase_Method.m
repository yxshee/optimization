
function [x_opt,z_opt]=Two_Phase_Method(c,A,b)
% Auto‑generated on 2025-05-10
[m,n]=size(A);
I=eye(m);
A1=[A,I];
c1=[zeros(1,n),ones(1,m)];
opt=optimoptions('linprog','Algorithm','dual-simplex','Display','none');
[x1,fval1]=linprog(c1,A1,b,[],[],zeros(1,n+m),[],opt);
if fval1>1e-8, error('Infeasible'); end
[x2,fval2]=linprog(-c,A,b,[],[],zeros(1,n),[],opt);
x_opt=x2; z_opt=c*x_opt;
end
