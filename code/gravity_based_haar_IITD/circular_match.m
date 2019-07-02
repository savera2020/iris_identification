function score =  circular_match(N1_1d,N2_1d)
                score_list = [];
                %convert f1 and f2 to 2d for circular shifting
                
                N1 = reshape(N1_1d,[64,320])';
                N2 = reshape(N2_1d,[64,320])';
                
                f1 = iris_haar_features(N1);
                f2 = iris_haar_features(N2);
                match =  xor(f1,f2);
                
                score_list = sum(match);
                for shift = 1:10
                   Nr =  circshift(N2,shift,2) ;   % right shift 
                   Nl =  circshift(N2,-shift,2);    % left shift
                   %% apply haar feature 
                   fr = iris_haar_features(Nr);
                   fl = iris_haar_features(Nl);
                   
                   matching_r = xor(f1,fr);

                   score_r = sum(matching_r);
                   
                   matching_l = xor(f1,fl);

                   score_l = sum(matching_l);
                   
                   score_list = [score_list;score_r;score_l];
                end
                
                score = min(score_list);
                %keyboard()
end