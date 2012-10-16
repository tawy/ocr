function classify_all_fast()
    %test = load('test1.txt');
    %train = load('train1.txt');
    test_valid = load('train.txt');
    num_train = 15000;
    [a,b] = size(test_valid);
    
    % take randomly num_train samples from train set the rest goes to test set%
    index = randperm(a);
    train = test_valid(index(1:num_train),:);
    test = test_valid(index(num_train+1:end),:);

    [m1,n1] = size(train);
    precalc = zeros(m1,n1);
    
    %statistics about letters%
    letter_right = zeros(1,26);
    letter_num = zeros(1,26);
    %percent of recongnized characters%
    letters = zeros(1,26);
    
    %calculate the distance for each train sample letters (the distance from pixel to closest black pixel)%
    for k = 1:m1
       precalc(k,:) = prepare(train(k, :));
    end
    
    [m,n] = size(test);
    correct = 0;
    for k = 1:m
        %disp (num2str(k));
        c = classify_fast(train,precalc,test(k,:));
        if c == test(k,1)
            correct = correct + 1;
            letter_right(test(k,1)+1) = letter_right(test(k,1)+1) + 1;
        end
        letter_num(test(k,1)+1) = letter_num(test(k,1)+1) + 1;
        %disp ([num2str(c) num2str(test(k,1))]);
        if mod(k,100) == 0
            disp (num2str(correct/k));
        end
    end
    % our result %
    (correct * 100.0)/m
    letters = letter_right./letter_num
end