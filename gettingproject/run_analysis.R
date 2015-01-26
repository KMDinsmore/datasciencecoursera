##**************
##Part 1
##**************
##
##  Merges the training and the test sets to create one data set.

##  Since I use windows, I will need absolute path names
##  to use these names, I will need the working directory
workingDir <- getwd()

##  The following lines create the paths needed to merge the data
##
test_data<- paste0(workingDir, "/UCI HAR Dataset/test/X_test.txt")
train_data<- paste0(workingDir, "/UCI HAR Dataset/train/X_train.txt")

test_subjects <- paste0(workingDir, "/UCI HAR Dataset/test/subject_test.txt")
train_subjects <- paste0(workingDir, "/UCI HAR Dataset/train/subject_train.txt")
  
test_activities <- paste0(workingDir, "/UCI HAR Dataset/test/y_test.txt")
train_activities <- paste0(workingDir, "/UCI HAR Dataset/train/y_train.txt")

##Function to combine data sets
datafile1 <- read.table(test_subjects)
datafile2 <- read.table(train_subjects)
datafile3 <- read.table(test_activities)
datafile4 <- read.table(train_activities)
datafile5 <- read.table(test_data)
datafile6 <- read.table(train_data)

##Merge data sets, final merge will be performed later once transformations
##are complete
##Append train data after test data for each type
##so subjects and activities will match up after final merge
##Used bind rather than merge, per course TA suggestion:
##https://class.coursera.org/getdata-010/forum/thread?thread_id=320#post-1420
merged_sets <- rbind(datafile5, datafile6)
merged_acts <- rbind(datafile3, datafile4)
merged_subjs <- rbind(datafile1, datafile2)


##**************
##Part 2
##**************
##  Extracts only the measurements on the mean and standard 
##  deviation for each measurement.

table.name<-paste0(workingDir, "/UCI HAR Dataset/features.txt")


##  Read column names into table
features<-read.table(table.name)

##  Now, select columns we wish to use, in this case
##  mean(average) and std(standard deviation)
toMatch <- c("mean", "std")

## Use grep to find the columns that contain the needed terms
needed_values<-features[grep(paste(toMatch,collapse="|"), features$V2),]

##  Put the needed columns into a dataframe
cleaned_data<-merged_sets[,needed_values[,1]]

##  Make a frame that has subjects, activities, means and standard deviations
complete_table<-cbind(merged_subjs, merged_acts, cleaned_data)


##**************
##Part 3
##**************
##  Uses descriptive activity names to name the activities in the data set



##  Assign labels to replace codes to vector
##  These names were selected based on researchers documentation
## ./UCI HAR Dataset/features.txt


##  This function contains a series of if statements that will
##  change each code number to a text description of the activity
replace_name<-function(x){
  if (x==1){
    x<-"WALKING"
  }
  
  else if (x==2){
    x<-"WALKING_UPSTAIRS"
  }
  
else if (x==3){
    x<-"WALKING_DOWNSTAIRS"
  }
  
else if (x==4){
  x<-"SITTING"
}

else if (x==5){
  x<-"STANDING"
}

else if (x==6){
  x<-"LAYING"
}
}

##  Find number of instances to be replace
instances_acts<-length(complete_table)

##  Create series of instances for loop to replace
iterations<-1:instances_acts


##  Run loop on each instance and replace numeric value with
##  text string
for (i in iterations){
                complete_table[i,2]<-replace_name(complete_table[i,2])
}

##**************
##Part 4
##**************

## Appropriately labels the data set with descriptive variable names. 

##  Take column names that contain mean and std
##  the values we need for the assignment, remove first character
##  to improve readability

merged_column_names<-as.vector(substring(needed_values[,2],2,))

##  Concatenate the Subject, Activity and heading names from features file
complete_column_names<-c("Subject_ID", "Activity", merged_column_names)

##  Assign string created immediately above to the columns of complete table
colnames(complete_table) <- complete_column_names
##**************
##Part 5
##**************

##  Create string to use to search for each activity
activity<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS"
            , "SITTING", "STANDING", "LAYING")

## Create data frame for tidy data set
tidy_data<-data.frame(NULL)

## Create vector to hold row names
master_row_names <- vector()


##  Nested for loops
##  First loop goes through each subject
##  Second goes through each activity
##  Finding the mean for each Subject, Activity pair for each observation
for (s in 1:30)  {
  select_subject<-complete_table[complete_table$Subject %in% s,]  #Select all of one subject
  for (i in 1:6)	{
    select_activity<-select_subject[select_subject$Activity %in% i,]##Within that subject find all of one activity
    numeric_values<-select_activity[,3:ncol(select_activity)]       ## Extract numeric values
    mean_of_cols<-colMeans(numeric_values)    ## Calculate Mean of those values
    name_of_row<- paste("Subject", s, activity[i])## Create appropriate row name
    master_row_names<-rbind(master_row_names, name_of_row)##Append created name to table of row names
    tidy_data<-rbind(tidy_data, mean_of_cols)##Append calculated mean to tidy data frame
  }
}
##  Assign created row names to data frame
rownames(tidy_data)<-master_row_names

##  Remove parentheses from column names
complete_column_names<-gsub("\\()", "", complete_column_names)

##  Assign more readable column names to data table
cols<-length(complete_column_names)
complete_column_names<-gsub("\\()", "", complete_column_names)
colnames(tidy_data)<-complete_column_names[3:cols]

##  Write table to file
write.table(tidy_data, file = "tidy_data.txt")
