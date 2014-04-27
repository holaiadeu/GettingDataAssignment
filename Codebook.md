# Codebook.md

## Introduction

This document is part of the Peer Assessment project of the [Coursera](http://wwww.coursera.org/) course "Getting and Cleaning Data". 

It describes the tidy data set that is obtained when the `run_analysis.R` code is executed. It includes the description of the variables, the data and any transformations or work performed to clean up the original data.

## Data description

The data is produced from the "Human Activity Recognition Using Smartphones Dataset" (version 1.0) which was obtained by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto and is available at [UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Most of the data description of the data and its variables included in this codebook is obtained from the description files available when downloading the original data (a more detailed description of the original data can be found in the `README.txt` and `features_info.txt` files included in this downloadable data).

The original data is from the experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

Th obtained dataset were randomly partitioned into two sets, where 70% of the volunteeers was selected for generating a training data set and 30% a test data set.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 seconds and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record, the original raw data set includes:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular Velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

Features values were normalized and bounded wihtin [-1, 1] range.

### Data used

The aim of the project is to obtain a tidy data set from the original data set containing the measurements on the mean and standard deviation for each measure.

The original data set contains both the raw data obtained from the smartphones sensors (contained in the `Inertial Signals` folders of the `test` and `train` data) and the data obtained after applying the different filters and calculating all the measurements of the different features (which include mean, standard deviation, median, maximum, minimum,... among others).

For the purpose of the project, only the mean and the standard deviation variables have been taken into account.

## Variables description

The tidy data set produced by the `run_analysis.R` script contains 69 variables. The first three variables are described below:

1. **Subject_ID**: positive integer. Identifies the subject who carried out the experiment. 
* **Activity_ID**: positive integer (between 1 and 6). Identifies the activity type performed in each measurement.
* **Activity_label**: char (factor of 6 levels). Label corresponding to the Activity_ID of each measurement. It corresponds to one of these values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.

  The other 66 variables contain information about mean and the standard deviation the measurements. There exist 33 different measurements and for each of them there exist a variable corresponding to the mean and another one referring to the standard deviation (33 x 2=66 variables in total).
  
  These 33 variables come from the accelerometer and gyroscope 3-axial raw signals. Some of them were captured at a constant rate of 50Hz and were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20Hz to remove noise. There variables are coded with a prefix `Time_`.
  
  Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3Hz.
  
  Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.
  
  Finally a Fast Fourier Transform (FFT) was applied to some of these signals. The variables containing this information are identified with the prefix `Frequency_`
  to indicate frequency domain signals.
  
  Each of these variables contains normalised numeric data within the [-1,1] range.
  
  Taking all of this into account, the 66 variable names are shown by the concatenation of the following terms:
  
  * `Time_` or `Frequency_` to indicate time domain or frequency domain data.
  * `Body_` or `Gravity_` to indicate data referring to body or gravity.
  * `Accelerometer_` or `Gyroscope_` to indicate if the data was collected from the accelerometer or the gyroscope
  * `Jerk_`, `Magnitude_` or nothing in case it refers to Jerk data, a magnitude data or neither a Jerk nor magnitude data respectively.
  * `Mean_` or `StdDev_` to refer to mean or standard deviation data.
  * `X`, `Y`, `Z` or nothing if the data refers to a 3-axial data (X, Y or Z) or to a magnitude data respectively.
  
  The complete list of these 66 remaining variables is:

* **Time_Body_Accelerometer_Mean_X**
* **Time_Body_Accelerometer_Mean_Y**
* **Time_Body_Accelerometer_Mean_Z**
* **Time_Gravity_Accelerometer_Mean_X**
* **Time_Gravity_Accelerometer_Mean_Y**
* **Time_Gravity_Accelerometer_Mean_Z**
* **Time_Body_Accelerometer_Jerk_Mean_X**
* **Time_Body_Accelerometer_Jerk_Mean_Y**
* **Time_Body_Accelerometer_Jerk_Mean_Z**
* **Time_Body_Gyroscope_Mean_X**
* **Time_Body_Gyroscope_Mean_Y**
* **Time_Body_Gyroscope_Mean_Z**
* **Time_Body_Gyroscope_Jerk_Mean_X**
* **Time_Body_Gyroscope_Jerk_Mean_Y**
* **Time_Body_Gyroscope_Jerk_Mean_Z**
* **Time_Body_Accelerometer_Magnitude_Mean**
* **Time_Gravity_Accelerometer_Magnitude_Mean**
* **Time_Body_Accelerometer_Jerk_Magnitude_Mean**
* **Time_Body_Gyroscope_Magnitude_Mean**
* **Time_Body_Gyroscope_Jerk_Magnitude_Mean**
* **Frequency_Body_Accelerometer_Mean_X**
* **Frequency_Body_Accelerometer_Mean_Y**
* **Frequency_Body_Accelerometer_Mean_Z**
* **Frequency_Body_Accelerometer_Jerk_Mean_X**
* **Frequency_Body_Accelerometer_Jerk_Mean_Y**
* **Frequency_Body_Accelerometer_Jerk_Mean_Z**
* **Frequency_Body_Gyroscope_Mean_X**
* **Frequency_Body_Gyroscope_Mean_Y**
* **Frequency_Body_Gyroscope_Mean_Z**
* **Frequency_Body_Accelerometer_Magnitude_Mean**
* **Frequency_Body_Accelerometer_Jerk_Magnitude_Mean**
* **Frequency_Body_Gyroscope_Magnitude_Mean**
* **Frequency_Body_Gyroscope_Jerk_Magnitude_Mean**
* **Time_Body_Accelerometer_StdDev_X**
* **Time_Body_Accelerometer_StdDev_Y**
* **Time_Body_Accelerometer_StdDev_Z**
* **Time_Gravity_Accelerometer_StdDev_X**
* **Time_Gravity_Accelerometer_StdDev_Y**
* **Time_Gravity_Accelerometer_StdDev_Z**
* **Time_Body_Accelerometer_Jerk_StdDev_X**
* **Time_Body_Accelerometer_Jerk_StdDev_Y**
* **Time_Body_Accelerometer_Jerk_StdDev_Z**
* **Time_Body_Gyroscope_StdDev_X**
* **Time_Body_Gyroscope_StdDev_Y**
* **Time_Body_Gyroscope_StdDev_Z**
* **Time_Body_Gyroscope_Jerk_StdDev_X**
* **Time_Body_Gyroscope_Jerk_StdDev_Y**
* **Time_Body_Gyroscope_Jerk_StdDev_Z**
* **Time_Body_Accelerometer_Magnitude_StdDev**
* **Time_Gravity_Accelerometer_Magnitude_StdDev**
* **Time_Body_Accelerometer_Jerk_Magnitude_StdDev**
* **Time_Body_Gyroscope_Magnitude_StdDev**
* **Time_Body_Gyroscope_Jerk_Magnitude_StdDev**
* **Frequency_Body_Accelerometer_StdDev_X**
* **Frequency_Body_Accelerometer_StdDev_Y**
* **Frequency_Body_Accelerometer_StdDev_Z**
* **Frequency_Body_Accelerometer_Jerk_StdDev_X**
* **Frequency_Body_Accelerometer_Jerk_StdDev_Y**
* **Frequency_Body_Accelerometer_Jerk_StdDev_Z**
* **Frequency_Body_Gyroscope_StdDev_X**
* **Frequency_Body_Gyroscope_StdDev_Y**
* **Frequency_Body_Gyroscope_StdDev_Z**
* **Frequency_Body_Accelerometer_Magnitude_StdDev**
* **Frequency_Body_Accelerometer_Jerk_Magnitude_StdDev**
* **Frequency_Body_Gyroscope_Magnitude_StdDev**
* **Frequency_Body_Gyroscope_Jerk_Magnitude_StdDev**

## Steps performed to obtain the final data set

As it has been said, the raw data contained in the `Inertial Signals` folders has not been considered as the it has been assumed that the project was focused on the filtered data provided in other files.

First of all, the relevant data has been read using the `read.data()` function. The list of files that have been considered is:

* `features.txt`: Contains the codes of each measurement in the data files.
* `train/X.txt` and `test/X.txt`: Contain the data for each measurement.
* `train/Y.txt` and `test/Y.txt`: Contain the activity identifier of each measurement.
* `train/subject_train.txt` and `test/subject_test.txt`: Contain the subject identifier or each measurement.
* `activity_labels.txt`: Contains the activity names corresponding to each activity identifier.

The features corresponding to mean and standard deviation values have been identified and the test and train data have been unified in a single data set but only taking into account the mean and standard deviation features.

An additional variable column have been added to this data set corresponding to the activity name in each case. Both the activity identifier and the activity name columns have been kept in the data set.

The features names provided with the original data set are quite compact and not much self-explanatory. In order to make them more clear and self-explanatory, the variable names of the data set have been changed. In this point, it must be noted that some variable names appeared different between the `features.txt` file and the `features_info.txt` file (this file describes the meaning of each feature). More precisely, some of the features in the `features.txt` contained the term `BodyBody` which was not reported in the description file. These variables only matched with one variable described in `features_info.txt` if it was replaced by `Body` (and this replacement did not collide with any other existing name). For this reason, it has been assumed that the presence of the `BodyBody` term was a typographic error and it has been replaced by the `Body` term.

Finally, the final tidy data set (containing the mean of each feature grouped by subject and activity) have been obtained using the `numcolwise()` function within the  `ddply()` function from the `plyr` package. The use of the `numcolwise()` removes all non-numerical columns, so the activity labels column has been added again after that. The final `tidy_data_set.txt` file has been generated using the `write.table()` function.