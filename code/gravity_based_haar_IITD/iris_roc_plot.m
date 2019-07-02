

%% module needed segmented iris and label for data set generated  by iris_generate_dataset_features
clear all
clc
load('segmented_iris.mat')


postive_match_scores = [];

positive_labels = [];

for i = 1:5:length(segmented_iris(:,1))                    %% iterating for all persons each have 5 images
    %same person images for the matching
    one_person_data  = segmented_iris(i:i+4,:);   %% selecting freatures for each person  images
    
    one_person_label = label(i:i+4,:);         %% selecting lbels for each person
    for count1 = 1:5                           %% comparing same person features with each other
        N1_1d = one_person_data(count1,:);        % select the one image feature
        l1 = one_person_label(count1,:);        %% select the lable   
        for count2 = 1:5
            N2_1d = one_person_data(count2,:); 
            l2 = one_person_label(count2,:);            
            if(l1==l2)                             %% both labels are same only preform matching
                % matching = xor(f1,f2);
                % score = sum(matching);  
                  score =  circular_match(N1_1d,N2_1d); 
            end
            
            if (score > 0)    % if comapred with same image dont save result
                postive_match_scores = [postive_match_scores;score];                
                positive_labels = [positive_labels;[count1,count2]];
            end 
        end 
    end    
end

save ('postive_match_scores','postive_match_scores','positive_labels')





rng('default');
rng(1);

negative_match_scores = [];

negative_labels = [];

for i = 1:5:length(segmented_iris(:,1))                 %% iterating for all persons each have 5 images
    %same person images for the matching
    one_person_data  = segmented_iris(i:i+4,:);   %% selecting freatures for each person  images
    
    one_person_label = label(i:i+4,:);         %% selecting lbels for each person
    
   % second_person_data  = haar_features(i:i+4,:);   %% selecting freatures for each person  images
    
   % second_person_label = label(i:i+4,:);         %% selecting lbels for each person
    for count1 = 1:5                           %% comparing same person features with each other
        N1_1d = one_person_data(count1,:);        % select the one image feature
        l1 = one_person_label(count1,:);        %% select the lable   
        for count2 = 1:20
            
            indx = randi([1,length(segmented_iris(:,1))]);
            
            N2_1d = segmented_iris(indx,:); 
            l2 = label(indx,:);            
            if(l1~=l2)                             %% both labels are same only preform matching
               % matching = xor(N1_1d,N2_1d);
               % score = sum(matching);
                score =  circular_match(N1_1d,N2_1d);
                negative_match_scores = [negative_match_scores;score];                
                negative_labels = [negative_labels;[l1,l2]];
            end
            
           

        
        end 
    end    
end

save ('negative_match_scores','negative_match_scores','negative_labels')

[far, gar] = roc(postive_match_scores,negative_match_scores);