
function [x_opt,z_opt]=Simplex_Method(c,A,b)
% Auto‑generated on 2025-05-10
options=optimoptions('linprog','Algorithm','dual-simplex','Display','none');
[x_opt,fval]=linprog(-c,A,b,[],[],zeros(size(c)),[],options);
z_opt=-fval;
end
