#Downloading dataset: download.file(UCI HAR Dataset.zip)

#Loading the required package: library(dplyr)

#Reading and labeling each dataset from directory "./UCI HAR Dataset/":
        features <- 
        activities <-
        subject_test <- 
        x_test <- 
        y_test <- 
        subject_train <- 
        x_train <- 
        y_train <- 
        
#Merges the training and the test sets to create one data set.
merging step by step using rbind() function and assigning to new variable:                                                 x <- x_train and x_test
                                           y <-  y_train and y_test
                                        subject<-subject_train and subject_test
Finally, creating one dataset using cbind() function:
                                Final_data <- x, y and subject
                                
#Extracts only the measurements on the mean and standard deviation for each measurement. 
From "mergedDF" dataframe: Using select() function "subject" and "code" were selected, to identify observations. From the rest columns, means for each observation were taken. Then new dataset was assigned to "Final_data"

#Uses descriptive activity names to name the activities in the data set.
Codes in "Final_data" were changed to activity names such as "SITTING","STANDING" ...

#Appropriately labels the data set with descriptive variable names.
Every abbrevation were labeled using the README.txt file in the dataset.
"Accelerometer" for Acc
"Gyroscope" for Gyro
"Body" for BodyBody
"Magnitude" for Mag 
"Frequency" for f
"Time" for t

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Final_data was groupped by subject and activity, then summarized taking the mean for each varible and assigned to new var "Tidy_data".
                                

                                        
