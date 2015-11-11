% Performs PCA to reduce the images from N (typically 100) dimension to M dimension

% Execution path : ~/Acads/Fall2015/EE660/ProjectStuff

% NAIVE Method for now : Convert DxDx3 image into 1x3D^2 row vector
clc;
% clear all;
close all;
fprintf('Loading data...');
load matlabData/rawData.mat;
fprintf('Done\n');

myclasses = {'dogs','houses','aeroplane','ship','car','motorcycle','bus','beach','mountain','beach'};

superVector = [];
for classIndex = 1:length(myclasses)   
   % First, vectorize
   
   fprintf('Vectorising for class %s..\n',cell2mat(myclasses(classIndex)));
   eval(sprintf('classVar = class_%s;',cell2mat(myclasses(classIndex))));
   
   temp = zeros(size(classVar,1),size(classVar,2)*size(classVar,3)*3);
   for imageIndex = 1:size(temp,1)
       myImage = squeeze(classVar(imageIndex,:,:,:));
       temp(imageIndex,:) = reshape(reshape(permute(myImage,[1 3 2]),[size(classVar,2)*3 size(classVar,2)])',[1 size(temp,2)]);
   end
   
   superVector = [superVector; [temp classIndex*ones(size(temp,1),1)]];
end

