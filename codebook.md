Getting and Cleaning Data Project

This is for indicating all the variables and summaries calculated, along with unite, and any other relevant information.

Source Data
The information about how the experiment conducted and how the original data collected can be found in the zip file here.

Introduction for the analysis on the original data
1. Merge the training and the test sets to create one data set.
Using download.file() together with unzip() function to download the zip file from website to my compute.
Using read.table() function to load "X_train.txt", "y_train", "subject_train" in train directory and "X_test", "y_test", "subject_test" into R.
Using rbind() and cbind() functions to merge all train and test data together.
2. Extract only the measurements on the mean and standard deviation for each measurement.
Using read.table() function to load "features.txt" into R.
Using grep() function to find the indexes with "mean()" and "sd()".
select all relevant columns and set the columns name using the selected features name.
3. Uses descriptive activity names to name the activities in the data set
Using read.table() function to load "activity_labels.txt" into R.
Using factor() function with arguments "levels = " and "labels = " to replace the numbers to activity names.
4. Appropriately labels the data set with descriptive variable names
Using gsub() function to replace all characters I think they are needed to replace.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Using group_by() and summarise_each() functions in dplyr package to calculate all means for each activity and wach subject.