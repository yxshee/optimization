
function [X,cost]=Least_Cost_Method(supply,demand,C)
% Auto‑generated on 2025-05-10
supply=supply(:)'; demand=demand(:)';
[m,n]=size(C); X=zeros(m,n);
while any(supply)&any(demand)
    [~,idx]=min(C(:)); [i,j]=ind2sub([m,n],idx);
    qty=min(supply(i),demand(j));
    X(i,j)=qty; supply(i)=supply(i)-qty; demand(j)=demand(j)-qty;
    C(i,j)=inf;
end
cost=sum(sum(X.*C));
end
