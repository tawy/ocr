%M=dlmread('train.txt');
M=shift_mat(dlmread('train.txt'));
M=M(randperm(size(M,1)),:);
ind=0;