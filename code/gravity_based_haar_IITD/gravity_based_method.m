
function [N,im2] = gravity_based_method(image);



im = image;

s = size(im);
%in1 = im2bw(im, .3);     %% need to tune the parameters 

in1 = im2bw(im, .15);     %% need to tune the parameters 

for i = 1 : s(1)
    for j = 1 : s(2)
        imnew(i,j) = 1 - in1(i,j);
    end
end
%figure, imshow(imnew);title('imnew');

c1_1 = 0;
c1_2 = 0;
c2_1 = 0;
c2_2 = 0;
for i = 1 : s(1)
    for j = 1 : s(2)
        c1_1 =  c1_1 + i * imnew(i,j);
        c1_2 =  c1_2 + imnew(i,j);
        c2_1 =  c2_1 + j * imnew(i,j);
        c2_2 =  c2_2 + imnew(i,j);
     end
end
c1 = round(c1_1 / c1_2);
c2 = round(c2_1 / c2_2);

rad = 80;                    %% need to tune parametres
for k = 1:6
    c1_1 = 0;
    c1_2 = 0;
    c2_1 = 0;
    c2_2 = 0;
    for i = c1 - rad : c1 + rad
         for j = c2 - rad : c2 + rad
             if(((i>0) & (j<240)) & ((j>0) & (j<320)))
                     c1_1 =  c1_1 + i * imnew(i,j);
                     c1_2 =  c1_2 + imnew(i,j);
                     c2_1 =  c2_1 + j * imnew(i,j);
                     c2_2 =  c2_2 + imnew(i,j);
             end
         end
    end
    c1 = round(c1_1 / c1_2);
    c2 = round(c2_1 / c2_2);
    rad = rad - 10;
    if( rad==40)
        for i = c1-20 : c1+20
            for j = c2-20 : c2 +20
                imnew(i,j) = 1;
            end
        end
      %  figure, imshow(imnew);title('imnew');
    end
end

l = 0;

%keyboard()
 for irad = c1 - 45 : c1 + 45
     
%      if(irad < 1)
%          irad_n  =1;
%      else
%          irad_n = irad;
%      end
      l = l+1;
      m = 0;
      for jrad = c2 - 45 : c2 + 45
%           if(jrad <1)
%               jrad_n =1;
%           else
%               jrad_n = jrad;
            m = m+1;
            radiusmatrix(l,m) = imnew(irad,jrad) ;
      end
 end
inner_rad = round (sqrt(sum(sum(radiusmatrix))/pi));


% below is dowquantization of image 

for i = 1 : s(1)
    for j = 1 : s(2)
        imseg(i,j)=(im(i,j)/32)*32;
    end
end
imseg = medfilt2(imseg,[5,5]);
%

l =0;
N = 2*pi /400;
diffarray = double(zeros(1,110));
sumarray = double(zeros (1,110));
for n = 0:49
    l = l+1;
    %sum = 0.0; 
    for i = 1:110
       p1 = round(i * cos(N*n) + c2);
       p2 = round(i * sin(N*n) + c1);
       diff=0.0;
       if( ((p1>3) & (p1<318)) & ((p2>3) & (p2<238)) )
            diff=abs(double(imseg(p2+2, p1+2))- double(imseg(p2-1, p1-1)))+abs(double(imseg(p2+1, p1+1))- double(imseg(p2, p1)))+abs(double(imseg(p2+3, p1+3))- double(imseg(p2-2, p1-2)));
            diffarray(i)=diffarray(i)+diff;
            %sumarray(i) = sumarray(i)+ double(imseg(p2, p1));
       end
    end
end

% xyz = 1:110;
%% figure,plot(xyz,sumarray);title('sumarray');
lmn = 1:110;
%figure,plot(lmn,diffarray);title('diffarray');

max=0;
for i=70:110
    if (diffarray(i)>max)
        max=diffarray(i);
        outer_rad=i;
    end    
end


%keyboard()
[im2,xp,yp,xs,ys] = draw_circle(im,inner_rad,c2,c1,outer_rad,c2,c1);




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
 
%figure, imshow(N)
 


end

