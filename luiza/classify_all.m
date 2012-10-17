function classify_all()
    test = load('test1.txt');
    train = load('train1.txt');
    [m,n] = size(test);
    correct = 0;
    for k = 1:m
        disp (num2str(k));
        c = classify(train,test(k,:));
        if c == test(k,1)
            correct = correct + 1;
        end
        disp ([num2str(c) num2str(test(k,1))]);
    end
    (correct * 100.0)/m
end