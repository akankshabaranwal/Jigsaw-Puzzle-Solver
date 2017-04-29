function x=maxmat(mc)
global display_mat;
i=1;
s = size(mc);
while (i<=s(1))
    [mx, id] = max(mc(i, :, 1)');
    display_mat(i, 1) = mx;
    display_mat(i, 2) = id;
    [mx, id] = max(mc(i, :, 2)');    
    display_mat(i, 3) = mx;
    display_mat(i, 4) = id;
    
    [mx, id] = max(mc(i, :, 3)');    
    display_mat(i, 5) = mx;
    display_mat(i, 6) = id;
    [mx, id] = max(mc(i, :, 4)');    
    display_mat(i, 7) = mx;
    display_mat(i, 8) = id; 
    i= i+1;
end 
end