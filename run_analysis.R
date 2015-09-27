# Tidy dataset

# Read in data from source files
activity_labels<-read.table("data/activity_labels.txt")
features<-read.table("data/features.txt")
testx<-read.table("data/test/X_test.txt")
testy<-read.table("data/test/Y_test.txt")
testsubject<-read.table("data/test/subject_test.txt")
trainx<-read.table("data/train/X_train.txt")
trainy<-read.table("data/train/Y_train.txt")
trainsubject<-read.table("data/train/subject_train.txt")

# Extract mean and standard deviation rows from features table.
relevantfeatures<-features[grepl("mean|std",features[,"V2"]), ]

# Filter out irrelevant columns
testx<-testx[, relevantfeatures[,1]]
trainx<-trainx[, relevantfeatures[,1]]


# Set label for the subject table and activity type table
colnames(testsubject) <- c("Subject")
colnames(testy) <- c("Activity type")
colnames(trainsubject) <- c("Subject")
colnames(trainy) <- c("Activity type")

# Assign nice names to the activity type table
testy[, 1] <- factor(testy[,1])
levels(testy[, 1]) <- activity_labels[, 2]
trainy[, 1] <- factor(trainy[,1])
levels(trainy[, 1]) <- activity_labels[, 2]

# Set labels of the test data columns
colnames(testx) <- relevantfeatures[, 2]
colnames(trainx) <- relevantfeatures[, 2]

# Join test data tables and add column to ID it as test data
testdata <- cbind(testsubject,testy,testx)
testdata$type <- "Test"

# Join train data tables and add column to ID it as training data
traindata <- cbind(trainsubject,trainy,trainx)
traindata$type <- "Training"

finaldata <- rbind(testdata, traindata)

library(dplyr)
