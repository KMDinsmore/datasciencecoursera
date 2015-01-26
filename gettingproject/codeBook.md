---
title: "Project_Code_Book"
author: "KMDINSMORE"
date: "Sunday, January 25, 2015"
output: html_document
---
#Getting and Cleaning Data Project:
##UCI HAR Dataset Analysis


This is the code book for an analysis of the UCI HAR Dataset.

The rows represent the data is broken down by anonymous subjects identified by number and their activities identified by name (e.g.  "WALKING").

Each column represents a mean of the values for the row.  In the key I have maintained the awkward usage "Mean of Mean of" and "Mean of Standard Deviation of" for accuracy of terms.  I have also preserved the names (e.g. "fBodyGyro-std()-Z" ) as it seemed sufficient for the original researchers.  Please forgive me, if it makes for difficult reading. 

<i>Example: Row 1, Column 1 is the mean of means of bodily acceleration along the X axis</i>

## Column Headings Key

Mean of bodily accelerometer reading along indicated axis (X,Y,Z)
BodyAcc-mean-X
BodyAcc-mean-Y
BodyAcc-mean-Z

Standard deviation of bodily accelerometer reading along indicated axis
BodyAcc-std-X
BodyAcc-std-Y
BodyAcc-std-Z

Mean of of gravitational accelerometer reading along indicated axis
GravityAcc-mean-X
GravityAcc-mean-Y
GravityAcc-mean-Z

Standard deviation of gravitational accelerometer reading along indicated axis
GravityAcc-std-X
GravityAcc-std-Y
GravityAcc-std-Z

Mean of bodily accelerometer jerk along indicated access
BodyAccJerk-mean-X
BodyAccJerk-mean-Y
BodyAccJerk-mean-Z

Standard deviation of bodily accelerometer jerk along indicated access
BodyAccJerk-std-X
BodyAccJerk-std-Y
BodyAccJerk-std-Z

Mean of bodily gyroscope reading along indicated axis 
BodyGyro-mean-X
BodyGyro-mean-Y
BodyGyro-mean-Z

Standard deviation of bodily accelerometer reading along indicated axis 
BodyGyro-std-X
BodyGyro-std-Y
BodyGyro-std-Z

Mean of bodily accelerometer jerk reading along indicated axis 
BodyGyroJerk-mean-X
BodyGyroJerk-mean-Y
BodyGyroJerk-mean-Z

Standard deviation of bodily accelerometer jerk reading along indicated axis
BodyGyroJerk-std-X
BodyGyroJerk-std-Y
BodyGyroJerk-std-Z

Mean of accelerometer magnitude reading
BodyAccMag-mean

Standard deviation of accelerometer magnitude reading
BodyAccMag-std

Mean of graviational accelerometer magnitude reading
GravityAccMag-mean

Standard deviation of graviational accelerometer magnitude reading
GravityAccMag-std

Mean of bodily accelerometer jerk magnitude reading
BodyAccJerkMag-mean

Standard deviation of bodily accelerometer jerk magnitude reading
BodyAccJerkMag-std

Mean of gyroscopic magnitude reading
BodyGyroMag-mean

Standard deviation of gyroscopic magnitude reading
BodyGyroMag-std

Mean of gyroscopic jerk magnitude reading
BodyGyroJerkMag-mean

Standard deviation of gyroscopic jerk magnitude reading
BodyGyroJerkMag-std
##  These values then repeat with variation.  They are the same as above, but different observations, I have removed first character for ease of reading
BodyAcc-mean-X
BodyAcc-mean-Y
BodyAcc-mean-Z
BodyAcc-std-X
BodyAcc-std-Y
BodyAcc-std-Z
BodyAcc-meanFreq-X
BodyAcc-meanFreq-Y
BodyAcc-meanFreq-Z
BodyAccJerk-mean-X
BodyAccJerk-mean-Y
BodyAccJerk-mean-Z
BodyAccJerk-std-X
BodyAccJerk-std-Y
BodyAccJerk-std-Z
BodyAccJerk-meanFreq-X
BodyAccJerk-meanFreq-Y
BodyAccJerk-meanFreq-Z
BodyGyro-mean-X
BodyGyro-mean-Y
BodyGyro-mean-Z
BodyGyro-std-X
BodyGyro-std-Y
BodyGyro-std-Z
BodyGyro-meanFreq-X
BodyGyro-meanFreq-Y
BodyGyro-meanFreq-Z
BodyAccMag-mean
BodyAccMag-std
BodyAccMag-meanFreq
BodyBodyAccJerkMag-mean
BodyBodyAccJerkMag-std
BodyBodyAccJerkMag-meanFreq
BodyBodyGyroMag-mean
BodyBodyGyroMag-std
BodyBodyGyroMag-meanFreq
BodyBodyGyroJerkMag-mean
BodyBodyGyroJerkMag-std
BodyBodyGyroJerkMag-meanFreq
