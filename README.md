# Getting-and-Cleaning-Data-Course-Project
## README.md
## Course Project for "Getting and Cleaning Data"

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.
he goal is to prepare tidy data that can be used for later analysis. 
The data is available for download at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Details of the source data can be found in README.txt file in the source data.

To perform the transformation, the run_analysis.R script is provided.

* copy the run_analysis.R script to your current directory
* Download and extract the data from the above URL into the current directory
* Run R and execute:
	source("run_analysis.R") 
	
* Required libraries are data.table and dplyr, make sure you have those packages installed prior to running the script.
	
It will store the result into 2 files:
* dtFinal- final tidy dataset containing only measures pertaining to mean or standard deviation, with appropriate column and activity labels
* dtSummary- final tidy dataset summarizes the result using the mean of each variable for each Subject/Activity pair

The run_analysis.R script performs the entire sequence of steps to create the tidy dataset from the experimental results.
Here is what run_analysis.R does:

* changes directory to where the data is located, assuming the the data is extracted in your current directory
* reads in the files into data tables or data frames, the following are the major ones:
```
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
```

* the script selects only the variables that are measuring mean or standard deviation of the features,  this selects 86 out of 561 features

* the script merges the training and test data, then adds columns for subject and activity, along with appropriate column names.  The end result is a data table with 10299 rows and 88 columns.  This is a tidy dataset and is saved to a file called dtFinal.txt

* groups the data table by subject and activity and produces a summary containing the 1 mean for each feature variable per Subject/Activity.  The end result is saved to a a file called dtSummary.txt
 

