# Code Book of Getting And Cleaning Data Course Project
##### by Vanaium

## variable names
The uploaded data set contained 6 columns with the names of "subject", "activity", "signal", "statistics", "axis", and "average".
* subject meant the id of the subject, which was from "subject_train.txt" and "subject_test.txt"
* activity meant the 6 activity performed by the subject, getting from "activity_labels.txt"
* signal meant the types of the row signals, such as "tBodyAcc", "tGravityACC", etc.
* statistics meant the way to deal with the original signal. I only extracted the mean value and the standard deviation
* axis meant 3 axial raw signal.
** signal, statistics, and axis were gotten from "features.txt"
* average meant the average value of each variable for each activity and each subject
