---
title: "Chapter 3: Multiple regression Analysis: estimation"
author: "Marjorie Blanco"
date: "12/19/2018"
output:
  html_document:
    toc: true
    toc_float: true
    number_sections: true
---



# Multiple regression Analysis: estimation

## Formula

$$wage =  \beta_0 + \beta_1 * educ + \beta_2 * exper + u$$

The coefficient of interest for policy purposes is $\beta_1$, the ceteris paribus effect of expend on avgscore

$$avgscore =  \beta_0 + \beta_1 * expend + \beta_2 * avginc + u$$

$\beta_2$, measures the ceteris paribus effect of exper on wage


$$cons =  \beta_0 + \beta_1 * inc + \beta_2 * inc^{2} + u$$

$$\tilde{\beta_1} = \hat{\beta_1} + \hat{\beta_2} + \tilde{\delta_1} $$
The simple regression coefficient $\tilde{\beta_1}$ does not usually equal the multiple $\hat{\beta_1}$.

$\tilde{\delta_1}$ is the slope coefficient from the simple regression of $x_{i2}$ on $x_{i1}$.
$\tilde{\delta_1}$ differs from the partial effect of $x_1$ on $\hat{y}$.

The relationship between $\tilde{\delta_1}$ and $\hat{\beta_1}$ also shows there are two distinct cases where they are equal:
1. The partial effect of $x_2$ on $\hat{y}$ is zero in the sample. That is, $\hat{\beta_2}$ = 0.
2. $x_1$ and $x_2$ are uncorrelated in the sample. That is, $\tilde{\delta_1}$ = 0.

## Explore

A simple model to explain city murder rates (murdrate) in terms of the probability of conviction (prbconv) and average sentence length (avgsen) is

$$murdrate =  \beta_0 + \beta_1 * prbconv + \beta_2 * avgsen + u$$

What are some factors contained in u? Do you think the key assumption (3.5) is likely to hold?

In Example 3.1, the OLS fitted line explaining college GPA in terms of high school GPA and ACT score is

$$colGPA =  1.29 + .453 * hsGPA + .0094 * ACT$$

If the average high school GPA is about 3.4 and the average ACT score is about 24.2, what is the average college GPA in the sample?


```
## 
## Call:
## lm(formula = colGPA ~ hsGPA + ACT, data = gpa1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.85442 -0.24666 -0.02614  0.28127  0.85357 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.286328   0.340822   3.774 0.000238 ***
## hsGPA       0.453456   0.095813   4.733 5.42e-06 ***
## ACT         0.009426   0.010777   0.875 0.383297    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3403 on 138 degrees of freedom
## Multiple R-squared:  0.1764,	Adjusted R-squared:  0.1645 
## F-statistic: 14.78 on 2 and 138 DF,  p-value: 1.526e-06
```



```
## $fit
##        1 
## 3.056187 
## 
## $se.fit
## [1] 0.02866556
## 
## $df
## [1] 138
## 
## $residual.scale
## [1] 0.3403158
```

In the previous example, if we use as explanatory variables expendA, expendB, and shareA, where shareA = 100(expendA/ totexpend) is the percentage share of total campaign expenditures made by Candidate A, does this violate Assumption MLR.3?

## Example 3.1

The variables in GPA1 include the college grade point average (colGPA), high school GPA (hsGPA), and achievement test score (ACT) for a sample of 141 students from a large university; both college and high school GPAs are on a four-point scale. We obtain the following OLS regression line to predict college GPA from high school GPA and achievement test score:




```
## 
## Call:
## lm(formula = colGPA ~ hsGPA + ACT, data = gpa1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.85442 -0.24666 -0.02614  0.28127  0.85357 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.286328   0.340822   3.774 0.000238 ***
## hsGPA       0.453456   0.095813   4.733 5.42e-06 ***
## ACT         0.009426   0.010777   0.875 0.383297    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3403 on 138 degrees of freedom
## Multiple R-squared:  0.1764,	Adjusted R-squared:  0.1645 
## F-statistic: 14.78 on 2 and 138 DF,  p-value: 1.526e-06
```

The intercept 1.29 is the predicted college GPA if hsGPA and ACT are both set as zero. Since no one who attends college has either a zero high school GPA or a zero on the achievement test. 

hsGPA is associated with .453 of a point on the college GPA, or almost half a point. 

The sign on ACT implies that, while holding hsGPA fixed, a change in the ACT score of 10 points—a very large change, since the maximum ACT score is 36 and the average score in the sample is about 24 with a standard deviation less than three—affects colGPA by less than one-tenth of a point.  The ACT score is not a strong predictor of college GPA and statistically insignificant.


```
## 
## Call:
## lm(formula = colGPA ~ ACT, data = gpa1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.85251 -0.25251 -0.04426  0.26400  0.89336 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.40298    0.26420   9.095  8.8e-16 ***
## ACT          0.02706    0.01086   2.491   0.0139 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3656 on 139 degrees of freedom
## Multiple R-squared:  0.04275,	Adjusted R-squared:  0.03586 
## F-statistic: 6.207 on 1 and 139 DF,  p-value: 0.0139
```

## Example 3.2

Using the 526 observations on workers in WAGE1, we include educ (years of education), exper (years of labor market experience), and tenure (years with the current employer) in an equation explaining log(wage). The estimated equation is

$$log(wage) =  0.284 + 0.092 educ + 0.0041 exper + 0.022 tenure$$




