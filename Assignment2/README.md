About the Script
================
The R-script has been written under the assumption that all the necessary cdv files are available in the Working Directory set in the beginning of the code. Required files include - 
- activity_labels.txt
- features.txt
- X_test.txt
- y_test.txt
- subject_test.txt
- X_train.txt
- y_train.txt
- subject_train.txt


Merging Data
=============
After reading the required files into R, the script first merges all the data into one dataset called complete.data. This is done by using separately using cbind on the X_test, y_test & subject_test, and the X_train, y_train & subject_train files. Thereafter the train and test data is combined into the complete.data dataset using rbind. 


Filtering Mean and Std values
=============================
grepl function is used on the V3 column of features.txt to check for all the feature names containing Mean or Std in their names. 

Using the boolean vectors from the above step, a vector called required.features is created with only those features that have ???Mean??? or Std in their name. 

The complete.data is subsetted to include only those features that are listed in required.features. This becomes the final.complete.data dataset.


Activity Names
==============
A combination of the for and if function is used to replace the numbers 1-6 in the Activity_Labels column of complete.data with the corresponding descriptive activity label from the activity_label.txt file. 


Variable Names
==============
colnames function is used to define the column names for the complete.data dataset. Column name 1 is Subject; column names 2-87 are the features selected in required.features; column 88 is the Activity_Label. 


Tidy Data
=========
A 30x86 matrix is created to calculate the mean of each feature for each Subject. The tapply function loops over columns 2-87 in the final.complete.data to calculate the mean according to different levels of the Subject. This is referred to as the avg.by.sub dataset.

Similarly a 6x86 matrix is created to calculate the mean for each feature by Activity. The tapply function loops over columns 2-87 in the final.complete.data to calculate the mean according to different levels of the Activity_Labels. This is referred to as the avg.by.act dataset.

The tidy.data is an rbind of the avg. by.sub and avg. by.act datasets.

=========================================================================================
  
====================  
Original README text
====================

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit??? degli Studi di Genova.
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
