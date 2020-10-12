# GettingAndCleanningData
##### by Vanadium

In this project, firstly, the train and test data sets were imported to R. The column names of these data sets were gotten from "features.txt". For each data set, two columns, subject and activity, were added at the left. After that, these two data sets were combinded using rbind.
As told in the project file, only the measurements on the mean and standard deviation, together with subject and activity, were extracted, using the regular expressions - "(subject)|(activity)|(mean\\(\\))|(std\\(\\)).
Because the extracted data set was not a tidy data set, I needed to make the data tidy.
As we could see, the column headers of the data set contained values, such as mean/std (which were statistics) and X/Y/Z (which were axes). Thus, the pivot_longer() function was used first, following by the separate() function. Finaly, a tidy data set was made.
In the step 5, I used group_by() function followed by summary() function, and the average value could be made.