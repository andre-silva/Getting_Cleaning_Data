## Function to tidy the data for the Course Project of the
## Getting and Cleaning Data course from Johns Hopkins Uni (Coursera)
run_analysis <- function() {
    ## Load required libraries
    library(data.table)
    
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
    
    testSet <- cbind(subject_test,y_test,x_test)
    
    trainSet <- cbind(subject_train,y_train,x_train)
    
    mergedSet <- rbind(testSet, trainSet)
    
    ## Step 2: Extract only the measurements on the mean and standard deviation
    ## for each measurement
    features <- read.table("./data/UCI HAR Dataset/features.txt")
    
    ## Get indices for the columns we want to select. 2 first columns are not
    ## features so should be included
    meanIndices <- grep("mean()",features$V2,fixed=TRUE)
    stdIndices <- grep("std()",features$V2,fixed=TRUE)
    indices <- c(1,2,meanIndices+2,stdIndices+2)
    
    mergedSet <- mergedSet[,indices]
    
    ## Step 3: Use descriptive activity names to name the activities
    ## in the data set
    activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
    mergedSet <- merge(mergedSet, activity_labels, by.x="V1.1",by.y="V1",all=FALSE)
    mergedSet <- mergedSet[,c(1,69,3:68)]
    
    ## Step 4: Appropriately labels the data set with descriptive variable names. 
    namesMean <- as.character(features[meanIndices,"V2"])
    namesStd <- as.character(features[stdIndices,"V2"])
    names(mergedSet) <- c("Subject","Activity",namesMean,namesStd)
}