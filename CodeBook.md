# Code Book

## Data
The data that was given for the assignment had various text files divided into two sets, "test" and "train". Each set had their information broken in three text files. One with one column containing the subjects, another with the measurements for the variables, and the third one with one column containing the activity.
Additionally, there where informative text files giving information like: variable names for the data sets, names for the activity codes and information about the variables.

## Transformations
To get the final data set, the changes below where done on the initial data:
  
  1. Create a data frame that combined subjects, variables, activities for both test and train data sets.
  2. Merge both data frames into one.
  3. Extract the variables requires by the assignment from the data set (explanation on next section "variables").
  4. Match the variable names with the extracted data set.
  5. Summarize the averages of each variable by subject and activity and each subject.
  
## Variables
The variable names were taken from the original variables names given in the text file "features" and then filtered.
As the code book for the original data "features_info" states, the following are set of signals measured:

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

### Note: "-XYZ" means a tri-axial signal so all the variables are calculated for each direction X, Y and Z.

Then some variables are calculated based on each of these measurements. For the purpose of this assignment, only the ones containing mean() and std() were extracted into the summarized data set.
