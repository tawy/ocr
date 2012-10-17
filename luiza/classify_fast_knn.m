function let = classify_fast_knn(t,p,s,k)
    %%find the place for new neighbour if its distance smaller than 1
    %%neighbour
    
    dist = zeros(1,k);
    letterarr = zeros(1,k);
    for ii = 1: k
        dist(ii) = 100500;
    end
    [m,n] = size(t);
    %calculate prepaired distance from test sample%
    b = prepare(s);
    for k = 1:m
        %we divide distance by the number of black pixels in 2 samples so
        %that probability won't depend from%
        %the number of pixels in the sample%
        
        % sum(t(k,:).*b) is a clever distance calculation using prepared matrix b%
        tmp =  sqrt(sum(t(k,:).*b)+ sum(p(k,:).*s))/( length(find(t(k,:) == 1)) + length(find(s == 1)));
        max_dist = max(dist);
        if(tmp < max_dist)
                max_dist_ind = find(dist== max_dist,1,'first');
                dist(max_dist_ind) = tmp;
                letterarr(max_dist_ind) = t(k,1);
        end
    end
    %return the letter code%
    let = mode(letterarr);
end