```
## 
## Call:
## lm(formula = lwage ~ exper + tenure, data = wage1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.18698 -0.36511 -0.05057  0.31486  1.45326 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.533650   0.035222  43.542  < 2e-16 ***
## exper       -0.002669   0.001865  -1.431    0.153    
## tenure       0.026455   0.003504   7.550 1.95e-13 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5026 on 523 degrees of freedom
## Multiple R-squared:  0.1095,	Adjusted R-squared:  0.1061 
## F-statistic: 32.14 on 2 and 523 DF,  p-value: 6.825e-14
```

The coefficients have a percentage interpretation.  The coefficient 0.092 means that, holding exper and tenure fixed, another year of education is predicted to increase log(wage) by 0.092, which translates into an approximate 9.2% increase in wage.

The coefficient 0.0041 means that, holding educ and tenure fixed, another year of experience is predicted to increase log(wage) by 0.0041, which translates into an approximate 0.4% increase in wage.

The coefficient 0.022 means that, holding educ and exper fixed, another year of tenure is predicted to increase log(wage) by 0.022, which translates into an approximate 2.2% increase in wage.

## Example 3.3

We use the data in 401K to estimate the effect of a plan’s match rate (mrate) on the participation rate (prate) in its 401(k) pension plan. The match rate is the amount the firm contributes to a worker’s fund for each dollar the worker contributes (up to some limit); thus, mrate 5 .75 means that the firm contributes 75¢ for each dollar contributed by the worker. The participation rate is the percentage of eligible workers having a 401(k) account. The variable age is the age of the 401(k) plan. There are 1,534 plans in the data set, the average prate is 87.36, the average mrate is .732, and the average age is 13.2.

Regressing prate on mrate gives

$$prate =  83.076 + 5.861 mrate$$

Regressing prate on mrate, age gives

$$prate =  80.12 + 5.52 mrate + 243 age$$





```
## 
## Call:
## lm(formula = prate ~ mrate, data = k401k)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -82.303  -8.184   5.178  12.712  16.807 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  83.0755     0.5633  147.48   <2e-16 ***
## mrate         5.8611     0.5270   11.12   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 16.09 on 1532 degrees of freedom
## Multiple R-squared:  0.0747,	Adjusted R-squared:  0.0741 
## F-statistic: 123.7 on 1 and 1532 DF,  p-value: < 2.2e-16
```


```
## 
## Call:
## lm(formula = prate ~ mrate + age, data = k401k)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -81.162  -8.067   4.787  12.474  18.256 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  80.1191     0.7790  102.85  < 2e-16 ***
## mrate         5.5213     0.5259   10.50  < 2e-16 ***
## age           0.2432     0.0447    5.44 6.21e-08 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.94 on 1531 degrees of freedom
## Multiple R-squared:  0.09225,	Adjusted R-squared:  0.09106 
## F-statistic: 77.79 on 2 and 1531 DF,  p-value: < 2.2e-16
```

The simple regression estimate of the effect of mrate on prate is clearly different from the multiple regression estimate, but the difference is not very big.

The simple regression estimate is only about 6.2% larger than the multiple regression estimate.  This can be explained by the fact that the sample correlation between mrate and age is only 0.12.


```
## [1] 0.1187841
```


## Example 3.4


```
## 
## Call:
## lm(formula = colGPA ~ hsGPA + ACT, data = gpa1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.85442 -0.24666 -0.02614  0.28127  0.85357 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.286328   0.340822   3.774 0.000238 ***
## hsGPA       0.453456   0.095813   4.733 5.42e-06 ***
## ACT         0.009426   0.010777   0.875 0.383297    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3403 on 138 degrees of freedom
## Multiple R-squared:  0.1764,	Adjusted R-squared:  0.1645 
## F-statistic: 14.78 on 2 and 138 DF,  p-value: 1.526e-06
```


This means that hsGPA and ACT together explain about 17.6% of the variation in college GPA for this sample of students. This may not seem like a high percentage, but we must remember that there are many other factors—including family background, personality, quality of high school education, affinity for college—that contribute to a student’s college performance. If hsGPA and ACT explained almost all of the variation in colGPA, then performance in college would be preordained by high school performance!

## Example 3.5

CRIME1 contains data on arrests during the year 1986 and other information on 2,725 men born in either 1960 or 1961 in California. Each man in the sample was arrested at least once prior to 1986. The variable narr86 is the number of times the man was arrested during 1986: it is zero for most men in the sample (72.29%), and it varies from 0 to 12. (The percentage of men arrested once during 1986 was 20.51.) The variable pcnv is the proportion (not percentage) of arrests prior to 1986 that led to conviction, avgsen is average sentence length served for prior convictions (zero for most people), ptime86 is months spent in prison in 1986, and qemp86 is the number of quarters during which the man was employed in 1986 (from zero to four).

A linear model explaining arrests is




```
## 
## Call:
## lm(formula = narr86 ~ pcnv + avgsen + ptime86 + qemp86, data = crime1)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -0.9330 -0.4247 -0.2934  0.3506 11.4403 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.706756   0.033151  21.319  < 2e-16 ***
## pcnv        -0.150832   0.040858  -3.692 0.000227 ***
## avgsen       0.007443   0.004734   1.572 0.115993    
## ptime86     -0.037391   0.008794  -4.252 2.19e-05 ***
## qemp86      -0.103341   0.010396  -9.940  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8414 on 2720 degrees of freedom
## Multiple R-squared:  0.04219,	Adjusted R-squared:  0.04079 
## F-statistic: 29.96 on 4 and 2720 DF,  p-value: < 2.2e-16
```
This equation says that, as a group, the three variables pcnv, ptime86, and qemp86 explain about 4.1% of the variation in narr86.


