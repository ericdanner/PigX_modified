
#BFP
dfBFP <- read.table("/home/edanner/workspace/pigx_crispr/myData/BFP/indelStats/BFP.coverageStats.tsv", header=TRUE)
plot(dfBFP$bp, dfBFP$NoDelRatio,
     type = "h",
     lwd = 2,
     xlab = "Base Position",
     main = "% of the 1100 BFP+ reads containing each base pair",
     ylab = "% of reads containing the base",
     ylim = c(0.5, 1))



plot(tapply(dfBFP$NoDelRatio, cut(dfBFP$bp, seq(1, 2072, by=5)), mean))



#venus
dfVENUS <- read.table("/home/edanner/workspace/pigx_crispr/myData/Venus/indelStats/VenusDel.coverageStats.csv", header=TRUE)

plot(dfVENUS$bp, dfVENUS$NoDelRatio,
     type = "h",
     lwd = 2,
     xlab = "Base Position",
     main = "% of the 5000 Venus+ reads containing each base pair",
     ylab = "% of reads containing the base",
     ylim = c(0.5, 1))

bin <- 10
binVenus <- tapply(dfVENUS$NoDelRatio, cut(dfVENUS$bp, seq(1, 1081, by=bin)), mean)
plot(binVenus, xlab = "BP", type = "h", lwd = 5)
barplot(binVenus)
binVenus
library(plyr)
ddply(dfVENUS$NoDelRatio, .(cut(dfVENUS$bp, 5)), colwise(mean))



#mCherry
dfmCherry <- read.table("/home/edanner/workspace/pigx_crispr/myData/mCherry/indelStats/BFP.mCherryStats.tsv", header=TRUE)

str(dfmCherry)
plot(dfmCherry$bp, dfmCherry$Ratio,
     type = "h",
     lwd = 2,
     xlab = "Base Position",
     main = "% of the 650 mCherry+ reads containing each base pair",
     ylab = "% of reads containing the base",
     ylim = c(0.5, 1))

binCHERRY <- tapply(dfmCherry$NoDelRatio, cut(dfmCherry$bp, seq(1, 1900, by=5)), mean)

plot(binCHERRY)
plot(binCHERRY, type = "h", lwd = 3, ylim=c(0, 1))


