---
title: "ANOVA and Linear Regression Using R"
author: "DR LEONARD KITI & ALEX MUTUKU"
date: "Saturday, February 07, 2015"
output: beamer_presentation
---

## ANOVA 

**Basic ANOVA SITUATION**

Consider Two variables: 1 Categorical, 1 Quantitative

Main Question: Do the means of the quantitative variables depend on which group the individual is in?

If categorical variable has only 2 values: 
 2-sample t-test 

ANOVA allows for 3 or more groups

## ANOVA
**Exploratory Data analysis**
Graphical investigation: 
 1.Side-by-side box plots
 2.Multiple histograms

**What ANOVA does**
H0: The means of all the groups are equal.

Ha: Not all the means are equal
Doesn’t say how or which ones differ.Follow up with “multiple comparisons”

Whether the differences between the groups are significant depends on;- 
 a) The difference in the means
 b) The standard deviations of each group
 c) The sample sizes

ANOVA determines P-value from the F statistic

## 

![Figure 1](distribution.png)

  - Bigger sample size, less variability in sample means: $s.e.=SD\sqrt{n}$
  - Average value of sample means is equal to the population mean
  - Sample means follow normal distribution if the distribution in the population is normal
  - and if n is large, is roughly normal even if the population is not normal
  
 
## 

![Figure 2](distrbution2.png)


***
  - If we repeated our sampling many times, 95% of sample means   would be within 2 standard errors of the population mean.
  - In practice we usually have only one sample but we   can use the sample data to quantify the uncertainty in our single estimate


## 

95% of sample means lie within 2 s.e. of the population mean
 so we can also say: 95% of the time the population mean will lie within 2 s.e. of the our sample mean

![Figure 3](distribution_3.png)

## Confidence interval on $\mu$ ($\alpha$ known) 

$$
P(-1.96 <= \frac{P(\bar{X}- \mu)}{\frac{\alpha}{\sqrt{n}}}) = 0.95
$$

$$
P(\bar{X} -1.96\frac{\alpha}{\sqrt{n}} <= \mu <= \bar{X} +1.96\frac{\alpha}{\sqrt{n}}) = 0.95
$$

$$
(\bar{X} -1.96\frac{\alpha}{\sqrt{n}}, \bar{X} +1.96\frac{\alpha}{\sqrt{n}})
$$

is a 95% confidence interval for $\mu$

##

A survey of haemoglobin status in children $<$ 5yrs in Kilifi district.
30 children gave a finger prick blood sample and the mean Hb was 9.6g/dl with a standard deviation of 1.5 g/dl.

- Sample estimate of the SD:  1.5 g/dl
- Standard error  $s.e.=SD\sqrt{n}$


```r
se <- 1.55/sqrt(30)
lower_ci <- 9.6-(2*se)
upper_ci <- 9.6+(2*se)
```
 
- Interpretation: we can say with 95% confidence that the mean Haemoglobin concentration in children in the population could be as small as 9.03402 or as big as 10.16598  g/dl

## Slide with R Code and Output


```r
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

## Slide with Plot

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png) 
cabal update
cabal install pandoc