```
## 
## Call:
## lm(formula = narr86 ~ pcnv + ptime86 + qemp86, data = crime1)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -0.7118 -0.4031 -0.2953  0.3452 11.4358 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.711772   0.033007  21.565  < 2e-16 ***
## pcnv        -0.149927   0.040865  -3.669 0.000248 ***
## ptime86     -0.034420   0.008591  -4.007 6.33e-05 ***
## qemp86      -0.104113   0.010388 -10.023  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8416 on 2721 degrees of freedom
## Multiple R-squared:  0.04132,	Adjusted R-squared:  0.04027 
## F-statistic:  39.1 on 3 and 2721 DF,  p-value: < 2.2e-16
```
This equation says that, as a group, the three variables pcnv, avgsen, ptime86, and qemp86 explain about 4.1% of the variation in narr86.

Adding the average sentence variable increases $R^2$ from .0413 to .0422, a practically small effect. The sign of the coefficient on avgsen is also unexpected: it says that a longer average sentence length increases criminal activity.


```
## 
## Call:
## lm(formula = narr86 ~ pcnv + ptime86 + qemp86, data = crime1)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -0.7118 -0.4031 -0.2953  0.3452 11.4358 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  0.711772   0.033007  21.565  < 2e-16 ***
## pcnv        -0.149927   0.040865  -3.669 0.000248 ***
## ptime86     -0.034420   0.008591  -4.007 6.33e-05 ***
## qemp86      -0.104113   0.010388 -10.023  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8416 on 2721 degrees of freedom
## Multiple R-squared:  0.04132,	Adjusted R-squared:  0.04027 
## F-statistic:  39.1 on 3 and 2721 DF,  p-value: < 2.2e-16
```

## Example 3.6


```
## 
## Call:
## lm(formula = lwage ~ educ, data = wage1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.21158 -0.36393 -0.07263  0.29712  1.52339 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 0.583773   0.097336   5.998 3.74e-09 ***
## educ        0.082744   0.007567  10.935  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4801 on 524 degrees of freedom
## Multiple R-squared:  0.1858,	Adjusted R-squared:  0.1843 
## F-statistic: 119.6 on 1 and 524 DF,  p-value: < 2.2e-16
```

## Problem 1

Using the data in GPA2 on 4,137 college students, the following equation was estimated by OLS:
$$colgpa = 1.392 - .0135 hsperc + .00148 sat $$
$$n = 4137, R^{2} = .273$$
where colgpa is measured on a four-point scale, hsperc is the percentile in the high school graduating class (defined so that, for example, hsperc = 5 means the top 5% of the class), and sat is the combined math and verbal scores on the student achievement test.

(i) Why does it make sense for the coefficient on hsperc to be negative?

`hsperc` is defined so that the smaller it is, the higher the student’s standing in high school.  Everything else equal, the worse the student’s standing in high school, the expected college GPA is lower.

`hsperc` is the percentile in the high school graduating class.  As the percentile increases we expecte the college GPA to decrease.

(ii) What is the predicted college GPA when hsperc = 20 and sat = 1,050?




```
## 
## Call:
## lm(formula = colgpa ~ hsperc + sat, data = gpa2)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.6007 -0.3581  0.0329  0.3963  1.7599 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.392e+00  7.154e-02   19.45   <2e-16 ***
## hsperc      -1.352e-02  5.495e-04  -24.60   <2e-16 ***
## sat          1.476e-03  6.531e-05   22.60   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5615 on 4134 degrees of freedom
## Multiple R-squared:  0.2734,	Adjusted R-squared:  0.2731 
## F-statistic: 777.9 on 2 and 4134 DF,  p-value: < 2.2e-16
```


```
## $fit
##        1 
## 2.671407 
## 
## $se.fit
## [1] 0.008851742
## 
## $df
## [1] 4134
## 
## $residual.scale
## [1] 0.5615457
```

(iii) Suppose that two high school graduates, A and B, graduated in the same percentile from high school, but Student A’s SAT score was 140 points higher (about one standard deviation in the sample). What is the predicted difference in college GPA for these two students? Is the difference large?



The difference between A and B is simply 140 times the coefficient on `sat`, because `hsperc` is the same for both students.  So A is predicted to have colgpa 0.00148 (140) $\sim$ .207 higher.

(iv) Holding `hsperc` fixed, what difference in SAT scores leads to a predicted `colgpa` difference of .50, or one-half of a grade point? Comment on your answer.

$\Delta colgpa$  = .5, so .5 = 0.00148 $\Delta sat$, $\Delta sat$ = 337.8378378

A difference in SAT score of roughly two and one-half standard deviations is required to get predicted difference in college GPA of a half a point.
  

```
## [1] 139.4014
```

```
## $fit
##        1        2 
## 3.148463 3.647187 
## 
## $se.fit
##          1          2 
## 0.01530641 0.03239112 
## 
## $df
## [1] 4134
## 
## $residual.scale
## [1] 0.5615457
```

## Problem 2

The data in WAGE2 on working men was used to estimate the following equation: 

$$educ = 10.36 - .094 sibs + .131 meduc + .210 feduc$$
$$n = 722, R^{2} = .214$$
where `educ` is years of schooling, `sibs` is number of siblings, `meduc` is mother’s years of schooling, and `feduc` is father’s years of schooling.

(i) Does `sibs` have the expected effect? Explain. Holding `meduc` and `feduc` fixed, by how much does `sibs` have to increase to reduce predicted years of education by one year? (A noninteger answer is acceptable here.)




