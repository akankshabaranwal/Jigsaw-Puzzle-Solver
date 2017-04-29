function I=reconstruct(pieces, hrzl, hrzr, vertt, vertd)
list=[];
n_list = 0;

% horizontal strip
for i=1:size(hrzl)
    if hrzr(i)==0
        n_list = n_list+1;
        list(n_list, 1) = i;
        Count = 2;
        k=i;
        while hrzl(k)~=0
            list(n_list, Count) = hrzl(k);
            k = hrzl(k);
            Count = Count+1;
        end
    end
end
end