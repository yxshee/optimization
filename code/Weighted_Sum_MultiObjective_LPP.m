
function [x_opt,z_vec]=Weighted_Sum_MultiObjective_LPP(A,b,C_obj,w)
% Auto‑generated on 2025-05-10
c=w*C_obj;
opt=optimoptions('linprog','Algorithm','dual-simplex','Display','none');
[x_opt,~]=linprog(c,A,b,[],[],zeros(size(c')),[],opt);
z_vec=C_obj*x_opt;
end
