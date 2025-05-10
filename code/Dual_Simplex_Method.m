
function [x_opt,z_opt]=Dual_Simplex_Method(c,A,b)
% Auto‑generated on 2025-05-10
opts=optimoptions('linprog','Algorithm','dual-simplex','Display','none');
[x_opt,fval]=linprog(-c,A,b,[],[],[],[],opts);
z_opt=-fval;
end
