function frameStruct = timePred(rgbStruct)
    frameStruct = struct('imagem',[]);
    auxIndex = 1;
    for i = 1 : 1 : length(rgbStruct)
        if auxIndex == 1 || rem(auxIndex, 10) == 0
            frameStruct(i).imagem = rgbStruct(i).imagem;
            auxIndex = auxIndex + 1;
        else
            frameStruct(i).imagem = rgbStruct(i).imagem - rgbStruct(i - 1).imagem;
            auxIndex = auxIndex + 1;
        end
    end
end