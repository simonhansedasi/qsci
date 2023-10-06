rm(list = ls())
df <- read.csv('SturgeonData.csv')
mean_length = mean(df$Length)
median_length = median(df$Length)
var = var(df$Length)
sd = sd(df$Length)

cv = sd / mean_length

# qnorm(2000,mean_length,sd)
library(readr)
print(df)
