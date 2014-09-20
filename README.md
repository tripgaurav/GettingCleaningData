Decision Science Toolkit - Getting and cleaning data coursework
===============================================================

## Coursework Objective

Write a R script called ```run_analysis.R``` that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run the program

1. Create a folder named ```data``` in your working directory
2. Place the program ```run_analysis.R``` in the parent folder of ```data``` folder (i.e. in the working directory).
3. Run the program to generate the output in a file ```tidyaggrdataset.txt``` in the ```data``` folder.

## How the script works

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
