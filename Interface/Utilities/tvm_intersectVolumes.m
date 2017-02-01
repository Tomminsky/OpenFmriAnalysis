function tvm_intersectVolumes(configuration)
% TVM_INTERSECTVOLUMES
%   TVM_INTERSECTVOLUMES(configuration)
%   @todo Add description
%   
%
%   Copyright (C) Tim van Mourik, 2014, DCCN
%
% Input:
%   i_SubjectDirectory
%   i_InputVolumes
%   i_IntersectionVolumes
% Output:
%   o_OutputVolumes
%

%% Parse configuration
subjectDirectory =      tvm_getOption(configuration, 'i_SubjectDirectory', pwd());
    % default: current working directory
volumeFiles =          	fullfile(subjectDirectory, tvm_getOption(configuration, 'i_InputVolumes'));
    %no default
intersectionFiles =    	fullfile(subjectDirectory, tvm_getOption(configuration, 'i_IntersectionVolumes'));
    %no default
outputFiles =           fullfile(subjectDirectory, tvm_getOption(configuration, 'o_OutputVolumes'));
    %no default
    
%%
%Load the volume data

for i = 1:length(volumeFiles)
    inputVolume = spm_vol(volumeFiles{i});
    inputVolume.volume = spm_read_vols(inputVolume);
    for j = 1:length(intersectionFiles);
        intersectVolume = spm_vol(intersectionFiles{j});
        intersectVolume.volume = spm_read_vols(intersectVolume);
        inputVolume.volume = inputVolume.volume & intersectVolume.volume;
    end
    inputVolume.fname = outputFiles{i};
    spm_write_vol(inputVolume, inputVolume.volume);
end

output = memtoc;

end %end function