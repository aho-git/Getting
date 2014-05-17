Getting
=======

Getting and Cleaning Data

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Good luck!



##EXPLANATION OF SCRIPTS
####Part One
-Installs packages
-Reads in labels for each activity
-Reads in the features
-Filters the features to onyl take values with mean/std in name
-Reads in x_test data set then filters that out with the feature names in the variable created in the step above
-Y_test is read in and filetered as well
-Test subject is read in
-A ttest data set is formed combining all 3 data sets

####Part Two
-The subject of training data set is read in
-X_train is read in and filtered with the features variable to only have the ones with mean/std
-Y_train is read in as well
-Y_subject is read in
-Ttrain variable is created with all three

####Part Three
-A total dataframe is created combining ttest adn ttrain
-Data frame is given labels



####Part Four
-Tidy data set is created
-Melts the data by labelcode and subject
-Tidydata set is dcast to have the mean of all subjects calculated
=Tidydata set is written to hard drive to be hard-saved
