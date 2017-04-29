function xf = placing(x,y, nC)
xf=0;
global pos store placed pool placed_counter 
isthere = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
oldp=placed(x);
for k=1:4
    if(y(k)~=0)
        if placed(y(k))==0
            pool(y(k))=1;
        else
            if k==1 % right
                pos(x)=pos(y(k))-1;
                if isKey(isthere,pos(x))==1
                    isthere(pos(x))=isthere(pos(x))+1;
                else
                    isthere(pos(x))=1;
                end

                g = indices(pos(x), nC);
                store(g(1), g(2)) = x;
                placed(x)=1;
                xf=1;
            elseif k==2 %left
                pos(x)=pos(y(k))+1;
                if isKey(isthere,pos(x))==1
                    isthere(pos(x))=isthere(pos(x))+1;
                else
                    isthere(pos(x))=1;
                end
                
                g = indices(pos(x),  nC);
                store(g(1), g(2)) = x;
                placed(x)=1;
                xf=1;
            elseif k==3 %top
                pos(x)=pos(y(k))+nC;
                if isKey(isthere,pos(x))==1
                    isthere(pos(x))=isthere(pos(x))+1;
                else
                    isthere(pos(x))=1;
                end
                
                g = indices(pos(x),  nC);
                store(g(1), g(2)) = x;
                placed(x)=1;
                xf=1;
            else %down
                pos(x)=pos(y(k))-nC;
                if isKey(isthere,pos(x))==1
                    isthere(pos(x))=isthere(pos(x))+1;
                else
                    isthere(pos(x))=1;
                end
                
                g = indices(pos(x),  nC);
                store(g(1), g(2)) = x;
                placed(x)=1;
                xf=1;
            end
        end
    end
end
Index=keys(isthere);
for i=1:size(Index,2)
    if i==1
        Maxfreq=isthere(Index{1});
        j=Index{1};
    elseif isthere(Index{i})>Maxfreq
        Maxfreq=isthere(Index{i});
        j=Index{i};   
    end
end

for i=1:size(Index,2)
    if j~=Index{i}
         g = indices(Index{i},  nC);
        store(g(1), g(2)) = 0;
    end
end
     
if xf==1 && oldp==0
    placed_counter=placed_counter-1;
end
end