```
## 
## Call:
## lm(formula = educ ~ sibs + meduc + feduc, data = wage2)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.0906 -1.5957 -0.3677  1.6138  5.6103 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 10.36426    0.35850  28.910  < 2e-16 ***
## sibs        -0.09364    0.03447  -2.716  0.00676 ** 
## meduc        0.13079    0.03269   4.001 6.96e-05 ***
## feduc        0.21000    0.02747   7.644 6.79e-14 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.987 on 718 degrees of freedom
##   (213 observations deleted due to missingness)
## Multiple R-squared:  0.2141,	Adjusted R-squared:  0.2108 
## F-statistic:  65.2 on 3 and 718 DF,  p-value: < 2.2e-16
```


An increase in number of siblings (`sibs`) is associated with an 0.0936 decrease in the average monthly earnings and this effect is  `is statistically significant at 1%`.

(ii) Discuss the interpretation of the coefficient on `meduc`.

A year increase in mother's education (`meduc`) is associated with a 0.131 increase in the average monthly earnings and this effect is  `is statistically significant at 1%`.

(iii) Suppose that Man A has no siblings, and his mother and father each have 12 years of education. Man B has no siblings, and his mother and father each have 16 years of education. What is the predicted difference in years of education between B and A?



The predicted difference in years of education between B and A is 1.363165.

## Problem 3

The following model is a simplified version of the multiple regression model used by Biddle and Hamermesh (1990) to study the tradeoff between time spent sleeping and working and to look at other factors affecting sleep:

$$sleep =  \beta_0 + \beta_1 * totwrk + \beta_2 * educ + \beta_3 * age + u$$

where sleep and totwrk (total work) are measured in minutes per week and educ and age are measured in years. (See also Computer Exercise C3 in Chapter 2.)

(i) If adults trade off sleep for work, what is the sign of $\beta1$?

The sign would be negative if adults trade off sleep for work.  More work implies less sleep (other things equal), so  $\beta1$ < 0.




```
## 
## Call:
## lm(formula = sleep ~ totwrk + educ + age, data = sleep75)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2405.12  -236.50    14.53   253.87  1303.42 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 3638.24531  112.27511  32.405   <2e-16 ***
## totwrk        -0.14837    0.01669  -8.888   <2e-16 ***
## educ         -11.13381    5.88457  -1.892   0.0589 .  
## age            2.19988    1.44572   1.522   0.1285    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 419.4 on 702 degrees of freedom
## Multiple R-squared:  0.1134,	Adjusted R-squared:  0.1096 
## F-statistic: 29.92 on 3 and 702 DF,  p-value: < 2.2e-16
```

(ii) What signs do you think $\beta2$ and $\beta3$ will have?

* The sign could probably be negative for adults' education.

More educated people like to get more out of life (other things equal) so they sleep less ($\beta2$  < 0).

* The sign could probably be positive for adults' age.

Older people might want to sleep more (other things equal) ($\beta3$  < 0).


(iii) Using the data in SLEEP75, the estimated equation is

$$sleep =  3638.25 - .148 * totwrk - 11.13 * educ + 2.20 * age $$
$$n = 706, R^{2} = .113$$

If someone works five more hours per week, by how many minutes is sleep predicted to fall? Is this a large tradeoff?


```
## [1] -44.4
```

`totwrk` is in minutes, five hours must be converted into minutes:  $\Delta$ totwrk = 5(60) = 300.   `sleep` is predicted to decrease by -0.148 (300) = 44.4  minutes.  For a week, 45 minutes less sleep is not an overwhelming change therefore it is not a large tradeoff.

(iv) Discuss the sign and magnitude of the estimated coefficient on `educ`.

More education implies less predicted time sleeping, but the effect is small. Assume the difference between college and high school is four years, the college graduate sleeps about 35.52 minutes less per week holding other things equal.


```
## [1] -35.52
```

(v) Would you say `totwrk`, `educ`, and `age` explain much of the variation in sleep? What other factors might affect the time spent sleeping? Are these likely to be correlated with `totwrk`?

The Adjusted $R^{2}$ value is 0.1096. This tells us that 10.96% of the variation in mins sleep at night(per week), as quantified by `sleep`, is explained by `totwrk, educ, age`.

- Other factors might affect the time spent sleeping: health, marital status and number of children

## Problem 4


## Problem 5

In a study relating college grade point average to time spent in various activities, you distribute a survey to several students.

The students are asked how many hours they spend each week in four activities: studying, sleeping, working, and leisure. Any activity is put into one of the four categories, so that for each student, the sum of hours in the four activities must be 168.

(i) In the model

$$GPA =  \beta_0 + \beta_1 * study + \beta_2 * sleep + \beta_3 * work + \beta_4 * leisure + u$$

does it make sense to hold sleep, work, and leisure fixed, while changing study?

study + sleep + work + leisure = 168.  If we change study, at least one of the other categories must change so that the sum = 168.

(ii) Explain why this model violates Assumption MLR.3.

study is perfect linear function of the other independent variables

* study = 168 - sleep - work - leisure.

(iii) How could you reformulate the model so that its parameters have a useful interpretation and it satisfies Assumption MLR.3?

One option is to drop one of the independent variables such as leisure:

$$GPA =  \beta_0 + \beta_1 * study + \beta_2 * sleep + \beta_3 * work + u$$

$\beta_1$ is interpreted as the change in GPA when `study` increases by one hour, where sleep, work, and u are all held fixed.  If we are holding sleep and work fixed but increasing study by one hour, then we must be reducing leisure by one hour.  The other slope parameters have a similar interpretation.

## Problem 7

Which of the following can cause OLS estimators to be biased? 

(i) Heteroskedasticity

(ii) Omitting an important variable

omitting an important variable can cause bias and this is true only when the omitted variable is correlated with the included explanatory variables.

