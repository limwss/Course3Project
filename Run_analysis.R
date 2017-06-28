library(reshape2)

setwd("C:/Users/Dell/Documents/coursera/Course3/Project")


## Download and unzip the dataset:

filename <- "getdata_dataset.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, mode="wb")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Load labels and features
activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_Labels[,2] <- as.character(activity_Labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])



#get the needed features labels and replaced with meaningful names
featuresNeeded <- grep(".*mean.*|.*std.*", features[,2])
featuresNeeded.names <- features[featuresNeeded,2]
featuresNeeded.names = gsub('-mean', 'Mean', featuresNeeded.names)
featuresNeeded.names = gsub('-std', 'Std', featuresNeeded.names)
featuresNeeded.names <- gsub('[-()]', '', featuresNeeded.names)


train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresNeeded]

train_Activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_Subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_Subjects, train_Activities, train)


test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresNeeded]
test_Activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_Subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_Subjects, test_Activities, test)


##Combine the test data and the train data into one dataframe
train_test <- rbind(train, test)

# add labels
colnames(train_test) <- c("subject", "activity", featuresNeeded.names)



train_test$activity <- factor(train_test$activity, levels = activity_Labels[,1], labels = activity_Labels[,2])
train_test$subject <- as.factor(train_test$subject)

data_melt <- melt(train_test, id = c("subject", "activity"))   
mean_data <- dcast(data_melt,subject + activity ~ variable,mean)		

write.table(mean_data,"tidy_dataset.txt", row.name=FALSE)



