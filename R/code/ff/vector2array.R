library(ff)
vector2array(1:12, dim=c(3, 4)) # matrix(1:12, 3, 4)
vector2array(1:12, dim=c(3, 4), dimorder=2:1) # matrix(1:12, 3, 4, byrow=TRUE)

