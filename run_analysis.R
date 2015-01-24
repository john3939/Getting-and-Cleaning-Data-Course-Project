#run.analysis.R
#script to complete Course project for Getting and Cleaning Data
#
# bring in required packages

library(data.table)
library(dplyr)


#get data into 1 data table
# Assumption- your data are in the current directory
# you may change the dataDIR variable to match your environment
#  for linux/macos= use forward slashes "/"

dataDIR="UCI HAR Dataset"

setwd(dataDIR)
# get list of measures and labels for the activities
features=readLines("features.txt")
act_labels=read.table("activity_labels.txt")

#get test data
setwd("test")
x_test=read.table("X_test.txt")
y_test=read.table("Y_test.txt")
subject_test=read.table("subject_test.txt")

#get training data
setwd("..")
setwd("train")
y_train=read.table("Y_train.txt")
x_train=read.table("X_train.txt")
subject_train=read.table("subject_train.txt")

# combine into 1 dataset

x_test=as.data.table(x_test)
y_test=as.data.table(y_test)
x_train=as.data.table(x_train)
y_train=as.data.table(y_train)
dt = rbind(x_train, x_test)

# add columns for Subject and Activity
subject_test=as.data.table(subject_test)
subject_train=as.data.table(subject_train)
Subject =  rbind(subject_train, subject_test)
Activity = rbind(y_train, y_test)


# Convert Activity numbers to Descriptions, but first add column label so mutate works
setnames(Activity, names(Activity), "Activity")
Activity_labels=mutate(Activity,Activity=factor(Activity,labels=act_labels[,2]))

# add column names for data to make them R compliant and more readable
feature_labels= make.names(features)
feature_labels=gsub("^X[0-9][0-9]*.","",feature_labels)
feature_labels=gsub("tBody","timeBody",feature_labels)
feature_labels=gsub("tGravity","timeGravity",feature_labels)
feature_labels=gsub("fBody","frequencyBody",feature_labels)

setnames(dt, names(dt), feature_labels)
setnames(Subject, names(Subject), "Subject")


#select only measures with Mean or std

dtMean=select(dt,contains("Mean",ignore.case=TRUE))
dtstd=select(dt,contains("std"))

dtFinal=cbind(dtMean,dtstd)

#merge the subject and activity columns with the data (dtFinal)

dtFinal=cbind(Subject,Activity_labels, dtFinal)


# group by Subject and Activity and summarise (take the mean)
dtFinal = arrange(dtFinal,Subject)
dtGroup = group_by(dtFinal,Subject,Activity)
dtSummary = summarise_each(dtGroup,funs(mean))

# return to the top level directory above our dataset to write the final datasets
# use 2 steps to avoid having to decide if we are single forward slash or double backslash
setwd("..")
setwd("..")

#write out the dataset
write.table(dtSummary,file="dtSummary.txt", row.name=F)
write.table(dtFinal,file="dtFinal.txt", row.name=F)
print("Tidy dataset with data on mean and std is in dtFinal.txt")
print("Tidy dataset containing summarized means for each subject by activity is in dtSummary.txt")

# end

