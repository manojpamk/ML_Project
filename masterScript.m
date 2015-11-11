% The masterScript

% Execution path : ~/Acads/Fall2015/EE660/ProjectStuff

clc;
clear all;
close all;

%==========================================================================
% Flags for execution blocks
setDownloadImages   = 0;
setRescale          = 0; rescaleDim = 100;
setSaveImages       = 0;


%==========================================================================



% Download images from the URLs 
if (setDownloadImages == 1)
    run image_urls/readUrlSaveImage;
else
    fprintf('Skipping download. Images must be already be present in image_urls/ ...\n');
end

% Rescale the images to required dimension
if (setRescale == 1)
    run image_urls/rescaleDxD(rescaleDim);
else
    fprintf('Skipping rescale. They must be in a uniform dimension in image_urls/ ...\n');
end

% Read images from the jpg and save into .mat files
if (setSaveImages == 1)
    run image_urls/saveImageData;
else
    fprintf('Skipping .mat creation. They must already be present in matlabData/ ... \n');
end
    