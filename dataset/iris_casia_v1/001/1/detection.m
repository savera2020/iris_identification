

val = [];

roe = [];

colum = [];


for r = 90:105               %% for a range of r values
    
    [C l m] = HTCircle(BW,r);     %% calculate max C and thir indices
    
    val = [val; C];               %% save all the max value for all the in val
    
    roe = [roe; l];               %% save their indices
    
    colum = [colum; m];
    
end

[dummy,temp1] = max(val);         %% find the max value for detecting the circle find indices

row = roe(temp1);                 %% x0 for circle

column = colum(temp1);            %% y0 of circle

radi = temp1+90;                  %% radius

keyboard();