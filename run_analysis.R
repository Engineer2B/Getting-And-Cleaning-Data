strPathData <- "C:\\Programmeren\\Bronbestanden\\UCI HAR Dataset\\"
strPathTest <- "test"
strPathTrain <- "train"
strNameFileOutStep5 <- "step5.txt"

################################## Step 1 ##################################
## Merge the training and the test sets to create one data set.           ##
#Read in the source files
# Set working directory to the test data path
setwd(paste(strPathData,strPathTest,sep=""))
# Read the X, y and subject test data
dfXTest<-read.table("X_test.txt")
dfYTest<-read.table("y_test.txt")
dfSTest<-read.table("subject_test.txt")
# Set working directory to the train data path
setwd(paste(strPathData,strPathTrain,sep=""))
# Read the X, y and subject train data
dfXTrain<-read.table("X_train.txt")
dfYTrain<-read.table("y_train.txt")
dfSTrain<-read.table("subject_train.txt")
#Column bind the subject and activity data for the test set
dfXSTest<-cbind(dfXTest,dfSTest)
dfXSYTest<-cbind(dfXSTest,dfYTest)
# Column bind the subject and activity data for the train set
dfXSTrain<-cbind(dfXTrain,dfSTrain)
dfXSYTrain<-cbind(dfXSTrain,dfYTrain)
# Finally row bind the train and test set into 1 big dataframe
dfXSYTrainTest<-rbind(dfXSYTrain,dfXSYTest)

################################## Step 2 ##################################
## Label the data set with descriptive variable names.                    ##
# Set working directory to the initial data source path
setwd(strPathData)
# Extract variable names from 'features.txt'
tabFeatures <- read.table("features.txt")
# Convert this dataframe into lists of lower case characters
lsAx1strFeatures <- as.character(unlist(tabFeatures[,2]))
# Substitute some characters with their more readable equivalent
#Replace CamelCase with spaces as in
#http://stackoverflow.com/a/22528880/1750173
lsAx1strFeatures1 <- gsub("([a-z])([A-Z])", "\\1 \\L\\2", lsAx1strFeatures, perl = TRUE)
#sub("^(.[a-z])", "\\L\\1", lsAx1strFeatures1, perl = TRUE)
### Replacing words to make it more readable ###
replaceByRules <- function(lsAx1strInput,lsAx2strRules){
    # This function substitutes strings in sequence, element 1 is the pattern
    # string, element 2 is the replacement string
    for(ls1x2str in lsAx2strRules){
        strPattern<-ls1x2str[[1]]
        strReplacement<-ls1x2str[[2]]
        lsAx1strInput<-sub(strPattern,strReplacement,lsAx1strInput)
    }
    return(lsAx1strInput)
}
lsAx2strListOfRules<-list(
    list("acc","acceleration"),
    list("t ","time duration for "),
    list("f ","frequency domain signal for "),
    list("mag","magnitude"),
    list("iqr","interquartile range"),
    list("arCoeff","autorregresion coefficients"),
    list("ar coeff","autorregresion coefficients"),
    list("sma","signal magnitude area"),
    list("mad","median absolute deviation"),
    list("maxInds","index of frequency component with largest magnitude"),
    list("bandsEnergy","energy of frequency interval"),
    list("mean freq","mean of frequency components"),
    list("meanFreq","mean of frequency components"),
    list("max inds","index of frequency component with largest magnitude"),
    list("std","standard deviation"),
    list("\\(\\)\\-"," in "),
    list("\\(\\)",""),
    list("\\-"," plugged into "),
    list("\\("," of "),
    list("\\,"," and "),
    list("\\)",""),
    list("\\)",""))
lsAx1strFeaturesChanged<-replaceByRules(lsAx1strFeatures1,lsAx2strListOfRules)
# Add subject and activity to feature labels
lsAx1strFeaturesFinal <- append(lsAx1strFeaturesChanged,c("subject","activity"))
# Set the names
names(dfXSYTrainTest) <- lsAx1strFeaturesFinal

################################## Step 3 ##################################
## Uses descriptive activity names to name the activities in the data set ##
setwd(strPathData)
dfLabels <- read.table("activity_labels.txt",stringsAsFactors=FALSE)
ls6strLabels <- tolower(as.character(unlist(dfLabels["V2"])))
ls6strLabels <- sub("_"," ", unlist(ls6strLabels))
# Applying labels to activity column
dfXSYTrainTest$activity<-factor(unlist(dfXSYTrainTest$activity),labels=ls6strLabels)

################################## Step 4 ##################################
## Extract only those measurements on the mean and standard deviation     ##
## for each measurement.                                                  ##
# List the indices of the labels of dfXSYTrainTest that have 'subject', 
# 'activity', 'mean' or 'deviation' in them.
lsAinExtractionIndices = grep("mean|deviation|subject|activity",names(dfXSYTrainTest))
# Use the list of indices to extract the relevant columns and the subject
# and activity.
dfXSYTrainTestSelection <- dfXSYTrainTest[,lsAinExtractionIndices]

################################## Step 5 ##################################
## From the data set in step 4, create a second, independent tidy data    ##
## set with the average of each variable for each activity                ##
## and each subject.                                                      ##
library(plyr)
# Run the functions length, mean, and sd on the value of "change" for each
# group, broken down by sex + condition
dfXSYTrainTestSummary <- ddply(dfXSYTrainTestSelection,
                               c("activity", "subject"),
                               colwise(mean))
##############################  Export result ##############################
strFileOutStep5 <- paste(strPathData,strNameFileOutStep5,sep="")
write.table(dfXSYTrainTestSummary,file=strFileOutStep5,row.name=FALSE)