---
title: "CodeBook.md"
author: "Hugo Andre Silva"
date: "23 Nov 2014"
output: html_document
---

## Background

This is a data analysis done for the Course Project of Coursera's "Getting and Cleaning Data"
course from Johns Hopkins Bloomberg School of Public Health, part of this University's
Data Science Specialization.

The goal is to transform sets of raw data into a tidy data set containing the mean on a 
variety of measurements collected for a particular subject performing an activity

## Raw data

The raw data is collected from a study on wearable computing [1] where several measurements
were collected using the accelerometers from the Samsung Galaxy S smartphone on 30 volunteers
performing 6 different activities: Walking, Walking Upstairs, Walking Downstairs, Sitting,
Standing and Laying.
The data was split into 2 data sets: training (containing 70% of the volunteers) and
test (containing 30% of the volunteers). Each of these sets contained 3 files:
1 - One file with the volunteer code for each measurement
2 - One file with with the measurements on each of the features selected (feature detail below)
3 - One file with with the activity code for each measurement

### Features
There are 561 features in the raw data coming from from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## Processed data

The goals for this project were to create a script that does the following:
1 - Merges the training and test sets to create one data set.
2 - Extracts only the measurements on the mean and standard deviation for each measurement
3 - Uses descriptive names to name the activities in the data set
4 - Appropriately labels the data set with descriptive variable names
5 - From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject.

Hence, to achieve the tidy data set as requested, the following transformations were done:
1 - The test and training data sets were merged as all data from both those sets was
relevant for this project
2 - Out of the 561 features in the files, only the features with the substrings "mean()" or
"std()" were considered (61 features in total). There are some features with mean in its name
like "meanFreq()" which one can argue should be part of this final set. My interpretation was
that only "direct" means or standard deviations were part of the consideration and according
to the discussion forums and the staff replies this is an acceptable interpretation.
3 - The activity codes were replaced in the data set by the actual activity description
as per the activity_labels file present with the data set (eg. replace "1" for "WALKING")
4 - The feature names were added from the file with all the feature descriptions and slightly
modified in order to make them more descriptive: the parenthesis were remove and the initial
"t" or "f" were replace by "time" and "frequency" respectively. The word "mean" was also added
at the end to make clear these variables are means of either other means or standard deviations
5 - The resulting data set was summarized, with one row for each Subject/Activity combination
and the mean values for each of the 66 features selected for that unique Subject/Activity
combination

## Data Dictionary

Subject                             2
    Volunteer identifier
                    1..30               .Unique identifier of the volunteer
                                        .performing the activity
                            
Activity                            18
    Activity done by the valunteer during measurement collection
                    WALKING             .Volunteer was walking
                    WALKING_UPSTAIRS    .Volunteer was walking upstairs
                    WALKING_DOWNSTAIRS  .Volunteer was walking downstairs
                    SITTING             .Volunteer was sitting
                    STANDING            .Volunteer was standing
                    LAYING              .Volunteer was laying
                    
timeBodyAcc-mean-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAcc-mean-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAcc-mean-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeGravityAcc-mean-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeGravityAcc-mean-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeGravityAcc-mean-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccJerk-mean-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccJerk-mean-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccJerk-mean-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyro-mean-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyro-mean-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyro-mean-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroJerk-mean-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroJerk-mean-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroJerk-mean-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeGravityAccMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccJerkMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroJerkMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAcc-mean-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAcc-mean-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAcc-mean-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAccJerk-mean-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAccJerk-mean-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAccJerk-mean-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyGyro-mean-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyGyro-mean-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyGyro-mean-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAccMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyBodyAccJerkMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyBodyGyroMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyBodyGyroJerkMag-mean-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAcc-std-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAcc-std-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAcc-std-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeGravityAcc-std-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeGravityAcc-std-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeGravityAcc-std-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccJerk-std-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccJerk-std-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccJerk-std-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyro-std-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyro-std-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyro-std-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroJerk-std-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroJerk-std-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroJerk-std-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeGravityAccMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyAccJerkMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
timeBodyGyroJerkMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAcc-std-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAcc-std-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAcc-std-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAccJerk-std-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAccJerk-std-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAccJerk-std-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyGyro-std-X-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyGyro-std-Y-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyGyro-std-Z-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyAccMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyBodyAccJerkMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyBodyGyroMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination
                                        
frequencyBodyBodyGyroJerkMag-std-mean
    Mean of feature
                    -1..1               .Mean of feature for give subject and
                                        .activity combination                                        
                    

============
## Citations:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