(iii) A sample correlation coefficient of .95 between two independent variables both included in the model.

## Problem 9

## Problem 11

The following equation describes the median housing price in a community in terms of amount of pollution (nox for nitrous oxide) and the average number of rooms in houses in the community (rooms):

$$log(price) =  \beta_0 + \beta_1 * log(nox) + \beta_2 * rooms + u$$

(i) What are the probable signs of $\beta_1$ and $\beta_2$? What is the interpretation of $\beta_1$? Explain.




```
## 
## Call:
## lm(formula = lprice ~ lnox + rooms, data = hprice2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.06485 -0.12331  0.00782  0.14471  1.38770 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  9.23374    0.18774   49.18   <2e-16 ***
## lnox        -0.71767    0.06634  -10.82   <2e-16 ***
## rooms        0.30592    0.01902   16.09   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.286 on 503 degrees of freedom
## Multiple R-squared:  0.5137,	Adjusted R-squared:  0.5118 
## F-statistic: 265.7 on 2 and 503 DF,  p-value: < 2.2e-16
```

$\beta_1$ < 0 because more pollution can be expected to lower housing values. $\beta_1$ is the elasticity of price with respect to nox.

$\beta_2$ > 0 because rooms is highly related to the size of a house. $\beta_2$ is the elasticity of price with respect to rooms

(ii) Why might nox [or more precisely, log(nox)] and rooms be negatively correlated? If this is the case, does the simple regression of log(price) on log(nox) produce an upward or a downward biased estimator of $\beta_1$?


```
## [1] -0.3049879
```


```
## 
## Call:
## lm(formula = lprice ~ lnox, data = hprice2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.17062 -0.19368 -0.02582  0.18385  1.09366 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 11.70719    0.13243   88.40   <2e-16 ***
## lnox        -1.04314    0.07767  -13.43   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3516 on 504 degrees of freedom
## Multiple R-squared:  0.2636,	Adjusted R-squared:  0.2621 
## F-statistic: 180.4 on 1 and 504 DF,  p-value: < 2.2e-16
```

```
## 
## Call:
## lm(formula = lprice ~ rooms, data = hprice2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.20213 -0.09645  0.06184  0.16928  1.36319 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  7.62435    0.12702   60.02   <2e-16 ***
## rooms        0.36866    0.02009   18.35   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3172 on 504 degrees of freedom
## Multiple R-squared:  0.4006,	Adjusted R-squared:  0.3994 
## F-statistic: 336.8 on 1 and 504 DF,  p-value: < 2.2e-16
```

Assume that rooms increases with quality of the home/neighborhood , then log(nox) and rooms are negatively correlated when poorer/less desirable neighborhoods have more pollution.  

(iii) Using the data in HPRICE2, the following equations were estimated:

$$log(price) =  11.71 - 1.043 * log(nox)$$
$$n = 506, R^{2} = 0.264$$

$$log(price) =  9.23 -  0.718  * log(nox) + 0.306 * rooms + u$$
$$n = 506, R^{2} = 0.514$$

Is the relationship between the simple and multiple regression estimates of the elasticity of price with respect to nox what you would have predicted, given your answer in part? (ii) Does this mean that -0.718 is definitely closer to the true elasticity than -1.043?

The relationship between the simple and multiple regression estimates of the elasticity of price with respect to nox is what was expect from the analysis in part (ii). 

The simple regression estimate, 1.043, is more negative (larger in magnitude) than the multiple regression estimate, 0.718.  $\beta_1$ is closer to 0.718.

## C1

 A problem of interest to health officials (and others) is to determine the effects of smoking during pregnancy on infant health. One measure of infant health is birth weight; a birth weight that is too low can put an infant at risk for contracting various illnesses. Since factors other than cigarette smoking that affect birth weight are likely to be cor- related with smoking, we should take those factors into account. For example, higher income generally results in access to better prenatal care, as well as better nutrition for the mother. An equation that recognizes this is
 
$$bwght = \hat{\beta}_0 + \hat{\beta}_1 * b1cigs + \hat{\beta}_2 * faminc +  u$$



(i) What is the most likely sign for $\beta_2$?

$\beta_2$ > 0, as more income typically means better nutrition for the mother and better prenatal care.  This in turns means higher birth weight.

(ii) Do you think `cigs` and `faminc` are likely to be correlated? Explain why the correlation might be positive or negative.

<!-- On the one hand, an increase in income generally increases the consumption of a good, and cigs and faminc could be positively correlated.  On the other, family incomes are also higher for families with more education, and more education and cigarette smoking tend to be negatively correlated.  The sample correlation between cigs and faminc is about .173, indicating a negative correlation. -->


```
##              cigs     faminc
## cigs    1.0000000 -0.1730449
## faminc -0.1730449  1.0000000
```

(iii) Now, estimate the equation with and without faminc, using the data in BWGHT. Report the results in equation form, including the sample size and R-squared. Discuss your results, focusing on whether adding faminc substantially changes the estimated effect of cigs on bwght.

$$bwght = 116.97 - 0.463 * cigs + 0.093 * faminc$$



```
## 
## Call:
## lm(formula = bwght ~ cigs + faminc, data = bwght)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -96.061 -11.543   0.638  13.126 150.083 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 116.97413    1.04898 111.512  < 2e-16 ***
## cigs         -0.46341    0.09158  -5.060 4.75e-07 ***
## faminc        0.09276    0.02919   3.178  0.00151 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 20.06 on 1385 degrees of freedom
## Multiple R-squared:  0.0298,	Adjusted R-squared:  0.0284 
## F-statistic: 21.27 on 2 and 1385 DF,  p-value: 7.942e-10
```

