function [array] = print_train(m)

array='';

for i=1:16
   %i=4;
   str='';
   for j=1:8
       if m((i-1)*8+j+1)>=0.3
           str=[str,'  '];
       else
           str=[str,'88'];
       end
   end
   array=char(array,str);
end