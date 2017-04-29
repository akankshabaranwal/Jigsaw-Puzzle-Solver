function maxI=firstpiece( Size,N)
f=0;

for i=1:Size
    if (i==N(N(i,4),2)) && (i==N(N(i,2),4)) && (i==N(N(i,6),8)) && (i==N(N(i, 8),6))
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
if f==0
    for i=1:Size
        if (i==(N(N(i,4),2)) && (i==N(N(i,2),4)) ) || ((i==N(N(i,6),8)) && (i==N(N(i, 8),6)))
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
end

if f==0
    maxI=0;
end
end