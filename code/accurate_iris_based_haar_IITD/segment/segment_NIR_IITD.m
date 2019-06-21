
    
function [center, radius, center_p, radius_p]= segment_NIR_IITD(im_src)
    

    extend = [0.7, 1.3];       % faction of radius to be collect to calculate threshold
    p_radiusRange = [20, 60];    % possible range of radius of pupil circle
    i_radiusRatio = [1.5, 3];  % possible ratio of iris circle radius to the pupil circle radius
    i_radiusRange = [80, 130];   % possible range of radius of iris circle
    searchRange = 10;           % search range for center of iris circle
    
    hsiz = 0;                 % parameter for SSR enhancement; size of Gaussian kernel
    gau_size = 5;
    quality_thresh = 0.7;   % .45
    if hsiz ~= 0
        im_en = enhance_image(im_src, hsiz, gau_size, 1);
    else
        im_en = medfilt2(im_src(:,:,1), [3, 3]);
    end
    
   % figure,imshow(im_en)
    [col, row] = size(im_src);
    [im_md, reflection_region] = remove_reflection(im_en, 0.8, row*col*0.01);
   
    % get the structure map using local total variation
    [edgemap, im_smooth] = get_rtv_l1_contour(im_md, 0.2, 0.05, 3, 0.005);
    %[edgemap, im_smooth] = get_rtv_l1_contour(im_md, lambda, theta, sigma, ep);

    %im_smooth = imread([smooth_dir, filename, '.bmp']);
    %edgemap = edge(im_smooth);
    
    % find iris and pupil circles based on the structure map
    [center, radius, center_p, radius_p] = find_circles_NIR(im_md, edgemap, p_radiusRange, i_radiusRatio, i_radiusRange, searchRange);
    % [center, radius, center_p, radius_p] = find_circles_CASIA2(im_md, edgemap, radiusRange);
   
end
%clear all;