library(ggplot2)
library(dplyr)

b<-data.frame(n=c(1,2,4,8,10), t=c(10,24,69,201,297))

pdf("sort-bench.pdf", width=6, height=3)

b %>%
	ggplot(aes(x=n, y=t)) + geom_point() +
	xlab("n (M records)") + ylab("t (seconds)") +
	geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95,
		formula = y ~ x + I(x*log(x))) %>%
	print

dev.off()
