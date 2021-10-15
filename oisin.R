library(ggplot2)
library(dplyr)

b<-read.table("ref/oisin.csv", header=T)


pdf("ref/oisin.pdf", width=5, height=3)

b %>%
	ggplot(aes(x=obs/1e6, y=time, weight=1/sqrt(time))) + geom_point() +
	xlab("n (M records)") + ylab("t (seconds)") +
	geom_smooth(method="lm", se=TRUE, fullrange=TRUE, level=0.95,
		formula = y ~ I(x^2))

dev.off()
