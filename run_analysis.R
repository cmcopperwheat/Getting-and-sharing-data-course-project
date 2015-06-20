# part 1

xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt")
xcombined <- rbind(xtrain, xtest)

ytrain <- read.table("train/y_train.txt")
ytest <- read.table("test/y_test.txt")
ycombined <- rbind(ytrain, ytest)

subjecttrain <- read.table("train/subject_train.txt")
subjecttest <- read.table("test/subject_test.txt")
subjectcombined <- rbind(subjecttrain, subjecttest)

# part 2

features <- read.table("features.txt")
indices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
xcombined <- xcombined[,indices]
names(xcombined) <- features[indices, 2]

# part 3

activities <- read.table("activity_labels.txt")
ycombined[,1] = activities[ycombined[,1], 2]
names(ycombined) <- "activity"

# part 4

names(subjectcombined) <- "subject"
cleandata <- cbind(subjectcombined, ycombined, xcombined)
columns = dim(cleandata)[2]
write.table(cleandata, "cleandata.txt")

# part 5


i = length(unique(subjectcombined)[,1])
j = length(activities[,1])
outtab = cleandata[1:(i*j),]
subjects = unique(subjectcombined)[,1]

row = 1
for (n in 1:i) {
  for (m in 1:j) {
    outtab[row, 1] = subjects[n]
    outtab[row, 2] = activities[m, 2]
    tmp <- cleandata[cleandata$subject==n & cleandata$activity==activities[m, 2], ]
    outtab[row, 3:columns] <- colMeans(tmp[, 3:columns])
    row = row+1
  }
}
write.table(outtab, "cleandata_averages.txt",row.name=FALSE)