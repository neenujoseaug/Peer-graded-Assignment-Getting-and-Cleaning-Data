getwd()
[1] "C:/Users/Neenu/Desktop/coursera"
> rm(list=ls())
> url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download(url, dest="dataset.zip")
Error in download(url, dest = "dataset.zip") : 
  could not find function "download"
> require(downloader)
Loading required package: downloader
Warning message:
In library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
  there is no package called ‘downloader’
> if(!require(downloader)){
+     install.packages('downloader', repos='http://cran.us.r-project.org')
+ }
Loading required package: downloader
Installing package into ‘C:/Users/Neenu/Documents/R/win-library/3.4’
(as ‘lib’ is unspecified)
trying URL 'http://cran.us.r-project.org/bin/windows/contrib/3.4/downloader_0.4.zip'
Content type 'application/zip' length 22385 bytes (21 KB)
downloaded 21 KB

package ‘downloader’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Neenu\AppData\Local\Temp\Rtmp61bskr\downloaded_packages
Warning message:
In library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE,  :
  there is no package called ‘downloader’
> library(downloader)      
Warning message:
package ‘downloader’ was built under R version 3.4.4 
> dir()
 [1] "1st.R"                      "boring_function.R"         
 [3] "Coursera R CERTIFICATE.pdf" "evaluate.R"                
 [5] "mad_libs.R"                 "my_mean.R"                 
 [7] "mycode.R"                   "Programming Assignment 3"  
 [9] "ProgrammingAssignment2"     "remainder.R"               
[11] "specdata"                   "telegram.R"                
[13] "UCI HAR Dataset"           
> getwd()
[1] "C:/Users/Neenu/Desktop/coursera"
> dir()
[1] "activity_labels.txt" "features.txt"        "features_info.txt"  
[4] "README.txt"          "test"                "train"              
> list.files("./train")
[1] "Inertial Signals"  "subject_train.txt" "X_train.txt"      
[4] "y_train.txt"      
> X_train <- read.table("train/X_train.txt")
> X_test <- read.table("test/X_test.txt")
> X <- rbind(X_train, X_test)
> dim(X)
[1] 10299   561
> y_train <- read.table("train/y_train.txt")
> y_test <- read.table("test/y_test.txt")
> Y <- rbind(y_train, y_test)
> subject_train <- read.table("train/subject_train.txt")
> subject_test <- read.table("test/subject_test.txt")
> Subject <- rbind(subject_train, subject_test)
> Features <- read.table("features.txt")
> names(Subject)<-c("subject")
> names(Y)<- c("activity")
> names(X)<- Features[ ,2]
> indices <- grep("-mean\\(\\)|-std\\(\\)", Features[, 2])
> extracted <- X[, indices]
> names(extracted) <- Features[indices, 2]
> names(extracted) <- gsub("\\(|\\)", "", names(extracted))
> names(extracted) <- tolower(names(extracted))
> dim(extracted)
[1] 10299    66
> activities <- read.table("activity_labels.txt")
> activities
  V1                 V2
1  1            WALKING
2  2   WALKING_UPSTAIRS
3  3 WALKING_DOWNSTAIRS
4  4            SITTING
5  5           STANDING
