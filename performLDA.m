% EE 660 Project
% Manoj Kumar P.A  (manojpamk@gmail.com)

% Performs a multi-class LDA on top of PCA.
% Reads the superVectors from matlabData/AfterDimReduction folder, performs
% a multi-class LDA on them to transform into 9-dimensional vectors. Same
% analaysis as for the L1-reduced vectors will be performed in this case

% Execution path : ~/Acads/Fall2015/EE660/ProjectStuff
% Requires the LDA.m script under Implementations/LDA

clc;
clear all;
close all;

load('matlabData/AfterDimReduction/afterDimReduction_rgb_normal_91_511.mat');

cd Implementations/LDA;
mLDA = LDA(superVector, num2cell(labels));
mLDA.Compute();

transformed = mLDA.Transform(superVector, 9);
cd ../..;
arffwrite('matlabData/AfterLDA/afterLDA_rgb_normal_91_511',[transformed labels]);