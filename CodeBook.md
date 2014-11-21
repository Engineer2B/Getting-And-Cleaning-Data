Codebook
========
For almost any data set, the measurements you calculate will need to be described in more detail than you will sneak into the spreadsheet. The code book contains this information. At minimum it should contain:


Information about the variables (including units!) in the data set not contained in the tidy data
Information about the summary choices you made
Information about the experimental study design you used
In our genomics example, the analyst would want to know what the unit of measurement for each clinical/demographic variable is (age in years, treatment by name/dose, level of diagnosis and how heterogeneous). They would also want to know how you picked the exons you used for summarizing the genomic data (UCSC/Ensembl, etc.). They would also want to know any other information about how you did the data collection/study design. For example, are these the first 20 patients that walked into the clinic? Are they 20 highly selected patients by some characteristic like age? Are they randomized to treatments?

A common format for this document is a Word file. 

### Study design
>There should be a section called "Study design" that has a thorough description of how you collected the data.

The data were collected from [the URL]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) as provided in the course project page. This data in turn was acquired in a series of experiments.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities:

 --- | ---
 1 | WALKING
 2 | WALKING_UPSTAIRS
 3 | WALKING_DOWNSTAIRS
 4 | SITTING
 5 | STANDING
 6 | LAYING

while wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Features are normalized and bounded within [-1,1].
Each feature vector is a row on the text file.

### Codebook
>There is a section called "Code book" that describes each variable and its units.


The variables


The data


The transformations


