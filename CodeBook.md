# CodeBook
### Study design
>There should be a section called "Study design" that has a thorough description of how you collected the data.

The data were collected from [the URL]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) as provided in the course project page. This data in turn was acquired in a series of experiments.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities:

number|activity
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

###### Raw data
The features that were used to generate the tidy data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Activities are numbered from 1 to 6.

###### Generated variables
The set of variables that were estimated from these signals are: 

The mean value and the standard deviation.

### The transformations
The test and training data were row binded into 1 dataframe.
Then the activity and the participant data for test and train data were column binded to this frame.

Now we have a dataframe that looks schematically like this:

![alt text][dataframe]
[dataframe]: https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png "from David's project FAQ"

For this data frame the headers were renamed using the following table of rules in sequence:

pattern | replaced by
--- | ---
"acc" | "acceleration"
"t "|"time "
"f "|"frequency "
"mag"|"magnitude"
"iqr"|"interquartile range"
"arCoeff"|"autorregresion coefficients"
"ar coeff"|"autorregresion coefficients"
"sma"|"signal magnitude area"
"mad"|"median absolute deviation"
"maxInds"|"index of frequency component with largest magnitude"
"bandsEnergy"|"energy of frequency interval"
"mean freq"|"mean of frequency components"
"meanFreq"|"mean of frequency components"
"max inds"|"index of frequency component with largest magnitude"
"std"|"standard deviation"
"\\(\\)\\-"|" in "
"\\(\\)"|""
"\\-"|" plugged into "
"\\("|" of "
"\\,"|" and "
"\\)"|""

The end of the rules list frequently has an escape character "\" in it, making it seem a bit cryptic.

Subsequently, for the big dataframe, activity number was converted to activity type (it was turned into a factor variable).

Next up, the variables that have "mean", "standard" (for standard deviation), "activity" or "subject" in them are selected from the dataframe.

And finally the data is aggregated for subject and then activity and for each variable of a (subject,activity)-pair the mean is calculated with the function `ddply` of the `plyr` package.

The end result looks like this:

| subject | activity | name of variable 1 | name of variable 2 etc.
|---------|:--------:|--------------- -:|--------------- -:|
| 1       | WALKING  | 0.4 | 0.6
| 1       | LAYING   | -.3 | 0.5