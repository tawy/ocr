function [output] = training(mat, size)

%mat : matrix containing the file train.txt
%size: size of the training set(without the validation set): size < 42152

%output : contains 26 arrays of 128 probabilities that each pixel is drawn
% on the current letter

output = zeros(26,129);
factor = zeros(26);

for l=1:size
    letter = mat(l,1)+1;
    factor(letter) = factor(letter) + 1;
    for i=2:129
        output(letter, i) = output(letter,i) + mat(l,i);
    end
end

for letter=1:26
    if factor(letter) ~= 0
        for i=2:129
            output(letter,i) = output(letter,i) / factor(letter);
        end
    end
end