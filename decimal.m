function final = decimal(bin)

final = bin2dec(bin)';
k=1;
while k<=length(final)
    if final(k) == 256
       final(k:64) = 0;
    break
    end
    if final(k)>128
        final(k) = final(k)-256;
    end
    k = k+1;
end

end