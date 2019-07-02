%clear all
function [N_I,im2] = hough_transform(im)

%I = im;

%figure,imshow(im)
I = rgb2gray(im);
BW = edge(I,'canny');




[r1p,y1p,x1p,r1s,y1s,x1s]= detection(BW);   


[im2,xp,yp,xs,ys] = draw_circle(im,r1p,y1p,x1p,r1s,y1s,x1s);



N_I = normalization(im,xp,xs,yp,ys);





 
 N = histeq(N_I);
 


