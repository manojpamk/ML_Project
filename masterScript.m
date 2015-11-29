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
setPerformPCA


%==========================================================================



% Download images from the URLs 
if (setDownloadImages == 1)
    run image_urls/readUrlSaveImage;
else
    fprintf('Skipping download. Images must be already be present in image_urls/ ...\n');
end

% Rescale the images to required dimension - This takes 5 min
if (setRescale == 1)
    run image_urls/rescaleDxD(rescaleDim);
else
    fprintf('Skipping rescale. They must be in a uniform dimension in image_urls/ ...\n');
end

% Read images from the jpg and save into .mat files.
% 1. Any pre-processing (Gaussian smoothening/Grayscale conversion happens here.
% 2. Further, the data is sampled so that number of samples in each class is same; and equals the minimum number of samples from all classes
% Separate .mat files are stored for each different pre-processing to save time.

% This takes 12-17 min
if (setSaveImages == 1)
    run image_urls/saveImageData;
else
    fprintf('Skipping .mat creation. They must already be present in matlabData/ ... \n');
end

% Perform dimensionality reduction using PCA. This is real-tricky. To save your computer, pay attention to different parts of the PCA block. Some will need more MEMORY than you have.
% As above, separate .mat files are stored for different pre-processing steps to save time.
if (setPerformPCA == 1)
    run performPCA;
else
    fprintf('Skipping PCA analysis. This means it is already done and afterDimReduction.mat(.arff) are present in matlabData/... \n');
end

    
