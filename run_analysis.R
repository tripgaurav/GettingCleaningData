# Download and unzip file

link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
downloadFolder <- "./data/getdata_projectfiles_UCI HAR Dataset.zip"
download.file(link, downloadFolder, mode = "wb")
unzip(downloadFolder, exdir = "./data")

# Read all test and train files
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# read activity and features files
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

# add headers to test and train datasets
names(x_test) <- features[,2]
names(x_train) <- features[,2]

names(subject_test) <- "Subject_ID"
names(subject_train) <- "Subject_ID"

names(y_test) <- "Activity_ID"
names(y_train) <- "Activity_ID"

# choose mean and standard deviation measures
features_mean_stdd <- grepl("mean\\(\\)|std\\(\\)", features[,2])

x_train_mean_stdd <- x_train[,features_mean_stdd]
x_test_mean_stdd <- x_test[,features_mean_stdd]

#create master test and train data
bind_test <- cbind(subject_test, y_test, x_test_mean_stdd)
bind_train <- cbind(subject_train, y_train, x_train_mean_stdd)

# append test and train data
master_data <- rbind(bind_test, bind_train)

# create descriptive activity labels by merging (left join) 2 tables
names(activity_labels) = c("Activity_ID", "Activity_Name")
master_data_act_name <- merge(master_data, activity_labels, 
                              by.x = "Activity_ID", by.y = "Activity_ID", all.x=TRUE)

# reorder columns
master_data_reordered <- master_data_act_name[,c(2,1,69,3:68)]

# create an independent tidy data set with average of each 
# variable for each activity and each subject
aggr <- aggregate(. ~ Subject_ID + Activity_Name, data=master_data_reordered, FUN = mean)

#write output to file
write.table(aggr, file="./data/tidyaggrdataset.txt", sep="\t", row.names=FALSE)