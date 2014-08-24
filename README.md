Getting-Cleaning-Data-Project
=============================

Git repository associated with Course project for the Coursera Getting &amp; Creating Data Class

This repository shares the files required for completion of the Coursera Getting & Cleaning Data course project. Contained within this repository are: 

<ol>
<li>This README.md file, which outlines the contents of the repository and its purpose</li>
<li> A code book (CodeBook.md) that describes the variables, the data, and the work performed on the data </li>
<li> The R script: run_anlysis.R, which executes the operations required for the Coursera Getting & Cleaning Data course project </li>
</ol>
Specifically, run_analysis.R does the following:

<ul>
<li>Loads a variety of data sets collected from the UCI HAR study (information at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
Data can be downloaded here (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Data should be extracted into the working directory;</li>
<li>Combines observations from training and testing data sets into single data frames;</li>
<li>Distills observational data, keeping only values that are measures of means or standard deviation;</li> 
<li>Merges factor variables to the distilled observational data, specifying the activity being performed (ACTIVITY) and the subject of the observation (SUBJECT). The ACTIVITY variable is converted to a descriptive character (using supplied file activity_labels.txt);</li> 
<li>Creates and exports a tidy data set, containing the mean of each variable across all observations
for each subject and activity combination.</li> 
</ul>
