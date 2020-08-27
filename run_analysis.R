#Downloading file
setwd("~/Documents/Data_science/data")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./dataset.zip", method = "curl")
unzip("dataset.zip")
library(dplyr)

#Reading and labeling each dataset 
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Merges the training and the test sets to create one data set.
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)
mergedDT <- cbind(x, y, subject)

#Extracts only the measurements on the mean and standard deviation for each measurement.
Final_data <- mergedDT %>% select(subject, code, contains("mean"), contains("std"))
View(Final_data)

#Uses descriptive activity names to name the activities in the data set.
Final_data$code <- activities[Final_data$code, 2]
View(Final_data)

#Appropriately labels the data set with descriptive variable names.
names(Final_data)[2] = "activity"
names(Final_data)<-gsub("Acc", "Accelerometer", names(Final_data))
names(Final_data)<-gsub("Gyro", "Gyroscope", names(Final_data))
names(Final_data)<-gsub("BodyBody", "Body", names(Final_data))
names(Final_data)<-gsub("Mag", "Magnitude", names(Final_data))
names(Final_data)<-gsub("^t", "Time", names(Final_data))
names(Final_data)<-gsub("^f", "Frequency", names(Final_data))
names(Final_data)<-gsub("tBody", "TimeBody", names(Final_data))
names(Final_data)<-gsub("-mean()", "Mean", names(Final_data), ignore.case = TRUE)
names(Final_data)<-gsub("-std()", "STD", names(Final_data), ignore.case = TRUE)
names(Final_data)<-gsub("-freq()", "Frequency", names(Final_data), ignore.case = TRUE)
names(Final_data)<-gsub("angle", "Angle", names(Final_data))
names(Final_data)<-gsub("gravity", "Gravity", names(Final_data))
View(Final_data)

#From the data set in step 4, creates a second, independent tidy data set with
#the average of each variable for each activity and each subject.
Tidy_data <- Final_data %>% group_by(subject, activity) %>% 
        summarize_all(list(mean))
write.table(Tidy_data, "Tidy_data.txt", row.names = FALSE)

str(Tidy_data)

