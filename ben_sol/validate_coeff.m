function [erreur] = validate_coeff(M, train, size, coeff)

erreur=0;
nb_comparison=0;

for i=(size+1):42152

    [err, nb_comp] = validate_coeff_unit(M,train,i,coeff);
    erreur = erreur + err;
    nb_comparison = nb_comparison + nb_comp;
    
end

nb_comparison = nb_comparison / (42152-size)
erreur = erreur/(42152-size);