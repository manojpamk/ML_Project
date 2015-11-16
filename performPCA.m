% Performs PCA to reduce the images from N (typically 100) dimension to M dimension

% Execution path : ~/Acads/Fall2015/EE660/ProjectStuff

% NAIVE Method for now : Convert DxDx3 image into 1x3D^2 row vector


skipSuperVectorCreation = 1;
if (skipSuperVectorCreation ~= 1)
    clc;
    % clear all;
    close all;
    fprintf('Loading data...');
    load matlabData/rawData.mat;
    fprintf('Done\n');

    myclasses = {'dogs','houses','aeroplane','ship','car','motorcycle','bus','beach','mountain','beach'};

    %==========================================================================
    % First, vectorize and normalize
    superVector = [];

    for classIndex = 1:length(myclasses)   


       fprintf('Vectorising for class %s..\n',cell2mat(myclasses(classIndex)));
       eval(sprintf('classVar = class_%s;',cell2mat(myclasses(classIndex))));

       temp = zeros(size(classVar,1),size(classVar,2)*size(classVar,3)*3);
       for imageIndex = 1:size(temp,1)
           myImage = squeeze(classVar(imageIndex,:,:,:));
           temp(imageIndex,:) = reshape(reshape(permute(myImage,[1 3 2]),[size(classVar,2)*3 size(classVar,2)])',[1 size(temp,2)]);
       end

       superVector = [superVector; [temp classIndex*ones(size(temp,1),1)]];

    end

    % Normalising to zero-mean unit-variance
    % Probably the variance normalisation shouldn't be done now. Only afte reducing dimension?
    m = mean(superVector(:,1:end-1));
    % v = var(superVector(:,1:end-1));
    superVector(:,1:end-1) = superVector(:,1:end-1) - repmat(m,[size(superVector,1) 1]);
    % superVector(:,1:end-1) = superVector(:,1:end-1)./sqrt(repmat(v,[size(superVector,1) 1]));

    clear m v;
    %==========================================================================
end
fprintf('Completed superVector preparation. Commencing PCA... \n');


% Temporary shortcut 
% load matlabData/superVector.mat;

skipPCA = 1;
if (skipPCA ~= 1)
    %==========================================================================
    % Now, get to the PCA part - This block requires a lot of memory and time.
    % Best to execute as a standalone code, and hence skipping over by default.

    % Q is 5.8G for 8240x30,000 

    X = superVector(:,1:end-1); labels = superVector(:,end);
    clear superVector;

    fprintf('Creating covariance matrix...\n');
    Q = X'*X; clear X;    % Takes 5-10 min
    fprintf('Computing the eigen vectors and eigen values...\n');
    [e,l] = eig(Q); clear Q;

else
    load('matlabData/afterEigAnalysis.mat','l');
    % Now, 'e' is the eigenmatrix, 'l' is the eigenvalue matrix
end

% Choosing a reduced dimension

% Relative Strength         First n values
% 1                         12
% 0.1                       80
% 0.01                      550
% 0.001                     2576

m = 80;  % The reduced dimension
l = l(end-m+1:end,end-m+1:end); l = diag(l);
load('matlabData/afterEigAnalysis.mat','e');     % This will take some time
e = e(:,end-m+1:end); e = fliplr(e);            % Since e-vectors are ascending by default
save('temp.mat','e','l');
clear;
load('matlabData/superVector.mat');
labels = superVector(:,end); superVector = superVector(:,1:end-1);
load('temp.mat','e');
superVector = superVector*e;

% Now, do zero-mean unit variance normalisation
m = mean(superVector);
v = var(superVector);
superVector = superVector - repmat(m,[size(superVector,1) 1]);
superVector = superVector./sqrt(repmat(v,[size(superVector,1) 1]));

save('matlabData/afterDimReduction.mat');
superVector = [superVector labels];

% Creating a bag-of-words representation for the labels
a = eye(10); bag_of_words_labels = zeros(size(superVector,1),length(myclasses));
for classIndex = 1:length(myclasses)
    bag_of_words_labels(824*(classIndex-1)+1:824*(classIndex),:) = repmat(a(classIndex,:),[824 1]);
end
clear a classIndex;
arffwrite('matlabData/afterDimReduction',superVector);

%==========================================================================

