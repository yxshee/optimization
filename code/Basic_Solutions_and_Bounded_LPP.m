
function [BFS, z_best, x_best] = Basic_Solutions_and_Bounded_LPP(A,b,c)
% Auto‑generated on 2025-05-10
[m,n] = size(A);
BFS=[];
for idx = nchoosek(1:m,n)'
    B = A(idx,:);
    if rank(B)==n
        x = zeros(n,1);
        xB = B\b(idx);
        if all(xB>=0)
            x(:)=xB;
            BFS=[BFS,x];
        end
    end
end
z=c*BFS;
[z_best,k]=max(z);
x_best=BFS(:,k);
end
