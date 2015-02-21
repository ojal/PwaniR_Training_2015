# CHECK OF PROPORTIONAL HAZARDS
# ----------------------------

# A simple method is to fit a stratified Cox model, where we stratify according 
# to the levels of a categorical covariate, and plot the stratum-specific 
# cumulative baseline hazard estimates on a log-scale.
# If we have proportional hazards, the curves should be fairly parallel 
# (i.e. have a constant vertical distance).

# We first check for sex:
fit.stslogtu=coxph(Surv(days/365,status==1)~strata(sex)+
                     factor(ulc)+log(thick), data=melanoma)
summary(fit.stslogtu)
plot(survfit(fit.stslogtu,
             fun="cumhaz",lty=1:2,log=T,mark.time=F,xlim=c(0,10)))

# Proportionallity seems ok.


# We then check for ulceration:
fit.slogtstu=coxph(Surv(lifetime,status==1)~factor(sex)+strata(ulcer)+log2thick, data=melanoma)
plot(survfit(fit.slogtstu,newdata=data.frame(sex=1,log2thick=0)),fun="cumhaz",lty=1:2,log=T,mark.time=F,xlim=c(0,10))

# The curves are fairly parallel, except for the first two years


# Finally we check for thickness:
fit.ssttstu=coxph(Surv(lifetime,status==1)~factor(sex)+factor(ulcer)+strata(thick.group), data=melanoma)
plot(survfit(fit.ssttstu,newdata=data.frame(sex=1,ulcer=1)),fun="cumhaz",lty=1:4,log=T,mark.time=F,xlim=c(0,10))

# There is a tendency that the curves are closer together for large values 
# of t than for smaller ones, indicating a non-proportional effect of thickness


# We then make a formal test for proportionality of the covariates. 
# This is done by, for each covariate x, adding time-dependent covariate x*log(t), 
# and testing whether the time-dependent covariates are significant using a score test:
cox.zph(fit.slogtu,transform='log')

# The test indicates that the effect of tumor-thickness is not proportional.
# The estimate we get for log-thicness in then a weighted average of the time-varying effect


#We also make plots that give nonparametric estimates of the (possible) time dependent 
# effect of the covariates:
par(mfrow=c(1,3))
plot(cox.zph(fit.slogtu))
