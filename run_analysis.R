# read the train and test dataset, and combine them
variable_names <- read.table("./UCI HAR Dataset/features.txt")[,2]

## read train data set
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(train) <- variable_names
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names = "subject")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                          col.names = "activity")
train <- data.frame(subject_train, activity_train, dataset = "train", train, 
                    check.names = FALSE)

## read test data set
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(test) <- variable_names
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                            col.names = "subject")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                             col.names = "activity")
test <- data.frame(subject_test, activity_test, dataset = "test", test,
                   check.names = FALSE)

## combine train and test data sets
combined_data <- rbind(train,test)

## remove other variables
rm("activity_test","activity_train","subject_test", "subject_train")

# extracts the needed variables
extracted_data <- combined_data[, grepl("(subject)|(activity)|(mean\\(\\))|(std\\(\\))", 
                                        names(combined_data))]

# name the activity
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                       col.names = c("level", "label"))
extracted_data$activity <- factor(extracted_data$activity, 
                                  levels = activity$level, 
                                  labels = activity$label)
extracted_data$subject <- factor(extracted_data$su)

# make the tidy data set
library(dplyr)
library(tidyr)
library(tibble)
extracted_data <- as_tibble(extracted_data)

tidy_data <- extracted_data %>% 
    pivot_longer(-("subject":"activity"),
                 names_to = "signal_statistics_axis",
                 values_to = "value") %>%
    separate(signal_statistics_axis,c("signal","statistics","axis"))

# the second tidy data set with the average of each variable for each activity
# and each subject
average_data <- tidy_data %>% 
    group_by(subject, activity, signal, statistics, axis) %>%
    summarize(avarage = mean(value))

# export the data set
write.table(average_data,"./uploaded.txt",row.name = FALSE)

rm(list = ls())
