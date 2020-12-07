## MERGES TRAIN AND TEST SETS INTO ONE DATA SET (INCLUDING SUBJECTS AND ACTIVITIES)
datatest <- cbind(read.table("./UCI HAR Dataset/test/subject_test.txt"), read.table("./UCI HAR Dataset/test/y_test.txt"), read.table("./UCI HAR Dataset/test/X_test.txt"))
datatrain <- cbind(read.table("./UCI HAR Dataset/train/subject_train.txt"), read.table("./UCI HAR Dataset/train/y_train.txt"), read.table("./UCI HAR Dataset/train/X_train.txt"))
data <- rbind(datatest, datatrain)

## EXTRACTS ONLY THE VARIABLES WITH THE MEAN AND STD OF THE MEASUREMENTS
names <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")
names <- c("Subject", "Activity", names$V2)
selection <- grep("-mean\\()|-std\\()", names)
selection <- c(1, 2, selection)
data <- data[, selection]

## NAMES DESCRIPTIVELY THE ACTIVITIES INSTEAD OF NUMBERS
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = "character")
data <- merge(data, activities, by.x = "V1.1", by.y = "V1")
library(dplyr)
data <- select(data, 2, V2.y, 3:68)
data <- arrange(data, V1, V2.y)

## LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
colnames(data) <- names[selection]

## CREATES TIDY DATA SET WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
data <- group_by(data, Activity, Subject)
averages <- summarize_all(data, mean)
