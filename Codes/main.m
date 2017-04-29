clear all;
close all;
path_name = '../Input/Multiple4/titlilenanadijharna64.png';
Im = imread(path_name);

Q=Im;
%imshow(Im);
global placed
global placed_counter
global display_mat
global store

%close all
% converting rgb color space to L*a*b
cform = makecform('srgb2lab');
I = applycform(Im, cform);
I = im2double(I);

sub_sz = 64;  %%% size of sub-images
sz = size(I);
p_size=64;
nR = 16;nC = 16;
dis_mat = zeros(sz(1)/sub_sz, sz(2)/sub_sz, 4);
display_mat =zeros(sz(1)/sub_sz, 8);
c=0; d=0; %%% local counter for getting the sub-image number

%%% division of image into sub-images and calculating dissimilarity between
%%% pieces
i=1;
pr=0;
pieces = cell(1,8*8);
placed_counter = 8*8;
while i<sz(1)
    j=1;
    lm=1;
    pr=pr+1;
    while j<sz(2)
        I1 = I(i:i+sub_sz-1, j:j+sub_sz-1, :);
        pieces{(pr-1)*8+lm}  = Q(i:i+sub_sz-1, j:j+sub_sz-1, :);
        lm=lm+1;
        c = c+1;
        k=1;
        d=0;
        while k<sz(1)
            l=1;
            while l<sz(2)
                I2 =  I(k:k+sub_sz-1, l:l+sub_sz-1, :);
                dissim = dissimilarity(I1, I2);
                d = d+1;
                for m=1:4
                    dis_mat(c, d, m) = dissim(m,1);
                end
                l =l+sub_sz;
            end
            k = k+sub_sz;
        end
        j =  j+sub_sz;
    end
    i =  i+sub_sz;
end
placed=zeros(size(pieces,2),1);
C=compatibility(dis_mat);
% placement using only best buddies.
mc = mutual_compat(pieces, C);
% finding display_mat
maxmat(mc);

fp=[];
store=zeros(16,16);
c_fp=1;
global pool pos;
pool = containers.Map('KeyType','int32','ValueType','int32');
pos = containers.Map('KeyType', 'int32', 'ValueType', 'int32');

x = firstpiece(p_size, display_mat);
store(8,8) = x;
pos(x)=16*7+8;
fp(1)=x;
c_fp=c_fp+1;
placed(x)=1;
placed_counter=placed_counter-1;
y=best_neighbors(x);
for k=1:4
    if y(k)~=0
        pool(y(k))=1;
    end
end
xf=1;
old_x=0;
a=0;
while placed_counter>0
    if (size(keys(pool),2)~=0)
        x = bestpiece(display_mat);
    else
        C=compatibility(dis_mat);
        mc = mutual_compat(pieces, C);
        maxmat(mc);
        x = firstpiece(p_size, display_mat);
        
        if x>0 && placed(x)==0
            Out = construct(store, pieces);
                 if sum(sum(sum(Out)))~=0
                    figure, imshow(Out);
                 end
            store=zeros(16,16);
            pos = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
            store(8,8) = x;
            pos(x)=16*7+8;
            fp(c_fp)=x;
            c_fp=c_fp+1;
            if placed(x)==0
            placed_counter=placed_counter-1;
            placed(x)=1;
            end
        end
    end
    y=best_neighbors(x);
    remove(pool,{x});
    xf=placing(x,y, nC);
    
    if x==old_x && (size(keys(pool),2)==0) && xf==0
        count=1;
        break;
    end
    old_x=x;
end

Out=construct(store,pieces);
figure, imshow(Out);