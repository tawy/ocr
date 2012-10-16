function let = classify_fast(t,p,s)
    dist = 10050000;
    minbst = -1;
    [m,n] = size(t);
    %calculate prepaired distance from test sample%
    b = prepare(s);
    for k = 1:m
        %we divide distance by the number of black pixels in 2 samples so
        %that probability won't depend from%
        %the number of pixels in the sample%
        
        % sum(t(k,:).*b) is a clever distance calculation using prepared matrix b%
        tmp =  sqrt(sum(t(k,:).*b)+ sum(p(k,:).*s))/( length(find(t(k,:) == 1)) + length(find(s == 1)));
        if(tmp < dist)
                dist = tmp;
                minbst = t(k,1);
        end
    end
    %return the letter code%
    let = minbst;
end