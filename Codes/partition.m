path_name = '../PuzzleDataset/nadi.jpg';
Im = imread(path_name);
for i=1:64:size(Im,1)
    
    for j=1:size(Im,2)
        Im(i,j,1)=0;
        Im(i,j,2)=0;
        Im(i,j,3)=0;
    end
end
for j=1:64:size(Im,2)
    
    for i=1:size(Im,1)
        Im(i,j,1)=0;   
        Im(i,j,2)=0;
        Im(i,j,3)=0;
    end
end
imshow(Im);