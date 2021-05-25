function bin = binario(T)

%K e aux são apenas var auxiliares
k = 1;
aux = 1;
 %Loop vai somar elementos do vetor e testar EoB
while k<=length(T)
     if (T(k)==0)
        B(k) = sum(abs(T(k:length(T))));
        if sum(B(k)) == 0
          T(k) = 256;
          T(k+1:end)=[];
        break
        end
     end
     if (T(k)<0)
       T(k)=256+T(k);
     end   
   k = k+1;  
end
bin = dec2bin(T);
bin = reshape(bin',1,[]);

end

     
     
 