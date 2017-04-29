function f=best_neighbors(x)
global display_mat;
f=zeros(4,1);

if display_mat(display_mat(x,2), 4)==x && display_mat(x,1)>=0.2
f(1)=display_mat(x,2);%right
end
if display_mat(display_mat(x,4), 2)==x && display_mat(x,3)>=0.2
f(2)=display_mat(x,4);%left
end
if display_mat(display_mat(x,6), 8)==x && display_mat(x,5)>=0.2
f(3)=display_mat(x,6);%top
end
if display_mat(display_mat(x,8), 6)==x &&  display_mat(x,7)>=0.2
f(4)=display_mat(x,8);%bottom
end
end