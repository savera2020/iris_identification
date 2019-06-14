

function [im2,xp,yp,xs,ys] = draw_circle(im,rp,Yp,Xp,rs,Ys,Xs)

% rp = 51;
% 
% rs = 99;


if (sqrt((Xs-Xp)^2 + (Ys - Yp)^2)> 20)
    
    Xs = Xp;
    
    Ys = Yp;
end



i =0;
for t = 0:pi/160:2*pi-(pi/160)
    
    i = i+1;
    xp(i) = round(rp*cos(t)+Xp);         %% row in my
    if(xp(i) <1)
        xp(i) = 1;
    end
    if (xp(i) > 240)
        xp(i) = 240;
    end

    yp(i) = round(rp*sin(t)+Yp);         %% column

    if(yp(i) <1)
        yp(i) = 1;
    end
    if (yp(i) > 320)
        yp(i) = 320;
    end


end

%%%%%%%%%%%%%%%%%%%%%%% for outer circle
i=0;
for t = 0:pi/160:2*pi-(pi/160)
    
    i = i+1;

            %% column         %% row in my prog
    xs(i) = round(rs*cos(t)+Xs);
    if(xs(i) <1)
        xs(i) = 1;
    end
    if (xs(i) > 240)
        xs(i) = 240;
    end

    ys(i) = round(rs*sin(t)+Ys);          %% column

    if(ys(i) <1)
        ys(i) = 1;
    end
    if (ys(i) > 320)
        ys(i) = 320;
    end




end



%plot(x,y,'*');


%%%%%%%%%%%%%%%%%%%%
im2 = im;



for i =1:length(xp);
    
   
im2(xp(i),yp(i))=255;             %%% dislaying circle

im2(xs(i),ys(i))=255;
end
%figure, imshow(im2)


end