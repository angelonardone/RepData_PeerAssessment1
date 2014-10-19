# Reproducible Research: Peer Assessment 1



## Loading and preprocessing the data

```r
activity_data <- read.csv("activity.csv",header=T)
# new data set without NA
activity <- na.exclude(activity_data)
```



## What is mean total number of steps taken per day?

```r
hist(activity$steps)
```

![plot of chunk unnamed-chunk-3](./PA1_template_files/figure-html/unnamed-chunk-3.png) 

```r
mean(activity$steps)
```

```
## [1] 37.38
```

```r
median(activity$steps)
```

```
## [1] 0
```



## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
