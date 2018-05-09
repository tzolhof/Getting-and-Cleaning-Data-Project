Getting and Cleaning Data Course Project

The purpose of this project is to create a tidy data as an assignment for the Week 4 of the Getting and Cleaning Data Course at Coursera.

Getting Started

The data for this project can be found on the link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It is necessary to download and unzip the data into the R working directory; download the R script into the R working directory; and execute the script to generate the tidy data set.

Data Set Information

The data set includes information on experiments that have been carried out with a group of 30 volunteers that performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Attribute Information

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

Dependencies

The dplyr library needs to be installed.

Script Information

The script was created according to the following requirements:

1 - Merges the training and the test sets to create one data set: after reading the training and testing data sets, a new merged data set is created using the rbind function;
2- Extracts only the measurements on the mean and standard deviation for each measurement: uses the  grepl function for this purpose;
3- Uses descriptive activity names to name the activities in the data set: by merging the data set with the file containing each activity description;
4- Appropriately labels the data set with descriptive variable names: uses the function gsub to remove characters as “( )”, “-” and capitalize important letters to create more descriptive variable names;
5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject: with the help of the function aggregate the desired tidy data set is created.

Notes

Script created on May 8, 2018.
