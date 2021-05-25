function rgbStruct = invTimePred(frameStruct)
    rgbStruct = struct('picture',[])
    auxIndex = 1;
    for i = 1 : 1 : length(frameStruct)
        if auxIndex == 1 || rem(auxIndex, 10) == 0
            rgbStruct(i).picture = frameStruct(i).picture;
            auxIndex = auxIndex + 1;
        else
            rgbStruct(i).picture = frameStruct(i).picture + rgbStruct(i - 1).picture;
            auxIndex = auxIndex + 1;
        end
    end
end