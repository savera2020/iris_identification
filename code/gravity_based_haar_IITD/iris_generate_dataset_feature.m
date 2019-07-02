clc
clear all
close all


folders  = '/home/lord/IRIS_recognition/data_sets/IITD_database/IITD Database/';

%out_folder = '/home/lord/IRIS_recognition/Output_segmentation/IIITD/'
temp = 1;
segmented_iris = [];
for count =  1 :224
    count
    input_image = strcat(folders , num2str(count,'%03.f'),'/') ;
    filenames=dir(fullfile(input_image,'*.bmp'));
    %for n = 1:numel(filenames)
    for n = 1:5
    fullname=fullfile(input_image,filenames(n).name);
    img1 = imread(fullname);
    
    [N1,dummy] = gravity_based_method(img1);
    %[f1]  = iris_haar_features(N1);
    
    %haar_features = [haar_features;f1];
    N = N1';
    segmented_iris = [segmented_iris;N(:)'];
    label(temp) = count;
    temp = temp+1;
    end
end
label = label';
save ('segmented_iris','segmented_iris','label')