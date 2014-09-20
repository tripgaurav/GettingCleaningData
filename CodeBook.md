Decision Science Toolkit - Getting and cleaning data coursework
===============================================================

## Input Data source
* The raw data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* Its description can be seen at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## About Input Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The dataset includes the following files:

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

## Variables


## Transformation
1. Downloads the input data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzips the data
3. Reads all ```test``` and ```train``` files
4. Reads ```activity``` and ```features``` files
5. Adds headers to ```test``` and ```train``` datasets
6. Filters to retain only mean and standard deviation measures in ```test``` and ```train``` datasets
7. Creates master test and train data by merging subject, activity and timing data
8. Appends master test and train data to create master data
9. Creates descriptive activity labels by merging (left joining) master data and activity label
10. Creates an independent tidy data set with average of each variable for each activity and each subject, and writes the output to a file using write.table() function

## About Output Data
The output tidy data set has 69 columns:
* Column 1: "Subject_ID" - Mentions ID of the subject for whom average timing of activity is calculated across each measurement
* Column 2: "Activity_Name" - Mentions Name of the activity for which average is calculated across each measurement
* Column 3: "Activity_ID" - Mentions ID of the activity for which average is calculated across each measurement
* Columns 4 - 69: "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y" ... "fBodyBodyGyroJerkMag-std()" - Various measurements taken, described in ```features_info.txt``` file