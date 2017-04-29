function D=dissimilarity(I1,I2)
K=size(I1,1);
Dis=zeros(4,3);
for i=1:K
    %right
    Dis(1,1)=Dis(1,1)+abs(2*I1(i,K,1)-I1(i,K-1,1)-I2(i,1,1));
    Dis(1,2)=Dis(1,2)+abs(2*I1(i,K,2)-I1(i,K-1,2)-I2(i,1,2));
    Dis(1,3)=Dis(1,3)+abs(2*I1(i,K,3)-I1(i,K-1,3)-I2(i,1,3));
    %left
    Dis(2,1)=Dis(2,1)+abs(2*I1(i,1,1)-I1(i,2,1)-I2(i,K,1));
    Dis(2,2)=Dis(2,2)+abs(2*I1(i,1,2)-I1(i,2,2)-I2(i,K,2));
    Dis(2,3)=Dis(2,3)+abs(2*I1(i,1,3)-I1(i,2,3)-I2(i,K,3));
    %up
    Dis(3,1)=Dis(3,1)+abs(2*I1(1,i,1)-I1(2,i,1)-I2(K,i,1));
    Dis(3,2)=Dis(3,2)+abs(2*I1(1,i,2)-I1(2,i,2)-I2(K,i,2));
    Dis(3,3)=Dis(3,3)+abs(2*I1(1,i,3)-I1(2,i,3)-I2(K,i,3));
    %down
    Dis(4,1)=Dis(4,1)+abs(2*I1(K,i,1)-I1(K-1,i,1)-I2(1,i,1));
    Dis(4,2)=Dis(4,2)+abs(2*I1(K,i,2)-I1(K-1,i,2)-I2(1,i,2));
    Dis(4,3)=Dis(4,3)+abs(2*I1(K,i,3)-I1(K-1,i,3)-I2(1,i,3));
end
D=sum(Dis,2);
%sum(Dis,2)
end