function let = classify(t,s)
    dist = 10050000;
    minbst = -1;
    [m,n] = size(t);
    for k = 1:m
        tmp = distance(t(k,:),s, 0, dist);
        tmp =  distance(s, t(k,:),tmp,dist);
        if(tmp < dist)
                dist = tmp;
                minbst = t(k,1);
        end
    end
    let = minbst;
end