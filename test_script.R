setwd("~/Documents/Coursera/ReproducibleResearch/RepData_PeerAssessment1")

activity_data <- read.csv("activity.csv",header=T)
# remove NA data
activity <- na.exclude(activity_data)

hist(activity$steps)
mean(activity$steps)
median(activity$steps)
