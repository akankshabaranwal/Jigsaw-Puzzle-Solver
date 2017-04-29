function mutual=mutual_compat( Im,C)
mutual= zeros(size(Im,2),size(Im,2),4);
for i=1:size(Im,2)
    for j=1:size(Im,2)
        mutual(i,j,1)= (C(i,j,1)+C(j,i,2))/2; %right
        mutual(j,i,2)= mutual(i,j,1); %left
        mutual(i,j,3)= (C(i,j,3)+C(j,i,4))/2; %top
        mutual(j,i,4)= mutual(i,j,3); %down
    end
end
end