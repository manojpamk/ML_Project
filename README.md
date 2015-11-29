		EE660 : Machine Learning Project

					      	- Manoj Kumar

This project studies the performane of selected supervised (CART and Random Forests) and unsupervised classifiers (Parzen denisty estimation and K-Nearest Neighbours) on the ImageNet database. 

Requirements :
~~~~~~~~~~~

1. MATLAB (tested on 7.12). Following dependencies included.
	1.1 arffwrite.m (http://www.mathworks.com/matlabcentral/fileexchange/45954-write-data-in-arff-format/content/arffwrite.m)
	1.2 sbmlr.m (http://featureselection.asu.edu/software.php)
	1.3 LDA.m (http://www.mathworks.com/matlabcentral/fileexchange/31760-multiclass-lda/content/LDA.m)
2. Weka  - Collection of Open Source Machine Learning alogirthms. (http://www.cs.waikato.ac.nz/ml/weka/downloading.html)

Procedure :
~~~~~~~~~

The entire process is divided into two parts :
1. Data preparation, feature extraction and feature selections -  masterScript.m
2. Data classification - Weka

masterScript.m implements the first part, with flags to skip each step. However, the work as of now has been implemented within each script, and some parameters are still hardcoded.

The imageNet dataset consists of over 14 million images among 21000+ classes, and is continuously being updated. For the purpose of this project, 10 classes are chosen - Flower, Dog, House, Aeroplane, Ship, Car, Motorcycle, Bus, Beach  and Mountain. Examples for each class come in the form of text files containing the link to images. 

The script readUrlSaveImage.m parses each line of these text files, and collects the images into directories named after the class. Broken links are ignored. Since the features used are basically processed pixel intensities, the images are resized to a common dimension (100x100x3) in rescaleDxD.m. Smaller images are discarded.

Pre-Processing : Two steps common to ML have been used in this work - reduction to grayscale and Gaussian smoothening. All 4 combinations have been tested (none, one or both). Grayscale is used to primarily check if the color channels add any new information while the filtering attempts to remove noisy variations (temporal only). Following this, N images are chosen at random to be used for further processing, where N = min(Number of examples in each class). These steps are implemented in saveImageData.m

PCA Analysis : (performPCA.m) Raw pixel intensities come in extremeley high dimensions given the number of examples per class and for the purpose of this work. PCA is well known for removing correlation. Here, it is used to reduce 'irrelevant' features, where relevance of a feature is measured by the amount of variance present. Data is transferred into a lower feature space, whose dimension is determined in an empirical manner so as to retain around 500 dimensions. An idea of the variance distribution in the top relevant features is presented in performPCA.m, alongwith the chosen number of dimensions.
NOTE : This is the most resource-consuming step, and hence it is highly recommended to execute in a block manner.

Additional tasks include creation of a 1-in-N representation of the labels - this will be used in the next step; and zero-mean unit-variance normalization.

L1 Analysis : In regression analysis, using a Laplace prior for the error distribution and least absolute values for error computation (instead of the more common least squares) promotes sparsity of the weight vector. Here. this technique is used to find the top 50 (a small, round number) features using the absolute value of the weights across dimensions and classes. The script performL1.m is used for this purpose. Since the classes do not have an inherent hierarchy, the labels are converted from natural numbers to a 10 dimensional vector (1 in Cth dimension, 0 elsewhere) in the previous step.

LDA Analysis : (performLDA.m) As an alternative to L1, and to test it's applicability to classification tasks, multi-class linear discriminant analysis is performed on the PCA-reduced feature space. LDA is a more explicit feature reduction technique than PCA and used specifically for classification tasks. The features are transformed into a (C-1) dimensional space which explicitly enhances discrimiation. The advantage in this task is the reduction into a 9-D space, wherein computation time for classification tasks is extremely small.


Part 1 ends here. Part 2 (classification) is done entirely on Weka - an open source Machine Learning Tool. Results will be updated soon in this repository.

