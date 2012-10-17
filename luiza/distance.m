%function that turns grey image into monohrome%
function ret = distance(a,b,in,m)
    dist = in;
    for x = 1: 16
        for y = 1: 8
            if(a(1 + y + (x - 1)*8) == 1)
                tmp = 1000;
                for xx = 1: 16
                    for yy = 1: 8
                       if(b(1 + yy + (xx - 1)*8) == 1)
                           r = abs(x-xx) + abs(y - yy);
                           if(r < tmp)      
                                tmp = r;
                           end
                       end
                    end
                end
               dist = dist + tmp^2;
               if dist > m
                   ret = dist;
                   return;
               end
            end       
        end
    end
   ret = dist;
end