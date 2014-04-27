# All relevant data files are read
# Working directory assumed to contain 2 folders with 'test' and 'train' data
data_features = read.table("features.txt")
data_train_X = read.table("train/X_train.txt")
data_train_Y = read.table("train/y_train.txt")
data_subject_train = read.table("train/subject_train.txt")
data_test_X = read.table("test/X_test.txt")
data_test_Y = read.table("test/y_test.txt")
data_subject_test = read.table("test/subject_test.txt")
data_activity_labels = read.table("activity_labels.txt")

# Mean and standard deviation selection among all variables
mean_cols = grep("mean\\(\\)", data_features[,2], perl=T, value=F)
std_cols = grep("std\\(\\)", data_features[,2], perl=T, value=F)
cols = union(mean_cols,std_cols)

# Train and test data is unified in an unique data set
data_X = rbind(data_train_X[,cols], data_test_X[,cols])
data_Y = rbind(data_train_Y, data_test_Y)
data_subject = rbind(data_subject_train, data_subject_test)

# Activity labels are obtained for each activity index
data_activities = data_activity_labels[data_Y[,1],2]

# Data with the desired information is obtained
data = data.frame(data_subject, data_Y, data_activities, data_X)

# Variable names are made more self-descriptive
data_measures = as.character(data_features[cols,2])

old = c("^t", "^f", "BodyBody", "Body", "Gravity", "Acc", "Gyro", "Jerk", "Mag",
        "-mean\\(\\)", "-std\\(\\)", "-X", "-Y", "-Z")
new = c("Time_", "Frequency_", "Body", "Body_", "Gravity_", "Accelerometer_", 
        "Gyroscope_", "Jerk_", "Magnitude_", "Mean", "StdDev", "_X", "_Y", "_Z")

for (i in seq_along(old)){
    data_measures = gsub(old[i],new[i], data_measures)
}

names(data) = c("Subject_ID", "Activity_ID", "Activity_label", data_measures)

# Final tidy_data_set.txt file is generated after grouping data using the ddply ...
# function from plyr package
library(plyr)
tidy_data_set = ddply(data,.(Subject_ID, Activity_ID),numcolwise(mean))
tidy_data_set = data.frame(tidy_data_set[,1:2], 
                           Activity_label=data_activity_labels[tidy_data_set$Activity_ID,2], 
                           tidy_data_set[,-(1:2)])
write.table(tidy_data_set,"tidy_data_set.txt")
