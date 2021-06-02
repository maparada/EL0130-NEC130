function [bin,tambin] = binarioaux (S_v)

bin(length(S_v))=struct('quadro','');
for i = 1:length(S_v)
    for k=1:64:length(S_v(i).vycbcr)
        bin(i).quadro = [bin(i).quadro binario(S_v(i).vycbcr(k:k+63))]; 
    end
end
tambin = 0;
for i = 1:length(S_v)
bin(i).quadro = reshape(bin(i).quadro,9,[])';
tambin =  tambin + size(bin(i).quadro,1);
end

end