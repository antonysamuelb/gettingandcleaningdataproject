# Getting and Cleaning Data: Project - Antony Samuel B

rm(list = ls())

# Download Zip Files and extract contents.

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              "accelData.zip")
unzip("accelData.zip")

# Read Extracted contents to Data Frames.

testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testtrainOrTest <- rep("test",length(testData$V1))

trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
traintrainOrTest <- rep("train",length(trainData$V1))

featureNames <- read.table("./UCI HAR Dataset/features.txt") 
activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Task 1
# Merge the training and the test sets to create one data set. 
mergedDF <- rbind(testData , trainData)

mactivity <- rbind(testactivity, trainactivity)$V1

msubject <- rbind(testsubject, trainsubject)$V1


# Task 2
# Extract only the measurements on the mean and standard deviation 
# for each measurement. 
msnamesindex <- grep("[Mm]ean\\(\\)|std\\(\\)",featureNames$V2)
msnames <- grep("[Mm]ean\\(\\)|std\\(\\)",featureNames$V2, value = TRUE)
reqDF <- mergedDF[,c(msnamesindex)]


# Task 3
# Use descriptive activity names to name the activities in the data set. (task 3)
reqDF$activity <- factor(mactivity, levels = activityNames[,1],
                            labels = as.character( activityNames[,2]) )
                    
reqDF$subject <- msubject

# Task 4
# Appropriately labels the data set with descriptive variable names. 
names(reqDF) <- c(msnames,"activity","subject")


# Task 5
# From the data set in step 4, create a second, independent tidy 
# data set with the average of each variable for each activity and 
# each subject.

library(plyr)

# changing activity back to numeric class to use in ddply
reqDF$activity <- as.numeric(reqDF$activity)

# Using ddply to get the required tidy data set 
newTable <- ddply(reqDF, .(subject, activity), colMeans)

# changing activity back to factor class to use in ddply
newTable$activity <- factor(newTable$activity, levels = activityNames[,1],
                         labels = as.character( activityNames[,2]) )

# Rearrangin columns so that activity and subject are ordered first
newTable <- newTable[,c(67,68,1:66)]

# Changing names to reflect operation done upon them
names(newTable)[3:68] <- paste("mean:", names(newTable[,3:68]))

# write out the tidy data set.
write.table(newTable, "tidyData.txt", row.names = FALSE)