Sample size is 1388.  $R^{2}$ value is 0.0298. Adjusted $R^{2}$ value is 0.0284.

$$bwght = 119.77 - 0.514 * cigs$$


```
## 
## Call:
## lm(formula = bwght ~ cigs, data = bwght)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -96.772 -11.772   0.297  13.228 151.228 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 119.77190    0.57234 209.267  < 2e-16 ***
## cigs         -0.51377    0.09049  -5.678 1.66e-08 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 20.13 on 1386 degrees of freedom
## Multiple R-squared:  0.02273,	Adjusted R-squared:  0.02202 
## F-statistic: 32.24 on 1 and 1386 DF,  p-value: 1.662e-08
```

Sample size is 1388.  $R^{2}$ value is 0.0227. Adjusted $R^{2}$ value is 0.022.

The effect of cigarette smoking is slightly larger when faminc is removed from the regression, but the difference is small.  This is probably due to the fact that `cigs` and `faminc` are not very correlated, and the coefficient on faminc is practically small.  (The variable faminc is measured in thousands, so $10,000 more in 1988 income increases predicted birth weight by only .93 ounces.)


```
## $fit
##        1        2        3 
## 119.7719 119.2581 114.6342 
## 
## $se.fit
##         1         2         3 
## 0.5723407 0.5491633 0.8970024 
## 
## $df
## [1] 1386
## 
## $residual.scale
## [1] 20.12858
```

## C2

Use the data in HPRICE1 to estimate the model

$$price =  \beta_0 + \beta_1 * sqrft + \beta_2 * bdrms  + u$$


where price is the house price measured in thousands of dollars.

(i) Write out the results in equation form.




```
## 
## Call:
## lm(formula = price ~ sqrft + bdrms, data = hprice1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -127.627  -42.876   -7.051   32.589  229.003 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -19.31500   31.04662  -0.622    0.536    
## sqrft         0.12844    0.01382   9.291 1.39e-14 ***
## bdrms        15.19819    9.48352   1.603    0.113    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 63.04 on 85 degrees of freedom
## Multiple R-squared:  0.6319,	Adjusted R-squared:  0.6233 
## F-statistic: 72.96 on 2 and 85 DF,  p-value: < 2.2e-16
```

$$price =  \beta_0 + \beta_1 * sqrft + \beta_2 * bdrms  + u$$

(ii) What is the estimated increase in price for a house with one more bedroom, holding square footage constant?

The estimated increase in price for a house with one more bedroom while holding square footage constant is 15.2

(iii) What is the estimated increase in price for a house with an additional bedroom that is 140 square feet in size? Compare this to your answer in part (ii).


```
## [1] 17.92
```

(iv) What percentage of the variation in price is explained by square footage and number of bedrooms?

The Adjusted R2 value is 0.6233. This tells us that 62.33% of the variation in house price ($1000s), as quantified by `price`, is explained by `sqrft, bdrms`.


```
## $fit
##         1         2 
## -4.116805 -1.333926 
## 
## $se.fit
##        1        2 
## 26.31783 30.48764 
## 
## $df
## [1] 85
## 
## $residual.scale
## [1] 63.04484
```

(v) The first house in the sample has sqrft = 2,438 and bdrms = 4. Find the predicted selling price for this house from the OLS regression line.


```
## $fit
##        1 
## 354.6052 
## 
## $se.fit
## [1] 8.41493
## 
## $df
## [1] 85
## 
## $residual.scale
## [1] 63.04484
```

```
## [1] 300
```

(vi) The actual selling price of the first house in the sample was $300,000 (so price = 300). Find the residual for this house. Does it suggest that the buyer underpaid or overpaid for the house?


```
##         1 
## -54.60525
```

## C3

The file CEOSAL2 contains data on 177 chief executive officers and can be used to examine the effects of firm performance on CEO salary.

(i) Estimate a model relating annual salary to firm sales and market value. Make the model of the constant elasticity variety for both independent variables. Write the results out in equation form.




```
## 
## Call:
## lm(formula = lsalary ~ lsales + lmktval, data = ceosal2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.28060 -0.31137 -0.01269  0.30645  1.91210 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  4.62092    0.25441  18.163  < 2e-16 ***
## lsales       0.16213    0.03967   4.087 6.67e-05 ***
## lmktval      0.10671    0.05012   2.129   0.0347 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5103 on 174 degrees of freedom
## Multiple R-squared:  0.2991,	Adjusted R-squared:  0.2911 
## F-statistic: 37.13 on 2 and 174 DF,  p-value: 3.727e-14
```

$$price =  4.62 + 0.162 * lsales + 0.107 * lmktval$$
$$n = 177, R^{2} = 0.299$$

(ii) Add profits to the model from part (i). Why can this variable not be included in logarithmic form? Would you say that these firm performance variables explain most of the variation in CEO salaries?

profits cannotbe included in logarithmic form because profits are negative for nine of the companies in the sample.  


```
## 
## Call:
## lm(formula = lsalary ~ lsales + lmktval + profits, data = ceosal2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.27002 -0.31026 -0.01027  0.31043  1.91489 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 4.687e+00  3.797e-01  12.343  < 2e-16 ***
## lsales      1.614e-01  3.991e-02   4.043 7.92e-05 ***
## lmktval     9.753e-02  6.369e-02   1.531    0.128    
## profits     3.566e-05  1.520e-04   0.235    0.815    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5117 on 173 degrees of freedom
## Multiple R-squared:  0.2993,	Adjusted R-squared:  0.2872 
## F-statistic: 24.64 on 3 and 173 DF,  p-value: 2.53e-13
```

