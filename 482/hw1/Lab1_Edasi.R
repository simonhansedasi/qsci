# LAB1: Intro R Lab in QSCI482
# 29 September 2023 created by Simon Hans Edasi sa42@uw.edu
a = 0.00021
b = 3.1
L = 30
# b has 1 significant digit so we round to 1 sigfig
W = (a * L**b)
W_ = round(W,1)
print(W_)


bluelengths = rnorm(100,84.4,4.07)
print(bluelengths)
hist(bluelengths)
max(bluelengths)


max(rnorm(100000,84.4,4.07))

cdata <- read.csv('CommuteTime.csv')
print(cdata)

commutetime <- cdata[1]
commutetime
Mean <- mean(commutetime$TotalCommuteMin)
SD <- sd(commutetime$TotalCommuteMin)

pUnder60 <- pnorm(60, Mean, SD)
library(glue)
glue('Probability commute will be less than 60 minutes =  {pUnder60}')

pOver60 = 1 - pUnder60
glue('Probability commute will be less than 60 minutes =  {pOver60}')

print('Trevor should be reassured he will be on time.')

