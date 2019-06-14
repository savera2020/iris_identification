

clc
clear all
close all



img1  = imread('/home/lord/IRIS_recognition/data_sets/IITD_database/IITD Database/064/01.bmp');


%input_image = '/home/lord/IRIS_recognition/codes/program_iris_final/images/';

folders  = '/home/lord/IRIS_recognition/data_sets/IITD_database/IITD Database/'

out_folder = '/home/lord/IRIS_recognition/Output_segmentation/IIITD/'
for count =  1 :224
    
    input_image = strcat(folders , num2str(count,'%03.f'),'/') ;
    filenames=dir(fullfile(input_image,'*.bmp'));
    for n = 1:numel(filenames)
    fullname=fullfile(input_image,filenames(n).name);
    img2 = imread(fullname);

    [score,im2] = iris_matching(img1,img2);
    score_result(n,count) = score;
    %imwrite(im2,strcat(strcat(out_folder,num2str(count,'%03.f'),'_'),filenames(n).name),'bmp')
    
    end
count
end


csvwrite('iris_result_064_0_1.csv',score_result)