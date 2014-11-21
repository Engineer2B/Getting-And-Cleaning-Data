Getting-And-Cleaning-Data
=========================

Repository for Course Project for Getting and Cleaning Data on Coursera

### Use of this repository
Follow the following steps to run the code:

1. Download the data from [this URL]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract it in directory `strPathData`.
2. Start R or R studio.
3. Set the directory where `run_analysis.R` is located as working directory with `setwd(directory of R file)`
4. Type `source('run_analysis.R')` in R or R studio.
5. Execute `run_analysis` with the first parameter set to the directory `strPathData` of step 1, that is execute `run_analysis(strPathData)`.
6. The results are now in your data directory `strPathData`

`run_analysis` has 4 optional parameters which you can set.
They refer to the following values:

parameter name|reference
 --- | ---
strPathData | path to the data directory
strPathTest | path to the test folder from the test directory
strPathTrain | path to the test folder from the train directory
strNameFileOutStep5 | name of the output file