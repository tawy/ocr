function [erreur_unit, nb_comparison] = validate_n_coeff_unit(M,train,i,n, coeff)

% Validation for one character
% Mix of the previous methods (validate_coeff and validate_n)


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
nb_comparison = n;

for k=1:n
    if sorted(k,2) < stop_condition
        nb_comparison=k-1;
        break;
    end
    if sorted(k,1) == M(i,1)
        erreur_unit = 0;
    end
end

