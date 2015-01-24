# Getting-and-Cleaning-Data-Course-Project
README.md
Course Project for "Getting and Cleaning Data"

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
he goal is to prepare tidy data that can be used for later analysis. 


This code book describes the project and the variables, data and transformation and scripts performed to create the tidy data set.
To perform the transformation, the run_analysis.R script is provided.
Assumption- you have downloaded and unzipped the data files into a directory on your system.
You are executing the script from within R in the directory where you have downloaded and unzipped the data.
the run_analysis.R script has a setwd(dataDIR) and a dataDIR variable which can be changed to match your local environment
The data files are available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Details of the source data can be found in README.txt file in the source data.

The run_analysis.R script performs the entire sequence of steps to create the tidy dataset from the experimental results.
Once complete, it will have written the resulting tidy datasets to the current directory.
the results will be:

	dtFinal- final tidy dataset containing only measures pertaining to mean or standard deviation, with appropriate column and activity labels
	dtSummary- final tidy dataset summarizes the result using the mean of each variable for each Subject/Activity pair

Here is what run_analysis.R does:

1) changes directory to where the data is located, assuming the toplevel is in your current directory
2) reads in the files into data tables or data frames, the following are the major ones:
	features- list of what was measured- there are 561 features
	feature_labels- list of labels to describe features, essentially a cleaned up version of features to make variable names acceptable to R
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

3) the script selects only the variables that are measuring mean or standard deviation of the features,  this selects 86 out of 561 features

4) the script merges the training and test data, then adds columns for subject and activity, along with appropriate column names
	the end result is a data table with 10299 rows and 88 columns.  this is a tidy dataset and is saved to a file called dtFinal.txt

5) groups the data table by subject and activity and produces a summary containing the 1 mean for each feature variable per Subject/Activity.
	the end result is saved to a a fule called dtSummary.txt
 

