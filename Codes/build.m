function I=build(curr,i,j)
global visited hrzl hrzr vertt vertd store
%disp(curr);
if curr==0 || visited(curr)~=0 || i<=0 || j<=0 || i>size(store,1) || j>size(store,2)
    return;
elseif curr~=0
    store(i,j)=curr;
    visited(curr)=1;
    build(hrzl(curr),i,j-1); %left
    %disp('left done');
    build(vertt(curr),i-1,j); %top
    build(hrzr(curr),i,j+1); %right
    build(vertd(curr),i+1,j); %down
end
end