CODEBOOK
- The run_analysis.R script downloads data collected from the University of California Irvine Machine Learning Repository and processes this data set into a tidy data set via the five steps outlined by the assignment.
- Please see the STUDY DESIGN section below for more information about the raw data


Before following the five steps outlined by the assignment, the following steps must be taken:

Step 1: Install dplyr package in R
- run_analysis.R loads the dplyr library but does not install it
- the dplyr package can be installed by typing install.packages("dplyr") into R

Step 2: Download the dataset
- run_analysis.R downloads the dataset from the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip link provided in the assignment
- please note the original data from the University of California Irvine Machine Learning Repository can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Step 3: After reviewing the README file and exploring the dataset, name and assign the data found in the dataset to variables
- run_analysis.R names and assigns the following variables

features <- UCI HAR Dataset/features.txt : 561 rows, 2 columns
- this variable is a list of all the features selected for this data set using the smartphones' embedded accelerometers and gyroscopes

activity <- UCI HAR Dataset/activity_labels.txt : 6 rows, 2 columns
- this variable is a list of all activities performed when the measurements were observed and its codes which were found in the activity_labels text file

subject_test <- UCI HAR Dataset/test/subject_test.txt : 2947 rows, 1 column
- this variable contains test data of 9 volunteer test subjects that were randomly partitioned into the test data set

X_test <- UCI HAR Dataset/test/X_test.txt : 2947 rows, 561 columns
- this variable contains test data of 9 volunteer test subjects that were randomly partitioned into the test data set

y_test <- UCI HAR Dataset/test/y_test.txt : 2947 rows, 1 columns
- this variable contains test data of 9 volunteer test subjects that were randomly partitioned into the test data set

subject_train <- UCI HAR Dataset/train/subject_train.txt : 7352 rows, 1 column
- this variable contains test data of 21 volunteer test subjects that were randomly partitioned into the training data set

X_train <- UCI HAR Dataset/train/X_train.txt : 7352 rows, 561 columns
- this variable contains test data of 21 volunteer test subjects that were randomly partitioned into the training data set

y_train <- UCI HAR Dataset/train/y_train.txt : 7352 rows, 1 columns
- this variable contains test data of 21 volunteer test subjects that were randomly partitioned into the training data set


The following steps were taken to tidy the data in accordance with the assignment

Step 1: Merge the training and the test sets to create one data set

X: 10299 rows, 561 columns
- created by merging x_train and x_test using rbind() function

Y: 10299 rows, 1 column
- created by merging y_train and y_test using rbind() function

Subject: 10299 rows, 1 column
- created by merging subject_train and subject_test using rbind() function

merged_data: 10299 rows, 563 column
- created by merging Subject, Y and X using cbind() function

Step 2: Extract only the measurements on the mean and standard deviation for each measurement

TidyData: 10299 rows, 88 columns
- created by subsetting merged_data, selecting only subject and code columns and the measurements on the mean and standard deviation

Step 3: Use descriptive activity names to name the activities in the data set
- All of the numbers in code column of the TidyData are replaced with the activity taken from second column of the activity variable

Step 4: Appropriately label the data set with descriptive variable names
- code column in TidyData renamed into Activity
- All "Acc" in column’s name replaced by "Accelerometer"
- All "BodyBody" in column’s name replaced by "Body"
- All "Gyro" in column’s name replaced by "Gyroscope"
- All "Mag" in column’s name replaced by "Magnitude"
- All start with character "f" in column’s name replaced by "Frequency"
- All start with character "t" in column’s name replaced by "Time"
- All "tBody" in column's name replaced by "TimeBody"
- All "-mean" in column's name replaced by "Mean"
- All "-std" in column's name replaced by "StandDeviation"
- All "angle" in column's name replaced by "Angle"
- All "gravity" in column's name replaced by "Gravity"

Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

FinalData: 180 rows, 88 columns
- created by sumarizing TidyData by taking the mean of each variable for each activity and each subject and then grouping them by subject and activity
- this tidy data set is then exported as FinalData into FinalData.txt file.


STUDY DESIGN
- Please note: this was taken from the README file from the raw dataset
- This provides addtional information on the variables used in the study including units of measure
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
