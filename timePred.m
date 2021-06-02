function frameStruct = timePred(rgbStruct)
    frameStruct = struct('y',[],'cb',[],'cr',[]);
    auxIndex = 1;
    for i = 1 : 1 : length(rgbStruct)
        if auxIndex == 1 || rem(auxIndex-1, 10) == 0
            frameStruct(i).y = rgbStruct(i).y;
            frameStruct(i).cb = rgbStruct(i).cb;
            frameStruct(i).cr = rgbStruct(i).cr;
            auxIndex = auxIndex + 1;
        else
            frameStruct(i).y = rgbStruct(i).y - rgbStruct(i - 1).y;
            frameStruct(i).cb = rgbStruct(i).cb - rgbStruct(i - 1).cb;
            frameStruct(i).cr = rgbStruct(i).cr - rgbStruct(i - 1).cr;
            auxIndex = auxIndex + 1;
        end
    end
end