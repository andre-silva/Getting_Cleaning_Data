## Function to tidy the data for the Course Project of the
## Getting and Cleaning Data course from Johns Hopkins Uni (Coursera)
run_analysis <- function() {
    ## Load required libraries
    library(data.table)
    library(plyr)
    library(reshape2)
    
    ## Download and unzip data
    if(!file.exists("./data")){dir.create("./data")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,"./data/CProjData.zip",method="curl")
    unzip("./data/CProjData.zip",exdir="./data")
    
    ## Step 1: Merge training and test sets
    subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    
    subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
    
    subjectSet <- rbind(subject_test,subject_train)
    xSet <- rbind(x_test,x_train)
    ySet <- rbind(y_test, y_train)
    
    ## Step 2: Extract only the measurements on the mean and standard deviation
    ## for each measurement
    features <- read.table("./data/UCI HAR Dataset/features.txt")
    
    ## Get indices for the columns we want to select. 2 first columns are not
    ## features so should be included
    meanIndices <- grep("mean()",features$V2,fixed=TRUE)
    stdIndices <- grep("std()",features$V2,fixed=TRUE)
    
    xSet <- xSet[,c(meanIndices,stdIndices)]
    
    ## Step 3: Use descriptive activity names to name the activities
    ## in the data set
    ySet$V1 <- factor(ySet$V1)
    ySet$V1 <- revalue(ySet$V1, c("1"="WALKING", "2"="WALKING_UPSTAIRS", 
                                  "3"="WALKING_DOWNSTAIRS","4"="SITTING",
                                  "5"="STANDING","6"="LAYING"))
    
    ## Step 4: Appropriately labels the data set with descriptive variable names. 
    namesMean <- as.character(features[meanIndices,"V2"])
    namesStd <- as.character(features[stdIndices,"V2"])
    names(xSet) <- c(namesMean,namesStd)
    ## Remove the parenthesis
    names(xSet) <- sub("()","",names(xSet),fixed=TRUE)
    ## Set to more descriptive Time and Frequency instead of t and f
    names(xSet) <- sub("tBody","timeBody",names(xSet),fixed=TRUE)
    names(xSet) <- sub("tGravity","timeGravity",names(xSet),fixed=TRUE)
    names(xSet) <- sub("fBody","frequencyBody",names(xSet),fixed=TRUE)
    names(xSet) <- sub("fGravity","frequencyGravity",names(xSet),fixed=TRUE)
    
    names(ySet) <- c("Activity")
    names(subjectSet) <- c("Subject")
    
    ## Merge into 1 dataset to prepare for step 5
    completeSet <- cbind(subjectSet,ySet,xSet)
    
    ## Step 5: From the data set in step 4, creates a second, 
    ## independent tidy data set with the average of each variable
    ## for each activity and each subject.
    moltenSet <- melt(completeSet,id.vars=c("Subject","Activity"))
    finalSet <- dcast(moltenSet, Subject + Activity ~ variable, fun = mean)
    write.table(finalSet, file="tidyDataset.txt",row.names=FALSE)
    
}