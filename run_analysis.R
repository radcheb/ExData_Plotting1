
filenames <- list.files("test/Inertial Signals/", pattern="*.txt", full.names=TRUE)
y_test <- read.table('test/y_test.txt')
x_test <- read.table('test/X_test.txt')
subject_test <- read.table('test/subject_test.txt')
data<- cbind(x_test,y_test,subject_test)
sapply(filenames, function(x) data<-cbind(data,read.table(x)))
filenames <- list.files("train/", pattern="*.txt", full.names=TRUE)
sapply(filenames, function(x) data<-cbind(data,read.table(x)))
filenames <- list.files("train/Inertial Signals/", pattern="*.txt", full.names=TRUE)
sapply(filenames, function(x) data<-cbind(data,read.table(x)))

means <- sapply(data,mean)
sds <- sapply(data,sd)

write.table(means,"output.csv")