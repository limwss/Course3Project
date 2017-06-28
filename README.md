# Course3Project
##Getting and Cleaning Data - Course Project
###This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

###1. Download the data set, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip if it does not already exist in the working directory.
###2. Unzip the data set into UCI HAR Dataset directory, if it does not already exist in eth working directory. You should see a folder named UCI HAR Dataset in the working directory.
###3. Loads the activity and feature info and label teh datasets.
###4. Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
###5. Using the "merge" function, descriptive activity names are merged with the mean/std values dataset, to get one dataset with descriptive activity names
###5. Merges the two datasets
###6. Lastly, with the help of the "melt" and "dcast" functions of the "reshape2" package, the data is converted into a table containing mean values of all the included features, ordered by the activity name and the subject id.
###The end result is written to the 'tidy_data.txt" file.
