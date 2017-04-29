function C=compatibility(D)
global placed
for i=1:size(D,1)
    for j=1:size(D,1)
        for k=1:4
            if j==1
                min1(i,k)=D(i,j,k);
                min2(i,k)=D(i,j,k);
            end
            if D(i,j,k)<min1(i,k)
                min2(i,k)=min1(i,k);
                min1(i,k)=D(i,j,k);
            end
        end
    end
end
for i=1:size(D,1)
    for j=1:size(D,1)
        for k=1:4
            if placed(i)==1 || placed(j)==1 
                C(i,j,k)=-100000;
            else
            C(i,j,k)=1-(D(i,j,k)/min2(i,k));
            end
        end
    end
end
end