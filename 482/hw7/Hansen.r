library(tidyr)

rm(list = ls())
HansenWide <- read.csv('~/coding/qsci/482/hw7/HansenCreekMortality.csv')
colnames(HansenWide) <- HansenWide[1,]
HansenWide <- HansenWide[-1, ]
HansenWide <- HansenWide[,-1]
HansenWide[HansenWide == ''] <- NA
HansenLong <- gather(HansenWide,key = 'Death',value = 'Length', na.rm = TRUE)

N <- length(HansenLong[,1])
k <- ncol(HansenWide)
var1 <- var(HansenWide$Stranded,na.rm = TRUE)
var2 <- var(HansenWide$Eagle,na.rm = TRUE)
var3 <- var(HansenWide$Bear,na.rm = TRUE)
var4 <- var(HansenWide$Prespawn,na.rm = TRUE)
print(var1 / var2)
print(var1 / var3)
print(var1 / var4)

print(var2 / var3)
print(var2 / var4)

print(var3 / var4)

print('Variance ratios are all good, we can do aov')

aov.res <- aov(Length~Death, data = HansenLong)

print(TukeyHSD(aov.res,ordered = TRUE, conf.level = 0.95))

summary(aov.res)


ems <- 15035 / N-k

N
# nb <- nrow(as.integer(HansenWide[,"Prespawn"]))
# se <- sqrt(ems + ((1/2)*((1/nrow(HansenWide$Prespawn) + 1/nrow(HansenWide$Eagle)))))
# se

eagle <- HansenWide$Eagle[!is.na(HansenWide$Eagle)]
em <- mean(as.integer(eagle))
prespawn <- HansenWide$Prespawn[!is.na(HansenWide$Prespawn)]
pm <- mean(as.integer(prespawn))

nb <- length(prespawn)
na <- length(eagle)

se <- sqrt(ems + ((1/2) * ((1/nb) + (1/na))))
se
q <- (em - pm) / se
q
print(ptukey(q,nmeans = k,df = N-k))
print('Tukey HSD built in does not seem to use Tukey-Kramer')


