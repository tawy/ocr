function output = shift_mat(input)

output=zeros(size(input));
for i=1:size(input,1)
    output(i,:) = shift(input(i,:));
end

