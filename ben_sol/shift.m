function shifted = shift(letter)

if norm(letter)==0
    shifted = letter;
    return;
end

vert_shift = 0;
for v=2:129
    if letter(v)==1
        vert_shift = round((v-6)/8);
        break
    end
end

hori_shift = 8;
for h=2:129
    if letter(h)==1 && mod(h-2,8) < hori_shift
        hori_shift = mod(h-2,8);
    end
end

shifted = zeros(1,129);
shift = 8*vert_shift+hori_shift
shifted(1) = letter(1);
shifted(2:(129-shift)) = letter((2+shift):129);