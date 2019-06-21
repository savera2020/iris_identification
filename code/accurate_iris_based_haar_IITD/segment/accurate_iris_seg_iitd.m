


function [N,im2] = accurate_iris_seg_iitd(im_src)

[center, radius, center_p, radius_p]= segment_NIR_IITD(im_src);

cp1 = center_p(1);
cp2 = center_p(2);
cs1 = center(1);
cs2 = center(2);
[im2,xp,yp,xs,ys] = draw_circle(im_src,radius_p,cp1,cp2,radius,cs1,cs2);
im = im_src;
N_I = normalization(im,xp,xs,yp,ys);



N_I(32:64,120:200) = 0;

N_I(32:64,1:20) = 0;

N_I(32:64,300:320) = 0;


 for i =1:64
 for j = 1:320
 
 if ((N_I(i,j) < 90))
 
 N_I(i,j) = 0;
 end
 end
 end

 
 N = histeq(N_I);

