theData <- read.csv('~/Dropbox/development/R/corporate5k/all_times.csv',header=FALSE,sep='\t',stringsAsFactors=FALSE)
names(theData) <- c('name','gender','seconds','team','minutes','time')

# subset of all runners from CBSi
cbsi_runners<-theData[theData$team == "CBS INTERACTIVE",]


# subset of all CBSi male and female runners
cbsi_male <- cbsi_runners[cbsi_runners$gender == "Male",]

cbsi_female <- cbsi_runners[cbsi_runners$gender == "Female",]



# display the male and female summaries
summary(cbsi_runners[cbsi_runners$gender=="Female",]$minutes)

summary(cbsi_runners[cbsi_runners$gender=="Male",]$minutes)


# plot of all finishing times & boxplot of male vs female scores
p <- ggplot(cbsi_runners,aes(gender,minutes))
 p+geom_boxplot() + geom_jitter() + opts(title="CBS Interactive finishing times for MB Corporate 5k")

plot(density(cbsi_runners[cbsi_runners$gender=="Male",]$minutes),main="Male CBSi participant times",sub="2011 Mercedes Benz Corporate Challenge 5k")

plot(density(cbsi_runners[cbsi_runners$gender=="Female",]$minutes),main="Female CBSi participant times",sub="2011 Mercedes Benz Corporate Challenge 5k")