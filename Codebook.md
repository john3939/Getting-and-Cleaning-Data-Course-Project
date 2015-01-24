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
	
Variables in the dtSummary.txt are listed below.  Each row represents the mean values for the variables 3-88 for one subject for 1 activity. 
```
 [1] "Subject" - numbered from 1 to 30                                
 [2] "Activity" -WALKING,WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
 They represent average or means from the original experimental data, normalized and therefore unitless.
 
 [3] "timeBodyAcc.mean...X"                   
 [4] "timeBodyAcc.mean...Y"                   
 [5] "timeBodyAcc.mean...Z"                   
 [6] "timeGravityAcc.mean...X"                
 [7] "timeGravityAcc.mean...Y"                
 [8] "timeGravityAcc.mean...Z"                
 [9] "timeBodyAccJerk.mean...X"               
[10] "timeBodyAccJerk.mean...Y"               
[11] "timeBodyAccJerk.mean...Z"               
[12] "timeBodyGyro.mean...X"                  
[13] "timeBodyGyro.mean...Y"                  
[14] "timeBodyGyro.mean...Z"                  
[15] "timeBodyGyroJerk.mean...X"              
[16] "timeBodyGyroJerk.mean...Y"              
[17] "timeBodyGyroJerk.mean...Z"              
[18] "timeBodyAccMag.mean.."                  
[19] "timeGravityAccMag.mean.."               
[20] "timeBodyAccJerkMag.mean.."              
[21] "timeBodyGyroMag.mean.."                 
[22] "timeBodyGyroJerkMag.mean.."             
[23] "frequencyBodyAcc.mean...X"              
[24] "frequencyBodyAcc.mean...Y"              
[25] "frequencyBodyAcc.mean...Z"              
[26] "frequencyBodyAcc.meanFreq...X"          
[27] "frequencyBodyAcc.meanFreq...Y"          
[28] "frequencyBodyAcc.meanFreq...Z"          
[29] "frequencyBodyAccJerk.mean...X"          
[30] "frequencyBodyAccJerk.mean...Y"          
[31] "frequencyBodyAccJerk.mean...Z"          
[32] "frequencyBodyAccJerk.meanFreq...X"      
[33] "frequencyBodyAccJerk.meanFreq...Y"      
[34] "frequencyBodyAccJerk.meanFreq...Z"      
[35] "frequencyBodyGyro.mean...X"             
[36] "frequencyBodyGyro.mean...Y"             
[37] "frequencyBodyGyro.mean...Z"             
[38] "frequencyBodyGyro.meanFreq...X"         
[39] "frequencyBodyGyro.meanFreq...Y"         
[40] "frequencyBodyGyro.meanFreq...Z"         
[41] "frequencyBodyAccMag.mean.."             
[42] "frequencyBodyAccMag.meanFreq.."         
[43] "frequencyBodyBodyAccJerkMag.mean.."     
[44] "frequencyBodyBodyAccJerkMag.meanFreq.." 
[45] "frequencyBodyBodyGyroMag.mean.."        
[46] "frequencyBodyBodyGyroMag.meanFreq.."    
[47] "frequencyBodyBodyGyroJerkMag.mean.."    
[48] "frequencyBodyBodyGyroJerkMag.meanFreq.."
[49] "angle.timeBodyAccMean.gravity."         
[50] "angle.timeBodyAccJerkMean..gravityMean."
[51] "angle.timeBodyGyroMean.gravityMean."    
[52] "angle.timeBodyGyroJerkMean.gravityMean."
[53] "angle.X.gravityMean."                   
[54] "angle.Y.gravityMean."                   
[55] "angle.Z.gravityMean."                   
[56] "timeBodyAcc.std...X"                    
[57] "timeBodyAcc.std...Y"                    
[58] "timeBodyAcc.std...Z"                    
[59] "timeGravityAcc.std...X"                 
[60] "timeGravityAcc.std...Y"                 
[61] "timeGravityAcc.std...Z"                 
[62] "timeBodyAccJerk.std...X"                
[63] "timeBodyAccJerk.std...Y"                
[64] "timeBodyAccJerk.std...Z"                
[65] "timeBodyGyro.std...X"                   
[66] "timeBodyGyro.std...Y"                   
[67] "timeBodyGyro.std...Z"                   
[68] "timeBodyGyroJerk.std...X"               
[69] "timeBodyGyroJerk.std...Y"               
[70] "timeBodyGyroJerk.std...Z"               
[71] "timeBodyAccMag.std.."                   
[72] "timeGravityAccMag.std.."                
[73] "timeBodyAccJerkMag.std.."               
[74] "timeBodyGyroMag.std.."                  
[75] "timeBodyGyroJerkMag.std.."              
[76] "frequencyBodyAcc.std...X"               
[77] "frequencyBodyAcc.std...Y"               
[78] "frequencyBodyAcc.std...Z"               
[79] "frequencyBodyAccJerk.std...X"           
[80] "frequencyBodyAccJerk.std...Y"           
[81] "frequencyBodyAccJerk.std...Z"           
[82] "frequencyBodyGyro.std...X"              
[83] "frequencyBodyGyro.std...Y"              
[84] "frequencyBodyGyro.std...Z"              
[85] "frequencyBodyAccMag.std.."              
[86] "frequencyBodyBodyAccJerkMag.std.."      
[87] "frequencyBodyBodyGyroMag.std.."         
[88] "frequencyBodyBodyGyroJerkMag.std.."  
```
