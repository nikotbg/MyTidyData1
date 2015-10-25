
#After the "UCI HAR Dataset" is downloaded and assigned as working directory, 
#all necessary file are read into R

traindata<-read.table("./train/X_train.txt")
trainlabel<-read.table("./train/y_train.txt")
trainsubject<-read.table("./train/subject_train.txt")

testdata<-read.table("./test/X_test.txt")
testlabel<-read.table("./test/y_test.txt")
testsubject<-read.table("./test/subject_test.txt")

features<-read.table("features.txt")

#Before continuing, run the dim() function for all of the 6 datasets to understand how thy fit together
#Rename the columns for activity and subject tables

colnames(trainlabel)<-"activity"
colnames(testlabel)<-"activity"
colnames(trainsubject)<-"subject"
colnames(testsubject)<-"subject"

#Manipulating/filtering the features table to get only the 'mean' and 'std' for the different measurements
#'meanFreq' intentionally left in the dataset as being a measurement of group of other measurements

features1<-features[grep("mean",features$V2),] 
features2<-features[grep("std",features$V2),] 
features3<-rbind(features1,features2) 
features3<-arrange(features3,V1)
features3_vector<-features3$V1 

#Merging 'train' and 'test' datasets. ('train' on top).

merged<-rbind(traindata,testdata)

#Renaming the columns in 'merged' using the measurement names from 'features'

features_vector<-features[,2]
colnames(merged)<-features_vector

#Extract the measurements on the mean and standard deviation from 'merged'

merged1<-merged[,features3_vector]

#Merge the 'subject' and 'activity' data for 'train' and 'test' ('train' on top)

trainSA<-cbind(trainsubject,trainlabel)
testSA<-cbind(testsubject,testlabel)
traintestSA<-rbind(trainSA,testSA)

#Double check the length with dim() function and also that 'train' data is on top of test data 
#Merge the subject/activity dataset 'traintestSA' with the measurements dataset 'merged1'

merged2<-cbind(traintestSA,merged1)

#labeling the activity column values with corresponding activity names from 'activity_labels' tabel

activityl<-read.table("activity_labels.txt")
merged2$activity<-activityl$V2[merged2$activity]

#Loading dplyr package

library(dplyr)

#Calculating the average for each measurement per activity type and per subject

merged3<-merged2%>%
    group_by(subject,activity)%>%
    summarise_each(funs(mean))


