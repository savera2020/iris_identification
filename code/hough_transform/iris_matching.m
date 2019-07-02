
function [score,im2] = iris_matching(img1,img2)

[N1,dummy] = gravity_based_method(img1);
[N2,im2] = gravity_based_method(img2);



[f1]  = iris_haar_features(N1);
[f2]  = iris_haar_features(N2);

matching = xor(f1,f2);

score = sum(matching)/length(matching);

end