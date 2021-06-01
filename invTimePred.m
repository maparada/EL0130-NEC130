function rgbStruct = invTimePred(frameStruct)
    rgbStruct = struct('imagem',[]);
    auxIndex = 1;
    for i = 1 : 1 : length(frameStruct)
        if auxIndex == 1 || rem(auxIndex-1, 10) == 0
            rgbStruct(i).imagem = frameStruct(i).imagem;
            auxIndex = auxIndex + 1;
        else
            rgbStruct(i).imagem = frameStruct(i).imagem + rgbStruct(i - 1).imagem;
            auxIndex = auxIndex + 1;
        end
    end
end