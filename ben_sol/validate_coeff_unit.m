function [erreur_unit, nb_comparison] = validate_coeff_unit(M,train,i,coeff)

% Validation for one character
% It checks that one of the closest letter is the correct one
% The threshold is coeff * (score of the best letter matching)


matching=zeros(26,2);
matching(:,1) = 0:25;
for l=1:26
    for j=2:129
        matching(l,2) = matching(l,2) + M(i,j)*train(l,j);
    end
end

% it sort the letter descending by matching
sorted = sortrows(matching,-2);

stop_condition = sorted(1,2)*coeff;
erreur_unit = 1;
nb_comparison=26;

for k=1:26
    if sorted(k,2) < stop_condition
        nb_comparison = k-1;
        break;
    end
    if sorted(k,1) == M(i,1)
        erreur_unit = 0;
    end
end

