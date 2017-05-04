##Getting and Cleaning Data: Project (COURSERA) 

###Instructors: Roger D. Peng, Brian Caffo, Jeff Leek.
###Submitted by: Antony Samuel B 
####Date: Thursday, May 04, 2017	

The purpose of this assignment is to extract data from a source,
process it and present it as a tidy data set.

####About the Source Data

The data was obtained from experiments conducted by Jogre L. Reyes-Ortiz, et. al from the Smartlab - Non Linear Complex Systems Laboratory, DITEN - University of Genova.

The experiments were carried out on 30 subjects. The subjects were randomly classified as training or test subjects. Data from the acelerometer and gyroscope were collected when the subjects were performing 6 different activities.

*The activity list and their factor levels are provided in "activity_labels.txt"
*"y_train.txt" and "y_test.txt" contains the activity performed by the training and test subjects respectively.
*"X_train.txt" and "X_test.txt" contains the data collected from the sensors while different subjects were performing different activities. These data sets had different variables in each column.
*"subject_test.txt" and "subject_train.txt" identifies the subject whose data is stored in "X_train.txt" and "X_test.txt".
*"features.txt" contains the variable names of the data set that we obtain from "X_train.txt" and "X_test.txt".

####Data Processing

The data was obtained from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data processing methodology has been recorded in the 
"codeBook.txt". The script that was used to perform that same has 
been stored in "run_analysis.R".

The tidy data obtained after the data processing has been included 
in "tidyData.txt"

####Explanations

#####Reasoning behind choosing "mean()" and not "mean"

There are twenty more columns that would be included in this 
analysis if we had searched for "mean" instead of "mean()". A look 
at these twenty column's name throws up the "meanFreq()" and the 
"angle()" functions. Both of them are distinctly different from the 
mean function. Hence it is correct to filter for column names using 
"mean()" as the search keyword.

#####Is the data in "tidyData.txt" tidy?

The characteristics of tidy Data as summarised by  Jeff Leek in "The Elements of Data Analytic Style", Leanpub, 2015-03-02

1. Each variable you measure should be in one column.
2. Each different observation of that variable should be in a different row.
3. There should be one table for each “kind” of variable.
4. If you have multiple tables, they should include a column in the table that allows them to be linked.

By looking at the data in "tidyData.txt" we can see that it satisfies both conditions 1 and 2. The 3rd condition is subject to users opinion in this context. As each variable has one averaged value corresponding to each value of activity and subject, all the variables are clubbed together as being of the same kind. Hence only one table is required.