library(timereg)
data(melanoma)
help(melanoma)

out=survfit(Surv(days/365,status==1) ~+1 ,data=melanoma)
plot(out)
title(main="Melanoma data")

###pdf("mela-sex.pdf")
out=survfit(Surv(days/365,status==1) ~+sex ,data=melanoma)
plot(out,col=1:2)
title(main="Melanoma data")
###dev.off()

out=survdiff(Surv(days/365,status==1) ~+sex ,data=melanoma)
out

###pdf("mela-sex-nelson-aalen.pdf")
outna=survfit(Surv(days/365,status==1) ~+sex ,data=melanoma)
plot(outna,fun="cumhaz")
title(main="cumulative hazard")
###dev.off()

outna <- aalen(Surv(days/365,status==1)~-1+factor(sex),data=melanoma)
par(mfrow=c(1,2))
plot(outna)

attach(melanoma)
table(sex,ulc)

out=survdiff(Surv(days/365,status==1) ~+sex +strata(ulc),data=melanoma)
out

groupthick <- cut(thick,breaks=quantile(thick),include.lowest=TRUE)

table(groupthick,ulc)