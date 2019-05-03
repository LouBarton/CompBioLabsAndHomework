#Louise Barton FINAL PROJECT 
#3 May 2019 

#Read in and clean up data files 
tubedata <- read.csv("tubelength.csv")
data <- read.csv("DATA.csv")
#levels(data$from) #levels has a typo 
    levels(data$from) <- c("high","low","low")
    levels(data$at) <- c("high","low")
#round output 
    data$output <- round(data$output,digits=0)
#make pair a factor 
    data$pair <- as.factor(data$pair)

#subet high and low pops
    highpop <- subset(data, at == "high")
    lowpop <- subset(data, at == "low")

#seeds equal to zero 
data$seeds[is.na(data$seeds)] <- 0
data$seeds

##-------------------------------------------------------##

#Histograms
#nectar tube length= normal
    hist(tubedata$tube, xlab="tube length(mm)", ylab="count", col="grey",
         main="tube length(mm)") 
#mean number of pollen grains= bimodal 
    hist(data$pollen, xlab="mean # of pollen grains/stigma", 
         ylab="count", col="grey", main="mean # of pollen grains/stigma") 
#mean number of fruit= Poisson or neg binomial 
    hist(data$fruits, xlab="mean # of fruit", ylab="count", col="grey", 
         main= "mean # of fruit")

##-------------------------------------------------------##

#Summary plots for gradiant 
#tubes per plot 
    plot(tube.length~Altitude, data=tubedata, pch=16, col="firebrick", lty=2)
#Calculate means per plot and save in new dataframe 
    library(tidyverse)
    tube.means <- summarize(group_by(tubedata, Altitude), meantube=mean(tube.length))
#linear model 
    tube.lm <- lm(tube.length~Altitude, data=tubedata)
    summary(tube.lm)
#check fit of linear model 
    #Residual plot 
    tubedata$res <- resid(tube.lm)
    {plot(res ~ Altitude, data=tubedata, pch=16, cex=1, cex.lab=1.5, col="firebrick", 
          xlab="Altitude", ylab= "Residuals") 
        abline(h=0, lty=2)}
    #qqnorm 
    qqnorm(tubedata$res)
    {plot(tube.length~Altitude, data=tube.data, pch=16, cex=0.7, col="firebrick", lty=2,
          main="nectar tube length with altitude", ylab="Nectar tube length (mm)", xlab="Altitude (m)")
        abline(tube.lm, lwd=2, lty=2)}

#scatter plot with confidence intervals 
    xvals <- seq(from=2000, to=3000, by=50)
    xvals[1:10]
    species <- rep("zalu", length(xvals))
    df <- data.frame(Altitude=xvals, species=species)
    CI <- as.data.frame(predict(tube.lm, newdata=df, interval="confidence"))
#plot all data 
    {plot(tube.length~Altitude, data = tubedata,
          pch = 16, cex=.7, xlab="altitude(m)", ylab="nectar tube length(mm)", main="nectar tube length and altitude")
        lines(x = df$Altitude, y = CI$fit, lwd = 1)
        lines(x = df$Altitude, y = CI$lwr, lwd=1, lty="dashed")
        lines(x = df$Altitude, y = CI$upr, lwd=1, lty="dashed")
        
    }    
#plot means only
    {plot(meantube~Altitude, data = tube.means,
          pch = 16, cex=.7, xlab="altitude(m)", ylab="nectar tube length(mm)", main="nectar tube length and altitude")
        lines(x = df$Altitude, y = CI$fit, lwd = 1)
        lines(x = df$Altitude, y = CI$lwr, lwd=1, lty="dashed")
        lines(x = df$Altitude, y = CI$upr, lwd=1, lty="dashed")
        
    }  

#plot using ggplot 
ggplot(data=tubedata, aes(x=Altitude, y=tube.length, group=1)) +
    geom_point() + 
    ylab("Floral Nectar Tube Length (mm)") +
    theme(axis.text.x=element_text(angle=70, vjust=0.5)) +
    scale_x_continuous("Altitude(m) ", labels = as.character(tubedata$Altitude), breaks=tubedata$Altitude)+
    geom_line(data=tube.means, mapping=aes(x=Altitude, y=meantube, color="firebrick")) 

#boxplot sytle 
tubedata$Altitude <- as.factor(tubedata$Altitude)
ggplot(tubedata, aes(x=Altitude, y=tube.length, fill=exp)) +
    geom_boxplot(alpha=0.3) + 
    ylab("Floral Nectar Tube Length (mm)") +
    theme(legend.position="none") +
    scale_fill_brewer(palette="Dark2") + 
    theme(axis.text.x=element_text(angle=70, vjust=0.5)) 

ggplot(tubedata, aes(x=Altitude, y=tube.length, fill=exp)) +
    geom_boxplot(alpha=0.3) + 
    ylab("Floral Nectar Tube Length (mm)") +
    scale_fill_brewer(palette="Dark2", name="Translocation sites", labels=c("Not included", "low", "high")) + 
    theme(axis.text.x=element_text(angle=70, vjust=0.5)) 
       
##-------------------------------------------------------##   
      
#output from translocations 
    outputmeans <- tapply(data$OF, data$combo, mean)
    outputsds <- tapply(data$OF, data$combo, sd)
    
    {stripchart(OF~combo, data=data, 
                method = "jitter", vertical = TRUE, pch=16, ylab= "output (seeds*fruit)",
                main="Reproductive output STAND")
        segments(x0 = c(1:4), x1=c(1:4), y0 = outputmeans-outputsds, y1=outputmeans+outputsds, lwd = 3,)
        points (x = c(1:4), y = outputmeans, cex = 1, pch=18)}

#2 way anova for interaction graph: violates assumptions but visually cool 
    anova.output <- aov(OF ~ from * at, data=data)
    summary(anova.output)
    stderr <- function(x)sd(x)/sqrt(length(x))
    means <- aggregate(OF ~ from * at, data=data, FUN=mean)
    sderr <- aggregate(OF ~ from * at, data=data, FUN=stderr)
    palette(c("firebrick", "goldenrod"))
    {interaction.plot(data$from, data$at, response = predict(anova.output),
                      trace.label = "origin of plant", las = 1, ylab = "Standardized Output",
                      xlab = "site", ylim = c(0,40), lwd = 1.5, col = 1:2)
        points(OF ~ from, data = subset(means, at == "high"), pch = 16, col = "firebrick")
        points(OF ~ from, data = subset(means, at == "low"), pch = 16, col = "goldenrod") 
        segments( x0 = c(1,2), x1 =c(1,2),
                  y0 = means$OF[1:2] - 2*sderr$OF[1:2],
                  y1 = means$OF[1:2] + 2*sderr$OF[1:2],
                  col ="firebrick", lwd = 2) 
        segments( x0 = c(1,2), x1 =c(1,2),
                  y0 = means$OF[3:4] - 2*sderr$OF[3:4],
                  y1 = means$OF[3:4] + 2*sderr$OF[3:4],
                  col ="goldenrod", lwd = 2)
    }
    