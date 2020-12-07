# MERGES TRAIN AND TEST SETS INTO ONE DATA SET (INCLUDING SUBJECTS AND ACTIVITIES)
### Combines Subjects, activities and variables per data set.
datatest <- cbind(read.table("./UCI HAR Dataset/test/subject_test.txt"), read.table("./UCI HAR Dataset/test/y_test.txt"), read.table("./UCI HAR Dataset/test/X_test.txt"));
datatrain <- cbind(read.table("./UCI HAR Dataset/train/subject_train.txt"), read.table("./UCI HAR Dataset/train/y_train.txt"), read.table("./UCI HAR Dataset/train/X_train.txt"))
### Merges both data sets into one.
data <- rbind(datatest, datatrain)

# EXTRACTS ONLY THE VARIABLES WITH THE MEAN AND STD OF THE MEASUREMENTS
### Reads the varaiable names given by the data base.
names <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")
### Includes the names for subject and activity in the vector to match the data set.
names <- c("Subject", "Activity", names$V2)
### Searches for the mean and std variables.
selection <- grep("-mean\\()|-std\\()", names)
### Replaces the data set with only the extracted variables.
selection <- c(1, 2, selection);
data <- data[, selection]

# NAMES DESCRIPTIVELY THE ACTIVITIES INSTEAD OF NUMBERS
### Reads the activity names given by the data base.
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = "character")
### Matches the activities in the data set with their respective descriptive name.
data <- merge(data, activities, by.x = "V1.1", by.y = "V1")
### Cleans the data set and leaves only the subjects, descriptive activity name and variables.
library(dplyr);
data <- select(data, 2, V2.y, 3:68);
data <- arrange(data, V1, V2.y)

# LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
colnames(data) <- names[selection]

# CREATES TIDY DATA SET WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
data <- group_by(data, Activity, Subject);
averages <- summarize_all(data, mean)
