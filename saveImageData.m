% EE 660 Project
% Manoj Kumar P.A  (manojpamk@gmail.com)

% Execution path : ~/Acads/Fall2015/EE660/ProjectStuff

% Reads the images and saves the data. This is from where our data
% processing must begin.
% Data is stored in matlabData/

clc;
clear all;
close all;

myclasses = {'dogs','houses','aeroplane','ship','car','motorcycle','bus','beach','mountain','beach'};
num_egs = zeros(1,length(myclasses));

for classIndex = 1:length(myclasses)
    
    cd(sprintf('image_urls/%s',cell2mat(myclasses(classIndex))));
    fileName = dir(pwd); fileName = fileName(3:end);    
    eval(sprintf('class_%s = [];',cell2mat(myclasses(classIndex))));
    
    for fileIndex = 1:length(fileName)
        myImage = imread(fileName(fileIndex).name);
        num_egs(classIndex) = num_egs(classIndex) + 1;
        eval(sprintf('class_%s(%d,:,:,:) = myImage;',cell2mat(myclasses(classIndex)),fileIndex));
        fprintf('Added image <%s> %d/%d..\n',cell2mat(myclasses(classIndex)),fileIndex,length(fileName));
    end
    
    cd ../..
end

% Choose only min(num_egs) number of examples from each class so as to
% maintain uniformity

N = min(num_egs);
for classIndex = 1:length(myclasses)
    eval(sprintf('class_%s = datasample(class_%s,N,''Replace'',false);',cell2mat(myclasses(classIndex)),cell2mat(myclasses(classIndex))));
end

clear classIndex myImage fileIndex fileName N num_egs;
cd matlabData/
fprintf('Saving into rawData.mat...\n');
save('rawData.mat');
fprintf('Done.\n');
cd ..