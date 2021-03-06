library(ade4)
data(bacteria)
w1 <- data.frame(t(bacteria$espcodon))
dudi1 <- dudi.coa(w1, scann = FALSE, nf = 4)
wit1 <- wca(dudi1, bacteria$code, scannf = FALSE)
kta1 <- ktab.within(wit1)
plot(statis(kta1, scann = FALSE))
kta2 <- kta1[kta1$blo>3]
kplot(mfa(kta2, scann = FALSE))
