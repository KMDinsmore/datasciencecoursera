---
title: "README"
author: "KMDINSMORE"
date: "Sunday, January 25, 2015"
output: html_document
---
Preliminary notes: While not using all of the functions as taught in class (I started this project before watching all of the lectures), I believe this script does have the benefit of being able to be able to perform the analysis without loading any additional libraries. 
<br>Thank you for taking the time to read my work, and best of luck in your studies.<br>


##  Part 1
Part 1 of the script and (for the most part 1 of the assignment) reads into a data frame the table data from the files located in the directory UCI HAR Dataset that are needed to complete assignment.  
<br>
(The assumption is the script will be run with the UCI Har Dataset folder in the working directory)
<br>
Next each type of data (Subject info, activity codes, and observations) are attached to one another via rbind.

##	Part 2
Creates a string with the table path to the features file that contains varoius components of the observations.  The script uses that string to read the table into a data frame.  The strings "mean" and "std" are concatenated into a list and then searched for and extracted from the merged data set.  


<br><b>NOTE:  "Mean" was not used as based upon features.txt those values did not appear to be relevant to the assignment</b><br>

##	Part 3
A series of if and else if statements are read into a function to replace codes with text descriptions of activities.
<br>
The table length is calcuated and then a series is constructed to loop through each instance of a code replacing with the function created about.  This may have been a good place to use an apply function.

##	Part 4
From the values that contain mean and standard deviation the heading names are place into a vector to be used for the column names in the tidy data set.  The first character (usually a 't' or 'f') is removed to make things easier to read.
<br>
That list is concatenated on to 'Subject_ID' and 'Activity' to created a fully merged set that can be used to create our tidy data set.
<br>
Finally, the list is assigned to the column names of our table that contains all the needed values

##	Part 5
A list of activities is created to loop through and find each activity for a given subject.
<br>
A data frame to hold the tidy set is created, it iscreated empty to facilitate testing (due to use of rbind)  A vector is created to hold row names that will be created while looping
<br>
In nested loops we go through each subject, one activity at a time and extract the mean for each observation
<br>
The parentheses are then removed from the column names to aid readability.   The column names in their final, most readable form are written to the data frame.
<br>
Finally, the data set is written to the file, in this case "tidy_data.txt"