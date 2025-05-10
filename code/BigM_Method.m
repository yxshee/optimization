
function [x_opt,z_opt]=BigM_Method(c,A,b)
% Auto‑generated on 2025-05-10
M=1e6;
[m,n]=size(A);
c_big=[c,M*ones(1,m)];
A_big=[A,eye(m)];
options=optimoptions('linprog','Algorithm','dual-simplex','Display','none');
[x,fval]=linprog(c_big,A_big,b,[],[],zeros(1,n+m),[],options);
x_opt=x(1:n);
z_opt=c*x_opt;
end
