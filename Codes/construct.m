function X=construct(store,pieces)
X=[];
f=zeros(size(pieces{1}));
for i=1:size(store,1)
    I=[];
    for j=1:size(store,2)
        if store(i,j)~=0
            if size(I)==0
                I=pieces{store(i,j)};
            else
            I = cat(2, I, pieces{store(i,j)});
            end
        else 
             if size(I)==0
                I=f;
            else
            I = cat(2, I, f);
            end
        end        
    end
    if size(X)==0
        X=I;
    else
        X=cat(1, X, I);
    end
end
end