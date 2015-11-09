% EE 660 Project
% Manoj Kumar P.A  (manojpamk@gmail.com)

% This will read the images one by one, and rescale them to 100x100 pixels.
% If original image is smaller, then it will be removed from the dataset

clc;
clear all;
close all;

myclasses = {'dogs','houses','aeroplane','ship','car','motorcycle','bus','beach','mountain','beach'};
numDeleted = zeros(1,length(myclasses));
numResized = zeros(1,length(myclasses));
numTotal = zeros(1,length(myclasses));

for classIndex = 1:length(myclasses)

    fileNames = dir(cell2mat(myclasses(classIndex)));
    fileNames(1:2) = [];    
    cd(cell2mat(myclasses(classIndex)));

    for fileIndex = 1:length(fileNames)
        myImage = imread(fileNames(fileIndex).name);
        L = size(myImage,1); B = size(myImage,2);

        if (L< 100 || B < 100)
            delete(fileNames(fileIndex).name);
            numDeleted(classIndex) = numDeleted(classIndex) + 1;
            fprintf('Deletion : Image %s...\n',fileNames(fileIndex).name);
            continue;
        end

        myImage  = imresize(myImage,[100 100]);
        imwrite(myImage,fileNames(fileIndex).name);
        numResized(classIndex) = numResized(classIndex) + 1;
        fprintf('Resize : Image %s...\n',fileNames(fileIndex).name);     
    end

    numTotal(classIndex) = numResized(classIndex) + numDeleted(classIndex);    
    cd ..

end

for classIndex = 1:length(myclasses)
    fprintf('\nClass %s: %d/%d images resized, %d/%d images deleted\n',cell2mat(myclasses(classIndex)),numResized(classIndex),numTotal(classIndex),numDeleted(classIndex),numTotal(classIndex));
end
