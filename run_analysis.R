library(dplyr)

# download ----------------------------------------------------------------

name <- "Final.zip"
zip<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zip,name,"curl")
unzip(name)


# data --------------------------------------------------------------------

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


# merging -----------------------------------------------------------------

x<- rbind(x_train,x_test)
y<- rbind(y_train,y_test)
Subject <- rbind(subject_train, subject_test)
Data <- cbind(Subject, y, x)
# extracting --------------------------------------------------------------

data_2 <- select(Data,c(subject,code), contains("mean"), contains("std"))

# names -------------------------------------------------------------------

data_2$code<- activities[data_2$code, 2]

# labels -------------------------------------------------------------


names(data_2)[2] = "activity"
names(data_2)<-gsub("Acc", "Accelerometer", names(data_2))
names(data_2)<-gsub("Gyro", "Gyroscope", names(data_2))
names(data_2)<-gsub("BodyBody", "Body", names(data_2))
names(data_2)<-gsub("Mag", "Magnitude", names(data_2))
names(data_2)<-gsub("^t", "Time", names(data_2))
names(data_2)<-gsub("^f", "Frequency", names(data_2))
names(data_2)<-gsub("tBody", "TimeBody", names(data_2))
names(data_2)<-gsub("-mean()", "Mean", names(data_2))
names(data_2)<-gsub("-std()", "STD", names(data_2))
names(data_2)<-gsub("-freq()", "Frequency", names(data_2))
names(data_2)<-gsub("angle", "Angle", names(data_2))
names(data_2)<-gsub("gravity", "Gravity", names(data_2))


# data 3 ------------------------------------------------------------------
View(data_2)
Data_3 <- data_2 %>% group_by(subject, activity) %>%summarise_all(funs(mean))
View(Data_3)

write.table(Data_3,file = "Cleanest_Data.txt",row.names = F)
