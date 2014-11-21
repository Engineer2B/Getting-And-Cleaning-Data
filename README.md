Getting-And-Cleaning-Data
=========================

Repository for Course Project for Getting and Cleaning Data on Coursera

### Use of this repository
Follow the following steps to run the code:

1 Download the data from [this URL]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract it in directory `strPathData`.

2 Start R or R studio.

3 Set the directory where `run_analysis.R` is located as working directory with `setwd(directory of R file)`

4 Type `source('run_analysis.R')` in R or R studio.

5 You can now execute `run_analysis`, which has 4 optional parameters `strPathData`, `strPathTest`, `strPathTrain`,`strNameFileOutStep5` of which the first 1, `strPathData`, needs to be set to the directory `strPathData` of step 1.

6 The results are now in your data directory `strPathData`