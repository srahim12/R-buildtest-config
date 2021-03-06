library(adegenet)
## data(dapcIllus), data(eHGDP), and data(H3N2) illustrate the dapc
## see ?dapcIllus, ?eHGDP, ?H3N2
##
## Not run:
example(dapcIllus)
example(eHGDP)
example(H3N2)
## End(Not run)
## H3N2 EXAMPLE ##
data(H3N2)
pop(H3N2) <- factor(H3N2$other$epid)
dapc1 <- dapc(H3N2, var.contrib=FALSE, scale=FALSE, n.pca=150, n.da=5)
## remove internal segments and ellipses, different pch, add MStree
scatter(dapc1, cell=0, pch=18:23, cstar=0, mstree=TRUE, lwd=2, lty=2)
## label individuals at the periphery
# air = 2 is a measure of how much space each label needs
# pch = NA suppresses plotting of points
scatter(dapc1, label.inds = list(air = 2, pch = NA))
## only ellipse, custom labels
scatter(dapc1, cell=2, pch="", cstar=0, posi.da="top",
label=paste("year\n",2001:2006), axesel=FALSE, col=terrain.colors(10))
## SHOW COMPOPLOT ON MICROBOV DATA ##
data(microbov)
dapc1 <- dapc(microbov, n.pca=20, n.da=15)
compoplot(dapc1, lab="")
## Not run:
## EXAMPLE USING GENLIGHT OBJECTS ##
## simulate data
x <- glSim(50,4e3-50, 50, ploidy=2)
x
plot(x)
## perform DAPC
dapc1 <- dapc(x, n.pca=10, n.da=1)
dapc1
## plot results
scatter(dapc1, scree.da=FALSE)
## SNP contributions
loadingplot(dapc1$var.contr)
loadingplot(tail(dapc1$var.contr, 100), main="Loading plot - last 100 SNPs")
## USE "PREDICT" TO PREDICT GROUPS OF NEW INDIVIDUALS ##
## load data
data(sim2pop)
## we make a dataset of:
## 30 individuals from pop A
## 30 individuals from pop B
## 30 hybrids
## separate populations and make F1
temp <- seppop(sim2pop)
temp <- lapply(temp, function(e) hybridize(e,e,n=30)) # force equal popsizes
## make hybrids
hyb <- hybridize(temp[[1]], temp[[2]], n=30)
## repool data - needed to ensure allele matching
newdat <- repool(temp[[1]], temp[[2]], hyb)
pop(newdat) <- rep(c("pop A", "popB", "hyb AB"), c(30,30,30))
## perform the DAPC on the first 2 pop (60 first indiv)
dapc1 <- dapc(newdat[1:60],n.pca=5,n.da=1)
## plot results
scatter(dapc1, scree.da=FALSE)
## make prediction for the 30 hybrids
hyb.pred <- predict(dapc1, newdat[61:90])
hyb.pred
## plot the inferred coordinates (circles are hybrids)
points(hyb.pred$ind.scores, rep(.1, 30))
## look at assignment using assignplot
assignplot(dapc1, new.pred=hyb.pred)
title("30 indiv popA, 30 indiv pop B, 30 hybrids")
## image using compoplot
compoplot(dapc1, new.pred=hyb.pred, ncol=2)
title("30 indiv popA, 30 indiv pop B, 30 hybrids")
## CROSS-VALIDATION ##
data(sim2pop)
xval <- xvalDapc(sim2pop@tab, pop(sim2pop), n.pca.max=100, n.rep=3)
xval
boxplot(xval$success~xval$n.pca, xlab="Number of PCA components",
ylab="Classification succes", main="DAPC - cross-validation")
## End(Not run)
