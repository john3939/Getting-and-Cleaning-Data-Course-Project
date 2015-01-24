Code Book
Getting and Cleaning Data
Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
he goal is to prepare tidy data that can be used for later analysis. 

This code book describes the project and the variables, data and transformation and scripts performed to create the
tidy data set.

One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data linked to below represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Details of the source data can be found in README.txt file in the source data.
from the README:

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
	Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
	wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
	we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments
	have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned
	into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled
	in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,
	which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body
	acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a
	filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating
	variables from the time and frequency domain. See 'features_info.txt' for more details. 


The run_analysis.R script performs the entire sequence of steps to create the tidy dataset from the experimental results.
Assumption- you have downloaded and unzipped the data files into a directory on your system

Here is what run_analysis.R does:

1) changes directory to where the data is located, assuming the toplevel is in your current directory
2) reads in the files into data tables or data frames, the following are the major ones:
	features- list of what was measured- there are 561 features
	feature_labels- list of labels to describe features, essentially a cleaned up version of features to make
	variable names acceptable to R
	act_labels- mapping of activity number- eg seq(1:6) to activity description:
		WALKING,WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

	X_test- test results
	Y_test- Activity being performed when the measure was taken
	subject_test- Subject performing the Activity

	X_train- training results (baseline measures)
	Y_train- Activity being performed when the measure was taken
	subject_train- Subject performing the Activity

	dt, dtMean, dtstd- intermediate data tables

	dtFinal- final tidy dataset containing only measures pertaining to mean or standard deviation, with appropriate column and activity labels
	dtSummary- final tidy dataset summarizes the result using the mean of each variable for each Subject/Activity pair

3) the script selects the variables that are measuring mean or standard deviation of the features,  this selects 86 out of 561 features

4) the script merges the training and test data, then adds columns for subject and activity, along with appropriate column names
	the end result is a data table with 10299 rows and 88 columns.  this is a tidy dataset and is saved to a file called dtFinal.txt

5) groups the data table by subject and activity and produces a summary containing the 1 mean for each feature variable per Subject/Activity.
	the end result is saved to a a file called dtSummary.txt

