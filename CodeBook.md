Summarized Data File for UCI HAR 
=============================

This codebook provides information on the information contained within the tidy_data.txt file that is found in this repository, and can subsequently be recreated using the R script run_analysis.R that is also included in this repository. The following sections provides information on the original study and datasets, and gives information on the structure and contents of the tidy_data.txt file.


<h1>Original Data Set Information:</h1>
<!--- <h2>UCI HAR study</h2> -->
The data file tidy_data.txt file is a condensed and aggregated version of the data made available from the UC Irvine 
Human Activity Recognition Using Smartphones study (UCI HAR). The following information on the 
Taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

In the original data, for each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

<ul>
<li>tBodyAcc-XYZ</li>
<li>tGravityAcc-XYZ</li>
<li>tBodyAccJerk-XYZ</li>
<li>tBodyGyro-XYZ</li>
<li>tBodyGyroJerk-XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc-XYZ</li>
<li>fBodyAccJerk-XYZ</li>
<li>fBodyGyro-XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
</ul>

<h1>tidy_data.txt Information:</h1>
The tidy_data.txt table contains 68 fields. The first two fields provide identifiers for the subject ID number, and a character string identifying the activity of the individual for the given entry. The remaining variables represent the variables described above.
All entries (rows) represent means over all observations for a given subject and activity. The variables included in this tidy data set are a subset of those included in the original (specifically, only those that are means and standard deviations of measurements for an observation.

The included variables in this table are as follows:
<ol>
<li>SUBJECT</li>
<li>ACTIVITY</li>
<li>tBodyAcc-mean()-X</li>
<li>tBodyAcc-mean()-Y</li>
<li>tBodyAcc-mean()-Z</li>
<li>tBodyAcc-std()-X</li>
<li>tBodyAcc-std()-Y</li>
<li>tBodyAcc-std()-Z</li>
<li>tGravityAcc-mean()-X</li>
<li>tGravityAcc-mean()-Y</li>
<li>tGravityAcc-mean()-Z</li>
<li>tGravityAcc-std()-X</li>
<li>tGravityAcc-std()-Y</li>
<li>tGravityAcc-std()-Z</li>
<li>tBodyAccJerk-mean()-X</li>
<li>tBodyAccJerk-mean()-Y</li>
<li>tBodyAccJerk-mean()-Z</li>
<li>tBodyAccJerk-std()-X</li>
<li>tBodyAccJerk-std()-Y</li>
<li>tBodyAccJerk-std()-Z</li>
<li>tBodyGyro-mean()-X</li>
<li>tBodyGyro-mean()-Y</li>
<li>tBodyGyro-mean()-Z</li>
<li>tBodyGyro-std()-X</li>
<li>tBodyGyro-std()-Y</li>
<li>tBodyGyro-std()-Z</li>
<li>tBodyGyroJerk-mean()-X</li>
<li>tBodyGyroJerk-mean()-Y</li>
<li>tBodyGyroJerk-mean()-Z</li>
<li>tBodyGyroJerk-std()-X</li>
<li>tBodyGyroJerk-std()-Y</li>
<li>tBodyGyroJerk-std()-Z</li>
<li>tBodyAccMag-mean()</li>
<li>tBodyAccMag-std()</li>
<li>tGravityAccMag-mean()</li>
<li>tGravityAccMag-std()</li>
<li>tBodyAccJerkMag-mean()</li>
<li>tBodyAccJerkMag-std()</li>
<li>tBodyGyroMag-mean()</li>
<li>tBodyGyroMag-std()</li>
<li>tBodyGyroJerkMag-mean()</li>
<li>tBodyGyroJerkMag-std()</li>
<li>fBodyAcc-mean()-X</li>
<li>fBodyAcc-mean()-Y</li>
<li>fBodyAcc-mean()-Z</li>
<li>fBodyAcc-std()-X</li>
<li>fBodyAcc-std()-Y</li>
<li>fBodyAcc-std()-Z</li>
<li>fBodyAccJerk-mean()-X</li>
<li>fBodyAccJerk-mean()-Y</li>
<li>fBodyAccJerk-mean()-Z</li>
<li>fBodyAccJerk-std()-X</li>
<li>fBodyAccJerk-std()-Y</li>
<li>fBodyAccJerk-std()-Z</li>
<li>fBodyGyro-mean()-X</li>
<li>fBodyGyro-mean()-Y</li>
<li>fBodyGyro-mean()-Z</li>
<li>fBodyGyro-std()-X</li>
<li>fBodyGyro-std()-Y</li>
<li>fBodyGyro-std()-Z</li>
<li>fBodyAccMag-mean()</li>
<li>fBodyAccMag-std()</li>
<li>fBodyBodyAccJerkMag-mean()</li>
<li>fBodyBodyAccJerkMag-std()</li>
<li>fBodyBodyGyroMag-mean()</li>
<li>fBodyBodyGyroMag-std()</li>
<li>fBodyBodyGyroJerkMag-mean()</li>
<li>fBodyBodyGyroJerkMag-std()</li>
</ol>
