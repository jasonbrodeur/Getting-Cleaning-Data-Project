# run_analysis.R
# This script executes the operations required for the Coursera Getting & Cleaning Data course project
# Specifically, it does the following:
# 1. Loads a variety of data sets collected from the UCI HAR study 
# information at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Data can be downloaded here (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
# Data should be extracted into the working directory
# 2. Combines observations from training and testing data sets into single data frames.
# 3. Distills observational data, keeping only values that are measures of means or standard deviation 
# 4. Merges factor variables to the distilled observational data, specifying the 
# activity being performed (ACTIVITY) and the subject of the observation (SUBJECT)
# The ACTIVITY variable is converted to a descriptive character (using supplied file activity_labels.txt)
# 5. Creates and exports a tidy data set, containing the mean of each variable across all observations
# for each subject and activity combination.
# Created 21-Aug-2014 by JJB; 
# Modified 24-Aug-2014 by JJB to improve commenting 

## Load libraries
library(reshape2)
library(plyr)

########### Load the "test" dataset #####################
### Load xtest data
# xtest data; for all 2497 obs, 561 different variables have been collected 
# variables (column values) are listed in features.txt - they are all variables collected (summarized)
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")

### Load ytest data
# ytest data; for all 2947 obs, values indicate which of the six actitivites are taking place in the observation 
# See activity_labels.txt for labels
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")

### Load subject_test data
# subject_test: column of values that indicate which subject is being observed 
# (total 30 subjects in study, 9 used in test; each with ~300-400 obs of 561 vars)
subj_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")

########### Load the "training" dataset #####################
### See descriptions above for more information on files 
# Training set has 7352 obs.
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
subj_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

########### Load the features and activity_labels files #####
# features.txt contains variable names (561 in total)
feat<-read.table("./UCI HAR Dataset/features.txt")

# activity_labels.txt contain activity labels listed below for convenience: 
# 1 WALKING; 2 WALKING_UPSTAIRS; 3 WALKING_DOWNSTAIRS; 4 SITTING; 5 STANDING; 6 LAYING
act<-read.table("./UCI HAR Dataset/activity_labels.txt") # activity labels

############### Combine train and test sets #################
# Combine the test and train sets together for each data type using rbind
x_all <- rbind(xtest,xtrain)
y_all <- rbind(ytest,ytrain)
subj_all <- rbind(subj_test,subj_train)
# Remove files that are no longer needed:
rm(xtest,xtrain,ytest,ytrain,subj_test, subj_train)

############### Distill x_all to keep only mean and std variables #################

# Use an index to identify the columns to keep in x_all (contain "mean()" or "std()" in partial string)
# use grep on feat$V2 
ind_mean<-grep("mean()",as.character(feat$V2),fixed=TRUE)
ind_std <-grep("std()",as.character(feat$V2),fixed=TRUE)
# Put the two indexes together and sort
ind_all<-sort(rbind(ind_mean,ind_std))
# Distill the x_all data according to index:
x_all<-x_all[,ind_all]

############## Creata an activity character vector #################
## Make a character vector that lists the activity for each observation, 
## using the value in y_all and the corresponding activity in act:
act_char<-character(length=nrow(y_all))
for(i in 1:nrow(act)){
      ind<-which(y_all==i)
      act_char[ind]<- as.character(act$V2[i])
}
    
############# Combine data to a single data frame #############
### Make the data into a single, data frame by using cbind
# Data will be structured to have subject ID as first column, activity as second, and then all variables
data_all<-cbind(subj_all,act_char,x_all)
# Assign names to the data frame columns
names(data_all)<-c("SUBJECT","ACTIVITY",as.character(feat$V2[ind_all]))
# Remove files that are no longer needed
rm(subj_all,act_char,x_all)

############# Create a tidy data set ##########################
# Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
# Melt the data_all data frame to create separate entries for all observations:
tmelt<-melt(data_all,id=c("SUBJECT","ACTIVITY"))
## Use the ddply function to take the mean of each variable for each combination of subject and activity:
data_sums<-ddply(tmelt, .(SUBJECT,ACTIVITY,variable), summarise, mean = mean(value))
## Use dcast to recast the data into an organized table, with one row for each subject x activity combination
## (variable sums will be shown in successive columns)
tidy_data<-dcast(data_sums, SUBJECT + ACTIVITY ~ variable, value.var="mean")
## Export the final tidy table:
write.table(tidy_data,"./tidy_data.txt",row.names=FALSE)
