library(ade4)
wkrandtest <- as.krandtest(obs=c(0,1.2,2.4,3.4,5.4,20.4),sim=matrix(rnorm(6*200),200,6))
wkrandtest
plot(wkrandtest)