$$price =  4.69 + 0.161 * lsales + 0.098 * lmktval + 0.000036 * profits$$

$$n = 177, R^{2} = 0.299$$


The coefficient on profits (measured in millions) is very small. If profits increase by `$1` billion, $\Delta profits$ = 1,000 the predicted salary increases by about only 3.6% while holding sales and market value fixed. profits can be dropped without losing variation TBD. The model explain almost 30% of the sample variation in log(salary).


```
## [1] 0.0357
```

(iii) Add the variable ceoten to the model in part (ii). What is the estimated percentage return for another year of CEO tenure, holding other factors fixed?


```
## 
## Call:
## lm(formula = lsalary ~ lsales + lmktval + ceoten, data = ceosal2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.49693 -0.29472  0.00964  0.30417  1.85286 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 4.503795   0.257234  17.509  < 2e-16 ***
## lsales      0.162854   0.039242   4.150 5.21e-05 ***
## lmktval     0.109243   0.049595   2.203   0.0289 *  
## ceoten      0.011705   0.005326   2.198   0.0293 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5048 on 173 degrees of freedom
## Multiple R-squared:  0.3182,	Adjusted R-squared:  0.3063 
## F-statistic: 26.91 on 3 and 173 DF,  p-value: 2.474e-14
```

one more year as CEO increases predicted salary by about 1.2%.

(iv) Find the sample correlation coefficient between the variables log(mktval) and profits. Are these variables highly correlated? What does this say about the OLS estimators?



```
## [1] 0.7768976
```

The sample correlation between log(mktval) and profits is about 0.7768976, which is high.  This causes no bias in the OLS estimators, although it can cause their variances to be large.  Given the fairly substantial correlation between market value and firm profits, it is not too surprising that the latter adds nothing to explaining CEO salaries.  Also, profits is a short term measure of how the firm is doing while mktval is based on past, current, and expected future profitability.

## C5

Confirm the partialling out interpretation of the OLS estimates by explicitly doing the partialling out for Example 3.2. This first requires regressing educ on exper and tenure and saving the residuals, rˆ1. Then, regress log(wage) on rˆ1. Compare the coefficient on ˆr1 with the coefficient on educ in the regression of log(wage) on educ, exper, and tenure.



$$log(wage) =  0.284 + 0.092 educ + 0.0041 exper + 0.022 tenure$$


```
## 
## Call:
## lm(formula = lwage ~ educ + exper + tenure, data = wage1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.05802 -0.29645 -0.03265  0.28788  1.42809 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 0.284360   0.104190   2.729  0.00656 ** 
## educ        0.092029   0.007330  12.555  < 2e-16 ***
## exper       0.004121   0.001723   2.391  0.01714 *  
## tenure      0.022067   0.003094   7.133 3.29e-12 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4409 on 522 degrees of freedom
## Multiple R-squared:  0.316,	Adjusted R-squared:  0.3121 
## F-statistic: 80.39 on 3 and 522 DF,  p-value: < 2.2e-16
```


```
## 
## Call:
## lm(formula = educ ~ exper + tenure, data = wage1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -12.4285  -1.3536  -0.2055   1.6550   5.9791 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 13.574964   0.184324  73.647  < 2e-16 ***
## exper       -0.073785   0.009761  -7.559 1.83e-13 ***
## tenure       0.047680   0.018337   2.600  0.00958 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.63 on 523 degrees of freedom
## Multiple R-squared:  0.1013,	Adjusted R-squared:  0.09791 
## F-statistic: 29.49 on 2 and 523 DF,  p-value: 7.327e-13
```

The regression of educ on exper and tenure:

$$educ = 13.57 - 0.074 exper + 0.048 tenure$$
$$n = 526, R^{2} = 0.101$$


```
## 
## Call:
## lm(formula = lwage ~ r, data = wage1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.12919 -0.32803 -0.07126  0.31626  1.51357 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.62327    0.02066   78.56   <2e-16 ***
## r            0.09203    0.00788   11.68   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4739 on 524 degrees of freedom
## Multiple R-squared:  0.2066,	Adjusted R-squared:  0.205 
## F-statistic: 136.4 on 1 and 524 DF,  p-value: < 2.2e-16
```

Now, when we regress log(wage) on $r_1$:

$$lwage = 1.62 + 0.092 r_1$$
$$n = 526, R^{2} = 0.207$$
## C7

Use the data in MEAP93 to answer this question. 

(i) Estimate the model

$$math10 =  \beta_0 + \beta_1 * lexpend + \beta_2 * lnchprg  + u$$

and report the results in the usual form, including the sample size and R-squared.
Are the signs of the slope coefficients what you expected? Explain.




```
## 
## Call:
## lm(formula = math10 ~ lexpend + lnchprg, data = meap93)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -24.294  -6.172  -1.293   4.855  43.203 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -20.36075   25.07288  -0.812   0.4172    
## lexpend       6.22969    2.97263   2.096   0.0367 *  
## lnchprg      -0.30459    0.03536  -8.614   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 9.526 on 405 degrees of freedom
## Multiple R-squared:  0.1799,	Adjusted R-squared:  0.1759 
## F-statistic: 44.43 on 2 and 405 DF,  p-value: < 2.2e-16
```

Sample size is 408.  $R^{2}$ value is 0.1799. Adjusted $R^{2}$ value is 0.1759.

(ii) What do you make of the intercept you estimated in part (i)? In particular, does it make sense to set the two explanatory variables to zero? [Hint: Recall that log(1)=0.]

