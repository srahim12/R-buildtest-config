library(geiger)
AIC.scores <- c(3,7,-5, 6)
names(AIC.scores) <- c("model1", "model2", "model3", "model4")
aicw(AIC.scores)
