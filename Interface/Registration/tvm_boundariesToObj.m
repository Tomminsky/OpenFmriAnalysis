function tvm_boundariesToObj(configuration)
% TVM_BOUNDARIESTOOBJ 
%   TVM_BOUNDARIESTOOBJ(configuration)
%   
%
%   Copyright (C) Tim van Mourik, 2014, DCCN
%
%   configuration.SubjectDirectory
%   configuration.Boundaries
%   configuration.SurfaceWhite
%   configuration.SurfacePial
%   configuration.ObjWhite
%   configuration.ObjPial

%% Parse configuration
subjectDirectory =      tvm_getOption(configuration, 'i_SubjectDirectory', pwd());
    %no default
boundariesFile =        fullfile(subjectDirectory, tvm_getOption(configuration, 'i_Boundaries'));
    %no default
objWhite =              fullfile(subjectDirectory, tvm_getOption(configuration, 'o_ObjWhite'));
    %no default
objPial =               fullfile(subjectDirectory, tvm_getOption(configuration, 'o_ObjPial'));
    %no default

definitions = tvm_definitions();
%%
load(boundariesFile, definitions.WhiteMatterSurface, definitions.PialSurface, definitions.FaceData);
wSurface = eval(definitions.WhiteMatterSurface);
pSurface = eval(definitions.PialSurface);
faceData = eval(definitions.FaceData);

for hemisphere = 1:2

    if hemisphere == 1
        % 1 = right
        outputFileWhite = strrep(objWhite, '?', 'r');
        outputFilePial = strrep(objPial, '?', 'r');
    elseif hemisphere == 2
        % 2 = left
        outputFileWhite = strrep(objWhite, '?', 'l');
        outputFilePial = strrep(objPial, '?', 'l');
    end

%   vertex - 1?
    tvm_exportObjFile(wSurface{hemisphere}, faceData{hemisphere}, outputFileWhite); 
    tvm_exportObjFile(pSurface{hemisphere}, faceData{hemisphere}, outputFilePial);  
    
end  

end %end function









