library(gdata)
a <- matrix(rnorm(12),ncol=4,nrow=3)
b <- 1:4
combine(a,b)
combine(x=a,b)
combine(x=a,y=b)
combine(a,b,names=c("one","two"))
c <- 1:6
combine(b,c)
