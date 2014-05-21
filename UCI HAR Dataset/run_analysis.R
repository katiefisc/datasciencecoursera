## Make sure to load this libraries
library(data.table)
library(plyr)

##Inital preperation
##Download the zipped file from here:
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##unzip the data and save it to a directory
##set working directory to the new directory you have created containing the UCI HAR Dataset
##load the various files into R

test_x_test <- read.table("./test/X_test.txt", 
                          fill=FALSE, 
                          strip.white=TRUE)

test_y_test <- read.table("./test/Y_test.txt", 
                          sep="\t", 
                          fill=FALSE, 
                          strip.white=TRUE)

test_subject_test <- read.table("./test/subject_test.txt", 
                                sep="\t", 
                                fill=FALSE, 
                                strip.white=TRUE)

train_x_train <- read.table("./train/X_train.txt", 
                            fill=FALSE, 
                            strip.white=TRUE)

train_y_train <- read.table("./train/Y_train.txt", 
                            sep="\t", 
                            fill=FALSE, 
                            strip.white=TRUE)

train_subject_train <- read.table("./train/subject_train.txt", 
                                  sep="\t", 
                                  fill=FALSE, 
                                  strip.white=TRUE)

features <- read.table("./features.txt",stringsAsFactors =FALSE, header=FALSE, sep="")


#Part 1 - Merging the training and test data to create one data set

test_data<-cbind(test_subject_test,test_y_test,test_x_test)
train_data<-cbind(train_subject_train,train_y_train,train_x_train)
data<-rbind(test_data,train_data)

# assign names to the columns in the new merged data set
names(data)[1]<-"Subject"
names(data)[2]<-"Activities"
names(data)[3:563]<-features[,2]

# Extracts only the measurements on the mean and standard deviation for each measurement. 

Mean_Cols<-grep("mean()", features[,2], fixed=TRUE)
STD_Cols<-grep("std()", features[,2], fixed=TRUE)


#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive activity names. 
activity_labels <- read.table("./activity_labels.txt",stringsAsFactors =FALSE, header=FALSE, sep="")
for (i in 1:6){
        data$Activities[data$Activities ==i] <- activity_labels[i,2]}

##Creates a second, independent tidy data set with the average of 
##each variable for each activity and each subject. 

data_subset<-c(-1, 0, Mean_Cols, STD_Cols)
data_set<-data[,data_subset+2]

write.table(data_set, "./tinydata.txt)
