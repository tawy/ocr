function [erreur] = validate(M, train, size)

% Validation pour une lettre :
% on multiplie terme � terme les valeurs de la lettre avec les probabilit�s
% de r�f�rence (train(1) ... train(26) et on prend la lettre qui maximise

erreur=0;

for i=(size+1):42152

    err = validate_unit(M,train,i);
    erreur = erreur + err;
    
end

erreur = erreur/(42152-size);