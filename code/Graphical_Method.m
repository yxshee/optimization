
function [x_opt, z_opt] = Graphical_Method(A, b, c)
% GRAPHICAL_METHOD  Solves a 2‑variable linear programming problem using
% the graphical approach and visualises the feasible region.
% Auto‑generated on 2025-05-10
%   Maximise (or minimise)  c * x
%   subject to             A * x ≤ b ,  x ≥ 0
% ----------------------------------------------------------------------
assert(size(A,2)==2, 'Method requires exactly 2 decision variables');
m = size(A,1);
comb = nchoosek(1:m,2);
pts = [];
for k = 1:size(comb,1)
    M = A(comb(k,:),:);
    rhs = b(comb(k,:));
    if rank(M)==2
        p = M\rhs;
        if all(A*p <= b+1e-9) && all(p>=0)
            pts = [pts, p];
        end
    end
end
% Axes intersections
for i = 1:m
    if A(i,1) ~= 0
        p = [b(i)/A(i,1);0];
        if all(A*p <= b+1e-9) && all(p>=0), pts=[pts,p]; end
    end
    if A(i,2) ~= 0
        p = [0;b(i)/A(i,2)];
        if all(A*p <= b+1e-9) && all(p>=0), pts=[pts,p]; end
    end
end
z = c*pts;
[z_opt,idx] = max(z);
x_opt = pts(:,idx);
figure; hold on; grid on;
patch(pts(1,:), pts(2,:), 'cyan', 'FaceAlpha',0.3);
plot(x_opt(1), x_opt(2),'rp','MarkerSize',10,'MarkerFaceColor','r');
title(sprintf('Optimal solution: z = %.2f',z_opt));
end
