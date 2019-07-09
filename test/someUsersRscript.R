# A toy R script

system("mkdir ../output")

set.seed(2000234)

png("../output/aFigure.png")
boxplot(rnorm(50, 5), rnorm(50, 7), las=1, 
        col = c("coral", "dodgerblue3"), 
        names = c("avg 5", "avg 7"),
        ylab="random numbers")
title("Normal Distribution")
dev.off()
