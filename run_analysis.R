#Install packages
install.packages ("data.table")
install.packages ("stringr")

###PART ONE
#This is the labels for each activity
labels<-read.table("./UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",  col.names=c("labelcode", "label"))

#getting the features
features<-read.table("./UCI HAR Dataset/UCI HAR Dataset/features.txt")

#filtering the features
filter_features<-grep("mean\\(|std\\(", features[, 2]) #tAKES ONLY VALUES WITH MEAN OR STD AS INSTRUCTGED

#READING IN The X_TEST DATASET
xtest<-read.table("./UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", col.names = features[,2], check.names=FALSE)
xtest<-xtest[, filter_features]

#READING IN Y_TEST AND SUBJECT_TEST
testlabel<-read.table("./UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", col.names="labelcode")

testsubject<-read.table("./UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
#BINDING ALL 3 DATASETS TOGETHER
ttest<-cbind(testlabel, testsubject, xtest)


####PART TWO
#Reading in all the data for training
trainsubject<-read.table("./UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names="subject")

xtrain<-read.table("./UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",col.names=features[,2], check.names=FALSE)
xtrain<-xtrain[, filter_features] #Only want features that have mean/sd

trainlabel<-read.table("./UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", col.names="labelcode")

trainsubject<-read.table("./UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", col.names="subject")

ttrain<-cbind(trainlabel, trainsubject, xtrain) #BINDING ALL TRAINING DATASET TOGETHER


###PART 3
#Going to merge both data sets now
total<-rbind(ttest, ttrain)

#Giving the labelcodes an actual activity name/description
total$labelcode<-factor(total$labelcode, levels=labels$labelcode, label=labels$label)
total<-total[,-2] #Removing one column that is an overlap from merging the datasets



###PART 4
#reshaping the array for a tidy data set then saving it
library(reshape2)
meltdata<-melt(total, id=c("labelcode", "subject"))


## produce the tidy dataset with mean/average of each variable 
## for each activyt and each subject
tidydata <- dcast(meltdata, labelcode + subject ~ variable, mean)


## write tidy dataset to hard drive
write.table(tidydata, file="tidydata.txt", quote=FALSE, row.names=FALSE, sep="\t")