(iii) Now run the simple regression of math10 on log(expend), and compare the slope coefficient with the estimate obtained in part (i). Is the estimated spending effect now larger or smaller than in part (i)?


```
## 
## Call:
## lm(formula = math10 ~ lexpend, data = meap93)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -22.343  -7.100  -0.914   6.148  39.093 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -69.341     26.530  -2.614 0.009290 ** 
## lexpend       11.164      3.169   3.523 0.000475 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 10.35 on 406 degrees of freedom
## Multiple R-squared:  0.02966,	Adjusted R-squared:  0.02727 
## F-statistic: 12.41 on 1 and 406 DF,  p-value: 0.0004752
```

The estimated spending effect, almost double, is larger than it was in part (i).

(iv) Find the correlation between lexpend = log(expend) and lnchprg. Does its sign make sense to you?


```
## [1] -0.1927042
```

The correlation between lexpend and lnchprg is -0.1927042, which means that on average high schools with poorer students spent less per student.

(v) Use part (iv) to explain your findings in part (iii).

Equation (3.23)

$$\tilde{\beta_1} = \hat{\beta_1} + \hat{\beta_2} + \tilde{\delta_1} $$
Because Corr(x1,x2) < 0, which means$\hat{\beta_2}$ < 0, and  $\tilde{\delta_1}$, the simple regression estimate, $\tilde{\beta_1}$, is larger than the multiple regression estimate, $\hat{\beta_1}$ . Failing to include the poverty rate (`lnchprg`) leads to an over-estimate of the effect of spending (`lexpend`).

## C9

Use the data in CHARITY to answer the following questions: 

(i) Estimate the equation

$$gift =  \beta_0 + \beta_1 * mailsyear + \beta_2 * giftlast  + \beta_3 * propresp + u$$

by OLS and report the results in the usual way, including the sample size and R-squared. How does the R-squared compare with that from the simple regression that omits giftlast and propresp?




```
## 
## Call:
## lm(formula = gift ~ mailsyear + giftlast + propresp, data = charity)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -52.893  -7.050  -3.650   1.397 241.206 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -4.551518   0.803034  -5.668 1.54e-08 ***
## mailsyear    2.166259   0.331927   6.526 7.53e-11 ***
## giftlast     0.005927   0.001432   4.138 3.58e-05 ***
## propresp    15.358605   0.874539  17.562  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 14.43 on 4264 degrees of freedom
## Multiple R-squared:  0.08336,	Adjusted R-squared:  0.08271 
## F-statistic: 129.3 on 3 and 4264 DF,  p-value: < 2.2e-16
```

The estimated equation is

$$gift =  -4.55 + 2.166 * mailsyear + 0.006 * giftlast  + 15.359 * propresp + u$$

Sample size is 4268. $R^{2}$ value is 0.0834. Adjusted $R^{2}$ value is 0.0827.

(ii) Interpret the coefficient on mailsyear. Is it bigger or smaller than the corresponding simple regression coefficient?


```
## 
## Call:
## lm(formula = gift ~ mailsyear, data = charity)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -11.287  -7.976  -5.976   2.687 245.999 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   2.0141     0.7395   2.724  0.00648 ** 
## mailsyear     2.6495     0.3431   7.723  1.4e-14 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 14.96 on 4266 degrees of freedom
## Multiple R-squared:  0.01379,	Adjusted R-squared:  0.01356 
## F-statistic: 59.65 on 1 and 4266 DF,  p-value: 1.404e-14
```

Holding giftlast and propresp fixed, one more mailing per year is estimated to increase gifts by 2.17 guilders. The simple regression estimate is 2.65. The multiple regression estimate is smaller.


(iii) Interpret the coefficient on propresp. Be careful to notice the units of measurement of propresp.

(iv) Now add the variable avggift to the equation. What happens to the estimated effect of mailsyear?


The estimated equation is

$$gift =  -7.328 + 1.201 * mailsyear - 0.2601 * giftlast  + 16.205 * propresp + 0.527 * avggift +u$$


```
## 
## Call:
## lm(formula = gift ~ mailsyear + giftlast + propresp + avggift, 
##     data = charity)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -197.016   -5.883   -2.065    3.031  221.256 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -7.32776    0.75822  -9.664  < 2e-16 ***
## mailsyear    1.20117    0.31242   3.845 0.000122 ***
## giftlast    -0.26086    0.01076 -24.251  < 2e-16 ***
## propresp    16.20464    0.81753  19.821  < 2e-16 ***
## avggift      0.52695    0.02108  24.996  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 13.47 on 4263 degrees of freedom
## Multiple R-squared:  0.2005,	Adjusted R-squared:  0.1998 
## F-statistic: 267.3 on 4 and 4263 DF,  p-value: < 2.2e-16
```


```
## 
## Call:
## lm(formula = gift ~ giftlast, data = charity)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -53.895  -7.389  -7.389   2.611 242.384 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 7.332770   0.232082  31.596  < 2e-16 ***
## giftlast    0.005656   0.001493   3.788 0.000154 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.04 on 4266 degrees of freedom
## Multiple R-squared:  0.003353,	Adjusted R-squared:  0.003119 
## F-statistic: 14.35 on 1 and 4266 DF,  p-value: 0.0001537
```

Holding giftlast, propresp and avggift fixed, the effect of mailings is smaller. The estimated effect of mailsyear 1.2 guilders, less than half the effect estimated by simple regression.

(v) In the equation from part (iv), what has happened to the coefficient on giftlast? What do you think is happening?

Holding mailsyear, propresp and avggift fixed, the effect of mailings is negative. The estimated effect of giftlast -0.261 guilders, less than half the effect estimated by simple regression.
