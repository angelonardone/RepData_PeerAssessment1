setwd("~/Documents/Coursera/ReproducibleResearch/RepData_PeerAssessment1")

activity_data <- read.csv("activity.csv",header=T)
# remove NA data
activity <- na.exclude(activity_data)


library(plyr)
daily_steps <- ddply(activity, .(date), summarise, steps=sum(steps))
hist(daily_steps$steps, xlab="steps per day")
# mean and median total number of steps taken per day
mean(daily_steps$steps)
median(daily_steps$steps)


average_date <- ddply(activity, .(interval), summarise, steps=mean(steps))
plot(average_date$interval, average_date$steps, type="l", xlab="5-minute interval", 
     ylab="Average steps",main="Average daily activity")

# Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
average_date[average_date$steps==max(average_date$steps),]
colnames(average_date)[2] <- "intervalAvg"


#  missing values
sum(is.na(activity_data$steps))
# Imputing NA's with average on 5-min interval
merged <- arrange(join(activity_data, average_date), interval)
# the new dataset 
merged$steps[is.na(merged$steps)] <- merged$intervalAvg[is.na(merged$steps)]
# plot the histogram
new_daily_steps <- ddply(merged, .(date), summarise, steps=sum(steps))
hist(new_daily_steps$steps, main="Number of Steps", 
     xlab="steps taken each day",,)
# mean and median total number of steps taken per day don't change significantly
mean(new_daily_steps$steps)
median(new_daily_steps$steps)
daily_steps_1 <- sum(activity$steps)
daily_steps_2 <- sum(merged$steps)
diff <- daily_steps_2 -daily_steps_1 []



library(lattice)
weekdays <- weekdays(as.Date(merged$date))
data_weekdays <- transform(merged, day=weekdays)
data_weekdays$wk <- ifelse(data_weekdays$day %in% c("Saturday", "Sunday"),"weekend", "weekday")
average_week <- ddply(data_weekdays, .(interval, wk), summarise, steps=mean(steps))

xyplot(steps ~ interval | wk, data = average_week, layout = c(1, 2), type="l")

