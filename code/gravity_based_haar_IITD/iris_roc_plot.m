

%% module needed features and label for data set generated  by iris_generate_dataset_features
postive_match_scores = [];

positive_labels = [];

for i = 1:5:length(haar_features(:,1))                    %% iterating for all persons each have 5 images
    %same person images for the matching
    one_person_data  = haar_features(i:i+4,:);   %% selecting freatures for each person  images
    
    one_person_label = label(i:i+4,:);         %% selecting lbels for each person
    for count1 = 1:5                           %% comparing same person features with each other
        f1 = one_person_data(count1,:);        % select the one image feature
        l1 = one_person_label(count1,:);        %% select the lable   
        for count2 = 1:5
            f2 = one_person_data(count2,:); 
            l2 = one_person_label(count2,:);            
            if(l1==l2)                             %% both labels are same only preform matching
                matching = xor(f1,f2);
                score = sum(matching);                
            end
            
            if (score > 0)    % if comapred with same image dont save result
                postive_match_scores = [postive_match_scores;score];                
                positive_labels = [positive_labels;[count1,count2]];
            end 
        end 
    end    
end

save ('postive_match_scores','postive_match_scores','positive_labels')







negative_match_scores = [];

negative_labels = [];

for i = 1:5:length(haar_features(:,1))                 %% iterating for all persons each have 5 images
    %same person images for the matching
    one_person_data  = haar_features(i:i+4,:);   %% selecting freatures for each person  images
    
    one_person_label = label(i:i+4,:);         %% selecting lbels for each person
    
   % second_person_data  = haar_features(i:i+4,:);   %% selecting freatures for each person  images
    
   % second_person_label = label(i:i+4,:);         %% selecting lbels for each person
    for count1 = 1:5                           %% comparing same person features with each other
        f1 = one_person_data(count1,:);        % select the one image feature
        l1 = one_person_label(count1,:);        %% select the lable   
        for count2 = 1:20
            
            indx = randi([1,length(haar_features(:,1))]);
            
            f2 = haar_features(indx,:); 
            l2 = label(indx,:);            
            if(l1~=l2)                             %% both labels are same only preform matching
                matching = xor(f1,f2);
                score = sum(matching);  
                negative_match_scores = [negative_match_scores;score];                
                negative_labels = [negative_labels;[l1,l2]];
            end
            
           

        
        end 
    end    
end

save ('negative_match_scores','negative_match_scores','negative_labels')