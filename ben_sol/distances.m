function [] = distances(distance, letter, i, prev)


if i<2 || i>129; return;
else if distance.tableau(i) ~= 0.5; return; 
    else
        if letter(i) == 0
            if (i>2 && letter(i-1) == 1) || ...
                (i<129 && letter(i+1) == 1) || ...
                (i>9 && letter(i-8) == 1) || ...
                (i<122 && letter(i+8) == 1) 
                distance.tableau(i) = -1;
            else
                maxi = -1000;
                if i+1 ~= prev && i+1 <= 129; 
                    distances(distance,letter,i+1,i); 
                    maxi = max(maxi,distance.tableau(i+1)-1); end
                if i-1 ~= prev && i-1 >= 2; 
                    distances(distance,letter,i-1,i); 
                    maxi = max(maxi,distance.tableau(i-1)-1); end
                if i+8 ~= prev && i+8 <= 129;  
                    distances(distance,letter,i+8,i); 
                    maxi = max(maxi,distance.tableau(i+8)-1); end
                if i-8 ~= prev && i-8 >= 2; 
                    distances(distance,letter,i-8,i); 
                    maxi = max(maxi,distance.tableau(i-8)-1); end
                distance.tableau(i) = maxi;
            end
        else
            distance.tableau(i) = 0;
        end        
    end
end

