
function N_I = normalization(im,xp,xs,yp,ys)




for k =1:length(xp)
    
    for R = 1:64
        
    X = round(((64-R)*xp(k) + R*xs(k))/64);
    
    Y = round(((64-R)*yp(k) + R*ys(k))/64);
    
    if(X>240)
        X = 240;
    end
    
    if (Y>320)
        Y = 320;
    end
     
     N_I(R,k) =im(X,Y); 
     
     
     
     
   
    end
end
    
   %figure, imshow(N_I)
   
end
