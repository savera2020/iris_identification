


function [rp,yp,xp,rs,ys,xs]= detection(BW)


%BW = edge(im,'canny');

 %BW = im6;


%figure,imshow(BW);




val = [];

roe = [];

colum = [];


for r = 30:60            %% for a range of r values
    
    [C l m] = HTCircle(BW,r);     %% calculate max C and their indices
    
    val = [val; C];               %% save all the max value for all the in val
    
    roe = [roe; l];               %% save their indices
    
    colum = [colum; m];
    
end

[dummy,temp1] = max(val);         %% find the max value for detecting the circle find indices

xp = roe(temp1);                 %% x0 for circle

yp = colum(temp1);            %% y0 of circle

rp = temp1+30;                  %% radius


val = [];

roe = [];

colum = [];

for r = 80:120          %% for a range of r values
    
    [C l m] = HTCircle(BW,r);     %% calculate max C and their indices
    
    val = [val; C];               %% save all the max value for all the in val
    
    roe = [roe; l];               %% save their indices
    
    colum = [colum; m];
    
end

[dummy,temp2] = max(val);         %% find the max value for detecting the circle find indices

xs = roe(temp2);                 %% x0 for circle

ys = colum(temp2);            %% y0 of circle

rs = temp2+80;                  %% radius











end
