## Downloading the zipfiles and extracting the .zip files
# download the .zip file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile="C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\Dataset.zip")

# extract the files

unzip(zipfile = "C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\Dataset.zip")


## Read .txt files into R
# readme files identifies which files should be used in dataset

activitytest  <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\test\\Y_test.txt",header = FALSE)
activitytrain  <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\train\\Y_train.txt",header = FALSE)
subjecttrain <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\train\\subject_train.txt",header = FALSE)
subjecttest <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\test\\subject_test.txt",header = FALSE)
featurestest  <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\test\\x_test.txt",header = FALSE)
featurestrain  <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\train\\x_train.txt",header = FALSE)

## Merge data into one data set
# rbind the data

subject <- rbind(subjecttrain, subjecttest)
activity <- rbind(activitytrain, activitytest)
features<- rbind(featurestrain, featurestest)

# Set names

names(subject)<-c("subject")
names(activity)<- c("activity")
featuresnames <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\features.txt",header = FALSE)
names(features)<- featuresnames$V2

# Combine into data frame

## Extracts only the measurements on the mean and standard deviation for each measurement.

# Subset data

sub_featuresnames <- featuresnames$V2[grep("mean\\(\\)|std\\(\\)", featuresnames$V2)]
selectednames<-c(as.character(sub_featuresnames), "subject", "activity" )
data <- subset(DF,select=selectednames)


## Use descriptive names
# apply names from activity labels

activitylabels <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\activity_labels.txt", header = FALSE)

# Change activity descriptions taken from activity_labels.txt

data$activity[data$activity %in% "1"] <- "WALKING"
data$activity[data$activity %in% "2"] <- "WALKING UP STAIRS"
data$activity[data$activity %in% "3"] <- "WALKING DOWN STAIRS"
data$activity[data$activity %in% "4"] <- "SITTING"
data$activity[data$activity %in% "5"] <- "STANDING"
data$activity[data$activity %in% "6"] <- "LAYING DOWN"

## Label the data set with variable names

names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

## Reorder and write to tidydata.txt

library(plyr) #will need to install if not already complete
tidydata<-aggregate(. ~subject + activity, data, mean)
tidydata<-tidydata[order(Data2$subject,Data2$activity),]
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)


