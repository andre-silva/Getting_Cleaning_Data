---
title: "README"
author: "Hugo Andre Silva"
date: "23 Nov 2014"
output: html_document
---

This analysis was done based on raw data from UCI's "Human Activity Recognition
Using Smartphones Data Set" 
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
and the goal is to generate a tidy data set with the means for every mean or standard
deviation feature for each combination of Subject and Activity.
More information on the raw data can be found in the Code Book.

For this analysis the train the script downloads the data set, unzips it and then proceeds to:

1 - Merge the training and test data sets using rbind to combine them into a single data set
2 - Get the features from the features.txt file and proceed to select the features containing
    a mean or standard deviation measure and exclude the remaining features from the data set
3 - Replace the activity code by their corresponding activity description
4 - Rename the columns by assigning them descriptive names:
    a) Get the feature name from the features.txt file
    b) Replact the initial "t" and "f" by "time" and "frequency" respectively
    c) Removing the parenthesis from the column name
    d) Add mean to the end of it just to make clear that the resulting variable is a
       mean of the feature collected
5 - Use the melt and dcas function to summarize the features and get its mean

The resulting data set contains the mean for each feature per Subject and Activity, resulting
in 180 rows corresponding to 30 subjects and 6 activities