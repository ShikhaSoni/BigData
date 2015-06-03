# Prefered gender in a given industry
IndustryPlot<-sqldf("select industry_code 
                    from Employment
                    where industry_code!=' Not in universe or children'")

#X-Axis= Industry_code    Y-Axis= Total Count
ggplot(IndustryPlot, aes(x=industry_code))+
  geom_histogram(width=0.5)+
  xlab("Industry")+
  ylab("Total Count")+
  theme(axis.text.x=element_text(angle=90, size=12.5))+
  ggtitle('Population in a given industry')+
  theme(plot.title = element_text(size=20, face="bold", vjust=2))