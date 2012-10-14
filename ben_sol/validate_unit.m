function [erreur_unit] = validate_unit(M,train,i)

% Validation pour une lettre
% On vérifie que la lettre la plus proche de M(i) dans train est la bonne

matching=zeros(26,1);
max=0;
temp=0;
for l=1:26
    for j=2:129
        matching(l) = matching(l) + (M(i,j)-0.2)*train(l,j);
    end
    if matching(l) > max
        temp=l-1;
        max=matching(l);
    end
end

% matching

if temp == M(i,1)
    erreur_unit = 0;
else
    erreur_unit = 1;
end