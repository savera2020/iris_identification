function [D]  = iris_haar_features(N)

[a1,h1,v1,d1] = haart2(N,1);

[a2,h2,v2,d2] = haart2(a1,1);

[a3,h3,v3,d3] = haart2(a2,1);

[a4,h4,v4,d4] = haart2(a3,1);

C = [h4(:)',v4(:)',d4(:)',h3(:)',v3(:)',d3(:)',h2(:)',v2(:)',d2(:)',h1(:)',v1(:)',d1(:)'];


D = zeros(1,length(C));


for i = 1:length(C)
    
  D(i) = sgn(C(i));      % applying sign funtion if C > 0 =1 and C <0 =0
end



end