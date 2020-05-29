# loading dplyr package
library(dplyr)

# obtaining dataset
file_name <- "Getting_and_Cleaning_Data_Final.zip"
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url, file_name, method="curl")
unzip(file_name)

# Naming and assigning all data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Step 1: merging training data
X <- rbind(X_train, X_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
merged_data <- cbind(Subject, Y, X)

# Step 2: extracting mean and standard deviation
TidyData <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

# Step 3: using descriptive activity names by replacing numbers in code column with the corresponding activity
TidyData$code <- activity[TidyData$code, 2]

# Step 4: labeling data with descriptive variable names 
names(TidyData)[2] = "Activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "StandardDeviation", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

# Step 5: creating final tidy data set with averages for each variable and activity for every subject
FinalData <- TidyData %>%
    group_by(subject, Activity) %>%
    summarise_all(list(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)