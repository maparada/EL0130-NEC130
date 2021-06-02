function rgbStruct = invTimePred(frameStruct)
    rgbStruct = struct('y',[],'cb',[],'cr',[]);
    auxIndex = 1;
    for i = 1 : 1 : length(frameStruct)
        if auxIndex == 1 || rem(auxIndex-1, 10) == 0
            rgbStruct(i).y = frameStruct(i).y;
            rgbStruct(i).cb = frameStruct(i).cb;
            rgbStruct(i).cr = frameStruct(i).cr;
            auxIndex = auxIndex + 1;
        else
            rgbStruct(i).y = frameStruct(i).y + rgbStruct(i - 1).y;
            rgbStruct(i).cb = frameStruct(i).cb + rgbStruct(i - 1).cb;
            rgbStruct(i).cr = frameStruct(i).cr + rgbStruct(i - 1).cr;
            auxIndex = auxIndex + 1;
        end
    end
end