library(TTR)
## The examples below show the differences between using a
## High-Low-Close series, and just a close series when
## calculating Bollinger Bands.
data(ttrc)
bbands.HLC <- BBands( ttrc[,c("High","Low","Close")] )
bbands.close <- BBands( ttrc[,"Close"] )
