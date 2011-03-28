theData <- read.csv('~/Dropbox/development/R/corporate5k/data/all_times.tsv',header=FALSE,sep='\t',stringsAsFactors=FALSE)
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
p + geom_boxplot(aes(alpha=.4,fill=gender)) + coord_flip() + geom_point(shape=4,size=6,aes(colour=cbsi_runners$gender)) + opts(title="Finishing times for CBSi 5k participants - 2011 Mercedes-Benz Corporate Challenge, Ft. Lauderdale")

# density plots of male/female finishing times

plot(density(cbsi_runners[cbsi_runners$gender=="Male",]$minutes),main="Male CBSi participant times",sub="2011 Mercedes Benz Corporate Challenge 5k")

plot(density(cbsi_runners[cbsi_runners$gender=="Female",]$minutes),main="Female CBSi participant times",sub="2011 Mercedes Benz Corporate Challenge 5k")

# combined density plot
m<-ggplot(cbsi_runners,aes(x=minutes))
m+geom_density(aes(alpha=.65,fill=factor(gender))) + scale_x_continuous(limits =c(10,90)) + opts(title="Distribution of finishing times for CBSi 5k participants")


ddply(theData,"team",function(dat) c(nrow(dat),median(dat$minutes),mean(dat$minutes),min(dat$minutes),max(dat$minutes)))


# produce team summary
team_summary <- ddply(theData,"team",function(dat) c(nrow(dat),nrow(dat[dat$gender=="Male",]),nrow(dat[dat$gender=="Female",]),median(dat$minutes),mean(dat$minutes),mean(dat[dat$gender=="Male",]$minutes),mean(dat[dat$gender=="Female",]$minutes),min(dat$minutes),max(dat$minutes)))
names(team_summary) <- c('team','participants','male_participants','female_participants','median_time','average_time','average_male_time','average_female_time','minimum_time','maximum_time')