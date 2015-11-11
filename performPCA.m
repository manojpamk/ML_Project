% Performs PCA to reduce the images from N (typically 100) dimension to M dimension

% Execution path : ~/Acads/Fall2015/EE660/ProjectStuff

clc;
clear all;
close all;

load matlabData/rawData.mat;

myclasses = {'dogs','houses','aeroplane','ship','car','motorcycle','bus','beach','mountain','beach'};

for classIndex = 1:length(myclasses)
   eval(sprintf('superVector = [superVector; [class_%s classIndex]];',cell2mat(myclasses(classIndex))));    
end



