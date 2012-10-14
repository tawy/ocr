function [erreur] = validate_n(M, train, size, n)

erreur=0;

for i=(size+1):42152

    err = validate_n_unit(M,train,i,n);
    erreur = erreur + err;
    
end

erreur = erreur/(42152-size);