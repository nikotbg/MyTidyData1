Project
Creating a tidy summary report based on raw human activity recognition data
Created by: Nikotbg
Date: 10/25/2015

Project Description

The summary report will provide average data for ‘mean’ and ‘std’ variables grouped by activity type and by subject who carried out the initial experiment.
The output report has to be neat and organized and to comply with the tidy dataset main principles.

Study design and data processing

Collection of the raw data

Each person, from 30 volunteers involved in the experiment, performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were sampled in fixed-width sliding windows (128 readings/window). The sensor acceleration signal, was separated into body acceleration and gravity. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ ( time domain signals with prefix 't' to denote time) Similarly, the acceleration signal is separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) Subsequently, the body linear acceleration and angular velocity are derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Notes on the original (raw) data

The files with raw data used in this project are:
-	'features.txt': List of all features. A 561-feature vector with time and frequency domain variables.
-	'activity_labels.txt': Links the class labels with their activity name.
-	'train/X_train.txt': Training set.
-	'train/y_train.txt': Training labels.
-	'test/X_test.txt': Test set.
-	'test/y_test.txt': Test labels. 
-	'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
-	'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Creating the tidy data-file
Guide to create the tidy data file

1)	After the "UCI HAR Dataset" is downloaded and assigned as working directory, all necessary file (from the list above) need to be read into R
2)	Before continuing, run the dim() function for all of the 6 datasets to understand how they fit together
3)	Rename the columns for activity and subject tables
4)	Manipulating/filtering the features table to get only the 'mean' and 'std' for the different measurements 
NOTE: 'meanFreq' intentionally left in the dataset as being a measurement of group of other measurements
5)	Merging 'train' and 'test' datasets. ('train' on top). 
6)	Renaming the columns in 'merged' using the measurement names from 'features'
7)	Extracting the measurements on the mean and standard deviation from 'merged'
8)	Merging the 'subject' and 'activity' data for 'train' and 'test' ('train' on top)
9)	Double checking the length with dim() function and also that 'train' data is on top of test data 
10)	Merging the subject/activity dataset 'traintestSA' with the measurements dataset 'merged1'
11)	Labeling the activity column values with corresponding activity names from 'activity_labels' table
12)	Creating the summary dataset by calculating the average for each measurement per activity type and per subject

Description of the variables in the MyTidyData.txt file
•	Dimensions of the dataset: 180 measurements of 81 variables
•	Description of the resulting dataset: 
The resulting dataset provides the average value of certain variables grouped by 1) Subject (person) performing the activity and 2) Activity type

Variable present in the summary dataset: total of 81 variables

Variable 1

Name: “subject” 
Class: Integer
Description: provides identification ID of the person performing the experiment activity. There are 30 different persons (subjects) 

Variable 2   

Name: “activity” 
Class: Factor / 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
Description: provides information for the type of activity performed. Each of the 6 activity types above is performed by each of the 30 subjects
 
Variables 3 to 81   

Description: 

Variables Names are constructed as follow:
1)	prefix 't' or ‘f’ to denote time or frequency
2)	combination of accelerometer (Acc)and gyroscope(Gyro) – Body and Gravity- Jerk and Mag
3)	mean() and std() added for Mean and Standard Deviation measurements
4)	X,Y or Z at the end is denoting the direction of the 3-axial signal measurement

NOTE: variables ending with “meanFreq” are measuring the average value of group of variables of the same type…
       
List of Variables 3 to 81:      
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()
