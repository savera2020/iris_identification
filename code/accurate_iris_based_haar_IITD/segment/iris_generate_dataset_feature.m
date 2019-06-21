clc
clear all
close all


folders  = '/home/lord/IRIS_recognition/data_sets/IITD_database/IITD Database/';

out_folder = '/home/lord/IRIS_recognition/Output_segmentation/IIITD_accurate_iris/';
temp = 1;
haar_features = [];
for count =  1:224
    count
    input_image = strcat(folders , num2str(count,'%03.f'),'/') ;
    filenames=dir(fullfile(input_image,'*.bmp'));
    
    out_image = strcat(out_folder , num2str(count,'%03.f'),'_') ;
    %for n = 1:numel(filenames)
    for n = 1:5
    fullname=fullfile(input_image,filenames(n).name);
    
    fullname_out = strcat(out_image,filenames(n).name);
    img1 = imread(fullname);
    [N1,dummy] = accurate_iris_seg_iitd(img1);
    imwrite(dummy,fullname_out,'bmp')
    
    %[N1,dummy] = gravity_based_method(img1);
    [f1]  = iris_haar_features(N1);
    
    haar_features = [haar_features;f1];
    label(temp) = count;
    temp = temp+1;
    end
end
label = label';
save ('haar_features','haar_features','label')