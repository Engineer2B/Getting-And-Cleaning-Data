Getting-And-Cleaning-Data
=========================

Repository for Course Project for Getting and Cleaning Data on Coursera

### Use of this repository
Follow the following steps to run the code:
1. Download the data from [this URL]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract it in directory `strPathData`.
2. Start R or R studio.
3. Set the directory where `run_analysis.R` is located as working directory with `setwd(**directory of R file**)`
4. Type `source('run_analysis.R')` in R or R studio.
5. You can now execute `run_analysis`, which has 4 optional parameters `strPathData`, `strPathTest`, `strPathTrain`,`strNameFileOutStep5` of which the first 1, `strPathData`, needs to be set to the directory `strPathData` of step 1.
6. The results are now in your data directory `strPathData`


You may have heard this before, but reproducibility is kind of a big deal in computational science. That means, when you submit your paper, the reviewers and the rest of the world should be able to exactly replicate the analyses from raw data all the way to final results. If you are trying to be efficient, you will likely perform some summarization/data analysis steps before the data can be considered tidy.

The ideal thing for you to do when performing summarization is to create a computer script (in R, Python, or something else) that takes the raw data as input and produces the tidy data you are sharing as output. You can try running your script a couple of times and see if the code produces the same output.

In many cases, the person who collected the data has incentive to make it tidy for a statistician to speed the process of collaboration. They may not know how to code in a scripting language. In that case, what you should provide the statistician is something called pseudocode. It should look something like:

Step 1 - take the raw file, run version 3.1.2 of summarize software with parameters a=1, b=2, c=3
Step 2 - run the software separately for each sample
Step 3 - take column three of outputfile.out for each sample and that is the corresponding row in the output data set
You should also include information about which system (Mac/Windows/Linux) you used the software on and whether you tried it more than once to confirm it gave the same results. Ideally, you will run this by a fellow student/labmate to confirm that they can obtain the same output file you did.