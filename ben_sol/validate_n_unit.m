function [erreur_unit] = validate_n_unit(M,train,i,n)

% Validation pour une lettre
% On vérifie que l'une des n lettres les plus proches de M(i) dans train
% soit la bonne

matching=zeros(26,2);
matching(:,1) = 0:25;
corrected_row = compensate(M(i,:))
for l=1:26
    for j=2:129
        matching(l,2) = matching(l,2) + corrected_row(j)*train(l,j);
    end
end

%matching
sorted = sortrows(matching,-2);
%sorted

erreur_unit = 1;
for k=1:n
    if sorted(k,1) == M(i,1)
        erreur_unit = 0;
        break;
    end
end

