# -Cleaning-Data

This is my final proyect for the  Getting and Cleaning Data Course Project. This repo includes:
# run_analysis.R 
An r code with the treatment process of the raw data provided in this link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
the code procedes as follows:
- Downloads the data from the link.
- Unzips all the data.
- Merge all the datasets in the "Data" dataset.
- Extracts all the measurments on the mean and standar deviation for each observation. this is the "data_2" dataset.
- Gives names to the activities in the "data_2" datset.
- Labels the "data_2" dataset with descriptive variable names.
- creates the "Data_3" dataset with the mean and the standar deviation of every subject by activity
# Cleanest_Data.txt
the final product of the previus code
