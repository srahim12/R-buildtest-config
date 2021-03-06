library(TraMineR)
## Defining a sequence object with the data in columns 10 to 25
## (family status from age 15 to 30) in the biofam data set
data(biofam)
biofam.lab <- c("Parent", "Left", "Married", "Left+Marr",
"Child", "Left+Child", "Left+Marr+Child", "Divorced")
biofam.seq <- seqdef(biofam, 10:25, labels=biofam.lab)
## State distribution
biofam.statd <- seqstatd(biofam.seq)
## State distribution plot (default type="d" option)
plot(biofam.statd)
## Entropy index plot
plot(biofam.statd, type="Ht")
