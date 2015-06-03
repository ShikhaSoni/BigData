#  Age Wise Education Details. 
 
 #savehistory("~/.Rhistory")
 #save.image("~/.RData")
 library(ggplot2)
 library(reshape2)
 library(plyr)
 library(scales)
 
 
 #ggplot(education_analysis, aes(x=education, fill=as.factor(age))) + geom_histogram(binwidth=.5, color="black")
 
 education_analysis=read.csv("education-analysis.csv",header=TRUE)
 
 dat.agg <- ddply(education_analysis, .var = c("sex", "education"), .fun = summarise,
                  cat1.n = length(education),
                  eighteen = sum(age %in% "18"),
                  two7 = sum(age %in% "27"),
                  fifth8 = sum(age %in% "58"),
                  sixty5 = sum(age %in% "65")
 )
 
 #ggplot(dat.agg, aes(x = education)) + geom_bar(aes(weight = cat1.n, fill = sex), position = "dodge") + geom_bar(aes(weight = eighteen, fill = sex), position = "dodge") + geom_bar(aes(weight = two7, fill = sex), position = "dodge") + geom_bar(aes(weight = fifth8, fill = sex), position = "dodge") + scale_fill_manual(values = c(alpha("#1F78B4", 0.5), alpha("#33A02C", 0.5))) + theme(axis.text.x = element_text(angle = 45, hjust = 1))
 
 ggplot(dat.agg, aes(x = education)) + geom_bar(aes(weight = cat1.n, fill = sex), position = "dodge") + geom_bar(aes(weight = eighteen, fill = sex), position = "dodge") + geom_bar(aes(weight = two7, fill = sex), position = "dodge") + geom_bar(aes(weight = fifth8, fill = sex), position = "dodge") + scale_fill_manual(values = c(alpha("#1F78B4", 0.5), alpha("#33A02C", 0.5))) + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + ggtitle("Age wise education for particular gender") 