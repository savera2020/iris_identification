

function [C l m] = HTCircle(inputimage,r)
%image size
[rows,columns]=size(inputimage);                %% 
%accumulator
acc=zeros(rows,columns);            %% creating accumulator size
%image
for x=1:columns
for y=1:rows
if(inputimage(y,x)==1)               %% check only the edges value which are 1 or white in image
for ang=0:360                         
t=(ang*pi)/180;                       %% angel for whole circle check all angel
x0=round(x-r*cos(t));                 %% check of center for each value of x
y0=round(y-r*sin(t));                 %% check of center for each value of y

if(x0<columns & x0>0 & y0<rows & y0>0)  %% 
acc(y0,x0)=acc(y0,x0)+1;               %% increase the voating for all values of possible x0 and y0
end
end
end
end
end

C = max(max(acc));                     %% find the max value of acc for particular r value

flag = 0;                            %% define flag 

for x=1:columns
for y=1:rows
    
    if (flag == 0)                   %% go only once inside the loop
    if (acc(y,x)==C)                 %% find the index of max value that are center of circle
        
        l = y;                       %% save it as l and m
        
        m = x;
        
        flag = 1;
    end
    end
end
end

end

        