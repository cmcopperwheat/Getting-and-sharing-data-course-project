ReadMe
======

The script **run_analysis.R** implements the five tasks required for the 'Getting and Cleaning Data' course project. The source data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The five tasks are as follows:

1. Merge the training and the test datasets in the source file to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Name the activities in the data set, using descriptive activity names. 
4. Label the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

When the source data is unzipped a directory *UCI HAR Dataset* is created, with datafiles in subdirectories. The **run_analysis.R** script should be run from within the *UCI HAR Dataset* directory. 

The files produced by the script are *cleandata.txt* and *cleandata_averages.txt*. These are the products of tasks 4 and 5, respectively.