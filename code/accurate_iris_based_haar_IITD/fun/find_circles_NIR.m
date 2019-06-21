function [ center, radius, center_p, radius_p ] = find_circles_NIR( im, edgemap, radiusRange, i_radiusRatio, i_radiusRange, searchRange )

% FIND_CIRCLES_NIR Summary of this function goes here
%   Detailed explanation goes here

[cx, cy] = find_center_v3(edgemap, radiusRange);
[center_p, radius_p] = find_radius(edgemap, [cx, cy], radiusRange, searchRange);

%edgemap = edge(im, 'canny', 0.05);
im = im2double(im);
%figure, imshow(im)
%edgemap = edge(im, 'sobel', [], 'vertical');
edgemap = edge(im, 'canny', [], 'vertical');  % changes did by me
%figure, imshow(edgemap)
min_rp = max(radius_p*i_radiusRatio(1), i_radiusRange(1));
max_rp = min(radius_p*i_radiusRatio(2), i_radiusRange(2));
[center, radius] = find_radius(edgemap, center_p, [min_rp, max_rp], round(searchRange/2), 'average');

end

