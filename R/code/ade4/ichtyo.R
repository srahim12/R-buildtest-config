library(ade4)
data(ichtyo)
dudi1 <- dudi.dec(ichtyo$tab, ichtyo$eff, scannf = FALSE)
s.class(dudi1$li, ichtyo$dat, wt = ichtyo$eff / sum(ichtyo$eff))

