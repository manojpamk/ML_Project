% EE 660 Project
% Manoj Kumar P.A  (manojpamk@gmail.com)

% Performs L1-regularisation on the weights to remove non-contributing
% featres

% Execution path : ~/Acads/Fall2015/EE660/ProjectStuff

% Requires smblr.m to be added to path (or atleast in current directory

clc;
clear all;
close all;
myclasses = {'flowers','dogs','houses','aeroplane','ship','car','motorcycle','bus','beach','mountain'};

load('matlabData/AfterDimReduction/afterDimReduction_rgb_normal_91_511.mat');

weights = sbmlr(superVector,bag_of_words_labels);   % Takes ~30min for grayscale

% plot(sum(abs(weights')));       % Just to get an idea

%Choose the top 50 features. 50 - empirically fixed.

[sortedValues,sortIndex] = sort(sum(abs(weights')),'descend');  
top50indices = sort(sortIndex(1:50));  % To the top 50 indices in ascending
superVector = superVector(:,top50indices);

save('matlabData/AfterL1/afterL1_rgb_normal_91_511.mat','superVector','labels','bag_of_words_labels','myclasses','-v7.3');
superVector = [superVector labels];
arffwrite('matlabData/ArffFiles/afterL1_rgb_normal_91_511',superVector);
