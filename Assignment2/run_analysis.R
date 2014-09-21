#Set working Directory
setwd("~/Desktop/Coursera/3.Getting and Cleaning Data/UCI HAR Dataset")

#Read all txt files
activity.labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
x.test <- read.table("test/X_test.txt")
y.test <- read.table("test/y_test.txt")
subject.test <- read.table("test/subject_test.txt")
x.train <- read.table("train/X_train.txt")
y.train <- read.table("train/y_train.txt")
subject.train <- read.table("train/subject_train.txt")

#cbind train and test data file parts
train.data <- cbind(subject.train, x.train, y.train)
test.data <- cbind(subject.test, x.test, y.test)

#rbind train and test datasets
complete.data <- rbind(train.data, test.data)

#adding descriptive variable names
features$V2 <- as.character(features$V2)
colnames(complete.data) <- c("Subject", features$V2, "Activity_Labels")

#filtering only the mean and standard deviation values using features.csv
mean.cases <- grepl("mean", features$V2, ignore.case = TRUE)
std.cases <- grepl("std", features$V2, ignore.case = TRUE)
required.features <- subset(features, mean.cases == TRUE | std.cases == TRUE)
x <- required.features$V1 + 1
final.complete.data <- complete.data[,c(1, x, 563)]

#adding descriptive activity names
activity.labels$V2 <- as.character(activity.labels$V2)
for (i in 1:length(final.complete.data$Activity_Labels)) {
  if (final.complete.data$Activity_Labels[i] == 1) {final.complete.data$Activity_Labels[i] <- activity.labels$V2[1]}
  if (final.complete.data$Activity_Labels[i] == 2) {final.complete.data$Activity_Labels[i] <- activity.labels$V2[2]}
  if (final.complete.data$Activity_Labels[i] == 3) {final.complete.data$Activity_Labels[i] <- activity.labels$V2[3]}
  if (final.complete.data$Activity_Labels[i] == 4) {final.complete.data$Activity_Labels[i] <- activity.labels$V2[4]}
  if (final.complete.data$Activity_Labels[i] == 5) {final.complete.data$Activity_Labels[i] <- activity.labels$V2[5]}
  if (final.complete.data$Activity_Labels[i] == 6) {final.complete.data$Activity_Labels[i] <- activity.labels$V2[6]}

final.complete.data$Activity_Labels
}

avg.by.sub <- matrix(0, 30,86)
colnames(avg.by.sub) <- colnames(final.complete.data)[2:87]
rownames(avg.by.sub) <- 1:30
for (i in 2:87) {
    avg.by.sub[,i-1] <- tapply(final.complete.data[,i], final.complete.data$Subject, mean)
    avg.by.sub
}

avg.by.act <- matrix(0, 6,86)
colnames(avg.by.act) <- colnames(final.complete.data)[2:87]
rownames(avg.by.act) <- activity.labels$V2
for (i in 2:87) {
  avg.by.act[,i-1] <- tapply(final.complete.data[,i], final.complete.data$Activity_Labels, mean)
  avg.by.act
}

tidy.data <- rbind(avg.by.sub, avg.by.act)
write.table(tidy.data, "tidydata.txt", row.name=FALSE)
