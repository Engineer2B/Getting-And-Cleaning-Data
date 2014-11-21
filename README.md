Getting-And-Cleaning-Data
=========================

Repository for Course Project for Getting and Cleaning Data on Coursera

### Use of the code in this repository
Follow the following steps to run the code:

1. Download the data from [this URL]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract it in directory `strPathData`.
2. Start R or R studio.
3. Set the directory where `run_analysis.R` is located as working directory with `setwd(directory of R file)`
4. Type `source('run_analysis.R')` in R or R studio.
5. Execute `run_analysis` with the first parameter set to the directory `strPathData` of step 1, by executing `run_analysis(strPathData)`.
6. Hurra, a tidy data text file that (hopefully) meets the principles of Hadley Wickham's paper "Tidy data" is now in your data directory `strPathData`.

### Test the output
The tidy data file can be read back into R with the command `read.table(tidy file,header=TRUE)`.

### Optional parameters
`run_analysis` has 4 optional parameters which you can set.

They refer to the following values:

parameter name|reference
 --- | ---
strPathData | path to the data directory
strPathTest | path to the test folder with regard to `strPathData`
strPathTrain | path to the test folder with regard to `strPathData`
strNameFileOutStep5 | name of the output file

### More information
For more information of the variables and the method of generating them, read CodeBook.md.