%function that calculates minimal distance for each pixel to another black pixel in the image %
% if pixel is black then the smallest dist is zero%
function ret = prepare(b)
    %matrix in row representation%
    matr = zeros(1,129);
    for x = 1: 16
        for y = 1: 8
                tmp = 1000;
                if b(1 + y + (x - 1)*8) == 1
                    matr( 1 + (x - 1)*8 + y ) = 0;
                    continue;
                end
                for xx = 1: 16
                    for yy = 1: 8
                       if(b(1 + yy + (xx - 1)*8) == 1)
                           r = abs(x-xx) + abs(y - yy);
                           if(r*r < tmp)      
                                tmp = r*r;
                           end
                       end
                    end
                end
               %remember the smallest distance from pixel (x,y) to another black pixel in cell (x,y)%
               matr( 1 + (x - 1)*8 + y ) = tmp;
         end
    end
   ret = matr;
end