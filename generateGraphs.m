%==========================================================================
%% CART

% percentageCorrect : [PCA +L1 +LDA]
datasets = {'gray smooth', 'gray normal', 'color smooth' ,'color normal'};
percentCorrect = [26.6748 27.2209 34.3325; 
                    25.0971 26.4076 34.5874; 
                    28.3252 29.0413 44.0898; 
                    29.4539 30.5461 44.9636];
bar(percentCorrect);
set(gca,'XTickLabel',datasets);
ylabel('%Correct');
title('CART');
%%
% F-measure : [PCA +L1 +LDA]
fmeasure = [0.261 0.267 0.342;
            0.246 0.256 0.345;
            0.282 0.289 0.441;
            0.291 0.303 0.449;];
bar(fmeasure)
set(gca,'XTickLabel',datasets);
ylabel('Fmeasure');
title('CART');
%==========================================================================


%==========================================================================
%% Random Forests

% 100 trees
% percentageCorrect : [PCA +L1 +LDA]
% reference = {'yes|yes', 'no|yes', 'yes|no', 'no|no'}
datasets = {'gray smooth', 'gray normal', 'color smooth' ,'color normal'};
percentCorrect = [  24.733  34.0291 39.6326 ;
                    23.8471 34.7937 40.182  ;
                    30      42.949  48.665  ;
                    29.4296 43.3374 49.8058 ];
                
bar(percentCorrect);
set(gca,'XTickLabel',datasets);
ylabel('%Correct');
title('Random Forest - 100 trees');

%%
% F-measure : [PCA +L1 +LDA]
fmeasure = [ 0.246 0.336 0.396 ;
             0.236 0.345 0.401 ;
             0.296 0.425 0.486 ;
             0.292 0.43  0.496 ];
bar(fmeasure)
set(gca,'XTickLabel',datasets);
ylabel('Fmeasure');
title('Random Forest - 100 trees');
%==========================================================================


%==========================================================================
%% Random Forests

% 300 trees
% percentageCorrect : [PCA +L1 +LDA]
% reference = {'yes|yes', 'no|yes', 'yes|no', 'no|no'}
datasets = {'gray smooth', 'gray normal', 'color smooth' ,'color normal'};
percentCorrect = [ 28.705  36.3714 39.818  ;
                   28.3617 36.9715 40.4976 ;
                   36.0316 45.5216 49.1626 ;
                   35.983  45.6675 50.267  ];


bar(percentCorrect);
set(gca,'XTickLabel',datasets);
ylabel('%Correct');
title('Random Forest - 300 trees');

%%
% F-measure : [PCA +L1 +LDA]
fmeasure = [0.282 0.359 0.398 ;
            0.279 0.363 0.404 ;
            0.354 0.451 0.491 ;
            0.355 0.453 0.502 ];

bar(fmeasure)
set(gca,'XTickLabel',datasets);
ylabel('Fmeasure');
title('Random Forest - 300 trees');
%==========================================================================


%==========================================================================
%% Random Forests

% 500 trees
% percentageCorrect : [PCA +L1 +LDA]
% reference = {'yes|yes', 'no|yes', 'yes|no', 'no|no'}
datasets = {'gray smooth', 'gray normal', 'color smooth' ,'color normal'};
percentCorrect = [  31.0922 37.051  40.182  ;
                    30.6917 37.6092 40.8495 ;
                    39.017  45.983  49.1963 ;
                    38.0947 46.25   50.5461 ];

bar(percentCorrect);
set(gca,'XTickLabel',datasets);
ylabel('%Correct');
title('Random Forest - 500 trees');

%%
% F-measure : [PCA +L1 +LDA]
fmeasure = [ 0.304 0.365 0.401 ;
             0.299 0.37  0.408 ;
             0.383 0.454 0.491 ;
             0.375 0.458 0.505 ];

bar(fmeasure)
set(gca,'XTickLabel',datasets);
ylabel('Fmeasure');
title('Random Forest - 500 trees');
%==========================================================================



%==========================================================================
%% Random Forests

% 1000 trees
% percentageCorrect : [PCA +L1 +LDA]
% reference = {'yes|yes', 'no|yes', 'yes|no', 'no|no'}
datasets = {'gray smooth', 'gray normal', 'color smooth' ,'color normal'};
percentCorrect = [  33.5073 37.3301 39.7694 ;
                    32.5607 38.1553 40.7524 ;
                    41.4684 46.6383 49.2961 ;
                    41.2379 46.2397 50.5704 ];

bar(percentCorrect);
set(gca,'XTickLabel',datasets);
ylabel('%Correct');
title('Random Forest - 1000 trees');
%%

% F-measure : [PCA +L1 +LDA]
fmeasure = [    0.327 0.368 0.397 ;
                0.316 0.375 0.407 ;
                0.406 0.461 0.493 ;
                0.405 0.458 0.505 ];

bar(fmeasure)
set(gca,'XTickLabel',datasets);
ylabel('Fmeasure');
title('Random Forest - 1000 trees');
%==========================================================================



%==========================================================================
%% Parzen

% percentageCorrect : [PCA +L1 +LDA]
% reference = {'yes|yes', 'no|yes', 'yes|no', 'no|no'}
datasets = {'gray smooth', 'gray normal', 'color smooth' ,'color normal'};
percentCorrect = [  26.7233 32.4636 41.2379 ;
                    25.1942 32.7063 42.3908 ;
                    28.9442 38.932  50.3519 ;
                    28.9563 39.4417 51.7519 ];

bar(percentCorrect);
set(gca,'XTickLabel',datasets);
ylabel('%Correct');
title('Parzen');

%%
% F-measure : [PCA +L1 +LDA]
fmeasure = [  0.257 0.32  0.412 ;
              0.235 0.322 0.424 ;
              0.282 0.385 0.504 ;
              0.282 0.391 0.517 ];

bar(fmeasure)
set(gca,'XTickLabel',datasets);
ylabel('Fmeasure');
title('Parzen');
%==========================================================================


%==========================================================================
%% KNN

% percentageCorrect : [PCA +L1 +LDA]
% reference = {'yes|yes', 'no|yes', 'yes|no', 'no|no'}
datasets = {'gray smooth', 'gray normal', 'color smooth' ,'color normal'};
percentCorrect = [  11.3228 21.1893 39.0291 ;
                    13.8471 21.5655 40.5583  ;
                    12.9976 32.3908 49.7937 ;
                    14.6966 32.4939 50.5216 ];

bar(percentCorrect);
set(gca,'XTickLabel',datasets);
ylabel('%Correct');
title('KNN');

%%
% F-measure : [PCA +L1 +LDA]
fmeasure = [  0.04  0.16  0.392 ;
              0.068 0.164 0.407 ; 
              0.062 0.288 0.498 ;
              0.07  0.28  0.505 ];
bar(fmeasure)
set(gca,'XTickLabel',datasets);
ylabel('Fmeasure');
title('KNN');
%==========================================================================