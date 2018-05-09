# Read test set, adding activity and subject columns
test_set <- read.table("X_test.txt")
test_labels <- read.table("y_test.txt")
test_set$activity <- unlist(test_labels)
subject_test <- read.table("subject_test.txt")
test_set$subject <- unlist(subject_test)

# Read train set, adding activity and subject columns
train_set <- read.table("X_train.txt")
train_labels <- read.table("y_train.txt")
train_set$activity <- unlist(train_labels)
subject_train <- read.table("subject_train.txt")
train_set$subject <- unlist(subject_train)

# Merge test and train sets to create one data set
all_data_set <- rbind(test_set, train_set)

# Add column names
column_names <- read.table("features.txt")
colnames(all_data_set) <- c(as.character(column_names$V2), "activity", "subject")

# Take only measurements on the mean and standard deviation 
column_mean_std <- grepl("mean|std", 
                   c(as.character(column_names$V2), "activity", "subject"))
column_mean_std[562:563] <- TRUE
data_set_meanstd <- all_data_set[, column_mean_std]

# Give descriptve activity names to name the activities in the data set
activity_names <- read.table("activity_labels.txt")
new_set_meanstd <- merge(data_set_meanstd, activity_names, by.x = "activity", by.y = "V1")
new_set_meanstd <- new_set_meanstd[-1]
names(new_set_meanstd)[81] <- "activity"

# Label the data set with descriptive variable names
names(new_set_meanstd) <- gsub("()", "", names(new_set_meanstd), fixed = TRUE)
names(new_set_meanstd) <- gsub("-", ".", names(new_set_meanstd), fixed = TRUE)
names(new_set_meanstd) <- gsub("mean", "Mean", names(new_set_meanstd), fixed = TRUE)
names(new_set_meanstd) <- gsub("std", "Std", names(new_set_meanstd), fixed = TRUE)

# Create tidy data set with the average of each variable for each activity 
# and each subject 
library(dplyr)
tidy_set <- aggregate(new_set_meanstd[1:79], 
           list(new_set_meanstd$activity, new_set_meanstd$subject), mean)
names(tidy_set)[1] <- "activity"; names(tidy_set)[2] <- "subject"
tidy_set <- arrange(tidy_set, activity, subject)
write.table(tidy_set, "tidy.txt", row.names = FALSE, col.names = TRUE)

