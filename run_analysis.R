setwd("C:/Users/I069069/Documents/gettingcleandata/UCI HAR Dataset")
library(plyr)

# Step 1
x_training <- read.table("train/X_train.txt")
y_training <- read.table("train/y_train.txt")
sub_training <- read.table("train/subject_train.txt")

x_testing <- read.table("test/X_test.txt")
y_testing <- read.table("test/y_test.txt")
sub_testing <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_training, x_testing)

# create 'y' data set
y_data <- rbind(y_training, y_testing)

# create 'subject' data set
sub_data <- rbind(sub_training, sub_testing)

# Step 2
features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std]

# correct the column names
names(x_data) <- features[mean_and_std, 2]

# Step 3

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# Step 4
# correct column name
names(sub_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, sub_data)

# Step 5
avg_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avg_data, "avg_data.txt", row.name=FALSE)
