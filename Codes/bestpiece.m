function maxI=bestpiece(N)
global pool
allKeys = keys(pool);

f=0;
for j=1:size(allKeys,2)
    i=allKeys{j};
    x= (N(i,1)+N(i,3)+N(i,7)+N(i,5));
    if(f==0)
        maxI = i;
        max_comp = x;
        f=1;
    else
        if(max_comp<x)
            maxI=i;
            max_comp = x;
        end
    end
end
end