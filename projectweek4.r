##Downloading the zipfiles and extracting the .zip files
#download the .zip file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile="C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\Dataset.zip")

#extract the files

unzip(zipfile = "C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\Dataset.zip")


##Read .txt files into R
#readme files identifies which files should be used in dataset

activitytest  <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\test\\Y_test.txt",header = FALSE)
activitytrain  <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\train\\Y_train.txt",header = FALSE)
subjecttrain <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\train\\subject_train.txt",header = FALSE)
subjecttest <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\test\\subject_test.txt",header = FALSE)
featurestest  <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\test\\x_test.txt",header = FALSE)
featurestrain  <- read.table("C:\\Users\\Anthony\\Documents\\Data Science Course\\Course3\\data\\data\\UCI HAR Dataset\\train\\x_train.txt",header = FALSE)

