---
title: "Chapter 4: Multiple regression Analysis: inference"
author: "Marjorie Blanco"
date: "12/22/2018"
output: html_document
---



# Multiple regression Analysis: inference

## Explore 4.1

Suppose that u is independent of the expla- natory variables, and it takes on the values 22, 21, 0, 1, and 2 with equal probability of 1/5. Does this violate the Gauss-Markov assumptions? Does this violate the CLM assumptions?

## Explore 4.2

Let community loan approval rates be determined by

$$apprate =  \beta_0 + \beta_1 * percmin + \beta_2 * avginc + \beta_3 * avgwlth + \beta_4 * avgdebt + u$$,

where percmin is the percentage minority in the community, avginc is average income, avgwlth is average wealth, and avgdebt is some measure of average debt obligations. How do you state the null hypothesis that there is no difference in loan rates across neighborhoods due to racial and ethnic composition, when average income, average wealth, and average debt have been controlled for? How do you state the alternative that there is discrimination against minorities in loan approval rates?


${H_0}: b_{percmin} = 0$
${H_1}: b_{percmin} < 0$

## Explore 4.3

Suppose you estimate a regression model and obtain $\hat\beta_1$ = .56 and p-value = .086 for testing H0: $\beta_1$ = 0 against H1: $\beta_1 \ne$ 0. What is the p-value for testing H0: $\hat\beta_1$ = 0 against H1: $\beta_1$ > 0?

It is simple to obtain the one-sided p-value: just divide the two-sided p-value by 2.


```
## [1] 0.043
```

## Explore 4.4

Consider relating individual performance on a standardized test, score, to a variety of other variables. School factors include average class size, per-student expenditures, average teacher compensation, and total school enrollment. Other variables specific to the student are family income, mother’s education, father’s education, and number of siblings. The model is

$$score =  \beta_0 + \beta_1 * classize + \beta_2 * expend + \beta_3 * tchcomp + \beta_4 * enroll + \beta_5 * faminc + \beta_6 * motheduc + \beta_7 * fatheduc + \beta_8 * siblings + u$$


State the null hypothesis that student-specific variables have no effect on standardized test performance once school-related factors have been controlled for. What are k and q for this example? Write down the restricted version of the model.

${H_0}: b_{faminc} = 0, b_{motheduc} = 0, b_{fatheduc} = 0, b_{siblings} = 0$
${H_1}: {H_0}$ is not true (at least one of $\beta_5,\beta_6,\beta_7,\beta_8$, is different from zero.)

k = 8
q = 4

$$score =  \beta_0 + \beta_1 * classize + \beta_2 * expend + \beta_3 * tchcomp + \beta_4 * enroll + u$$

## Explore 4.5

The data in ATTEND.RAW were used to estimate the two equations
atndrte5 47.13 1 13.37 priGPA (2.87) (1.09)
n5680,R2 5.183
and
atndrte 5 75.70 1 17.26 priGPA 2 1.72 ACT (3.88) (1.08) (?)
n 5 680, R2 5 .291,
where, as always, standard errors are in parentheses; the standard error for ACT is missing in the second equation. What is the t statistic for the coefficient on ACT ? (Hint: First compute the F statistic for significance of ACT.)




```
## 
## Call:
## lm(formula = atndrte ~ priGPA, data = attend)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -70.957  -6.815   2.948  10.631  30.680 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   47.127      2.873   16.41   <2e-16 ***
## priGPA        13.369      1.087   12.30   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.42 on 678 degrees of freedom
## Multiple R-squared:  0.1825,	Adjusted R-squared:  0.1813 
## F-statistic: 151.3 on 1 and 678 DF,  p-value: < 2.2e-16
```

```
## 
## Call:
## lm(formula = atndrte ~ priGPA + ACT, data = attend)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -65.373  -6.765   2.125   9.635  29.615 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   75.700      3.884   19.49   <2e-16 ***
## priGPA        17.261      1.083   15.94   <2e-16 ***
## ACT           -1.717      0.169  -10.16   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 14.38 on 677 degrees of freedom
## Multiple R-squared:  0.2906,	Adjusted R-squared:  0.2885 
## F-statistic: 138.7 on 2 and 677 DF,  p-value: < 2.2e-16
```

```
## Analysis of Variance Table
## 
## Model 1: atndrte ~ priGPA
## Model 2: atndrte ~ priGPA + ACT
##   Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
## 1    678 161309                                  
## 2    677 139981  1     21328 103.15 < 2.2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


```
## [1] 3.855211
```

reject reject the hypothesis that droprate and gradrate have no effect on salary.


## Explore 4.6

How does adding droprate and gradrate affect the estimate of the salary-benefits tradeoff? Are these variables jointly significant at the 5% level? What about the 10% level?




```
## 
## Call:
## lm(formula = lsalary ~ bensal + lenroll + lstaff + droprate + 
##     gradrate, data = meap93)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.28711 -0.08902 -0.01949  0.07255  0.39754 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 10.7384651  0.2582651  41.579  < 2e-16 ***
## bensal      -0.5893195  0.1648739  -3.574 0.000394 ***
## lenroll      0.0881204  0.0073240  12.032  < 2e-16 ***
## lstaff      -0.2182779  0.0499503  -4.370 1.58e-05 ***
## droprate    -0.0002826  0.0016145  -0.175 0.861113    
## gradrate     0.0009674  0.0006625   1.460 0.145032    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.1241 on 402 degrees of freedom
## Multiple R-squared:  0.361,	Adjusted R-squared:  0.3531 
## F-statistic: 45.43 on 5 and 402 DF,  p-value: < 2.2e-16
```

```
## 
## Call:
## lm(formula = lsalary ~ bensal + lenroll + lstaff, data = meap93)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.29251 -0.08885 -0.01611  0.07210  0.39151 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 10.843840   0.251643  43.092  < 2e-16 ***
## bensal      -0.604772   0.165368  -3.657 0.000289 ***
## lenroll      0.087397   0.007346  11.897  < 2e-16 ***
## lstaff      -0.222033   0.050077  -4.434 1.19e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.1246 on 404 degrees of freedom
## Multiple R-squared:  0.3527,	Adjusted R-squared:  0.3479 
## F-statistic: 73.39 on 3 and 404 DF,  p-value: < 2.2e-16
```

```
## Analysis of Variance Table
## 
## Model 1: lsalary ~ bensal + lenroll + lstaff + droprate + gradrate
## Model 2: lsalary ~ bensal + lenroll + lstaff
##   Res.Df    RSS Df Sum of Sq      F  Pr(>F)  
## 1    402 6.1929                              
## 2    404 6.2734 -2 -0.080464 2.6116 0.07466 .
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


```
## [1] 3.018168
```

fail to rejct reject the hypothesis that droprate and gradrate have no effect on salary.

## Example 4.1



Using the data in WAGE1 gives the estimated equation

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
## [1] 1.281552
```

```
## [1] 1.644854
```

```
## [1] 2.326348
```

test whether the return to exper, controlling for educ and tenure, is zero in the population, against the alternative that it is positive.

${H_0}: b_{exper} = 0$
${H_1}: b_{exper} > 0$

The t statistic for $\hat{b}_{exper}$ is $t_{exper} = 0.0041/0.0017 \sim 2.41$.  $\hat{b}_{exper}$ is statistically significant even at the 1% level.

Adding three more years increases log(wage) by 3(.0041) = .0123, so wage is only about 1.2% higher


```
## [1] 0.01236
```

Partial effect of experience is positive in the population.

## Example 4.2




```
## 
## Call:
## lm(formula = math10 ~ totcomp + staff + enroll, data = meap93)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -22.235  -7.008  -0.807   6.097  40.689 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  2.2740209  6.1137938   0.372    0.710    
## totcomp      0.0004586  0.0001004   4.570 6.49e-06 ***
## staff        0.0479199  0.0398140   1.204    0.229    
## enroll      -0.0001976  0.0002152  -0.918    0.359    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 10.24 on 404 degrees of freedom
## Multiple R-squared:  0.05406,	Adjusted R-squared:  0.04704 
## F-statistic: 7.697 on 3 and 404 DF,  p-value: 5.179e-05
```
enroll is in accordance with the conjecture that larger schools hamper performance: higher enrollment leads to a lower percentage of students with a passing tenth-grade math score. 
 
${H_0}: b_{enroll} = 0$
${H_1}: b_{enroll} < 0$

 fail to reject H0 in favor of H1 at the 5% level

${H_0}: b_{totcomp} = 0$
${H_1}: b_{totcomp} > 0$

reject H0 in favor of H1 at the 1% level

${H_0}: b_{staff} = 0$
${H_1}: b_{staff} > 0$

 fail to reject H0 in favor of H1 at the 5% level


```
## 
## Call:
## lm(formula = math10 ~ ltotcomp + lstaff + lenroll, data = meap93)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -22.735  -6.838  -0.835   6.139  39.718 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -207.6648    48.7031  -4.264 2.50e-05 ***
## ltotcomp      21.1550     4.0555   5.216 2.92e-07 ***
## lstaff         3.9800     4.1897   0.950   0.3427    
## lenroll       -1.2680     0.6932  -1.829   0.0681 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 10.18 on 404 degrees of freedom
## Multiple R-squared:  0.06538,	Adjusted R-squared:  0.05844 
## F-statistic:  9.42 on 3 and 404 DF,  p-value: 4.974e-06
```

changing functional form can affect conclusions

## Example 4.3




```
## 
## Call:
## lm(formula = colGPA ~ hsGPA + ACT + skipped, data = gpa1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.85698 -0.23200 -0.03935  0.24816  0.81657 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.38955    0.33155   4.191 4.95e-05 ***
## hsGPA        0.41182    0.09367   4.396 2.19e-05 ***
## ACT          0.01472    0.01056   1.393  0.16578    
## skipped     -0.08311    0.02600  -3.197  0.00173 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3295 on 137 degrees of freedom
## Multiple R-squared:  0.2336,	Adjusted R-squared:  0.2168 
## F-statistic: 13.92 on 3 and 137 DF,  p-value: 5.653e-08
```
The t statistic on hsGPA is 4.38, which is significant at very small significance levels. Thus, we say that “hsGPA is statistically significant at any conventional significance level.”

The t statistic on ACT is 1.36, which is not statistically significant at the 10% level against a two-sided alternative.  Thus, the variable ACT is practically, as well as statistically, insignificant.

The t statistic of skipped is -3.19, so skipped is statistically significant at the 1% significance level. 

## Example 4.4




```
## 
## Call:
## lm(formula = lcrime ~ lenroll, data = campus)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.5136 -0.3858  0.1174  0.4363  2.5782 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -6.6314     1.0335  -6.416 5.44e-09 ***
## lenroll       1.2698     0.1098  11.567  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8946 on 95 degrees of freedom
## Multiple R-squared:  0.5848,	Adjusted R-squared:  0.5804 
## F-statistic: 133.8 on 1 and 95 DF,  p-value: < 2.2e-16
```

## Example 4.5




```
## 
## Call:
## lm(formula = lprice ~ lnox + rooms + stratio, data = hprice2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.02357 -0.13576  0.02406  0.13258  1.40083 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 10.359458   0.219069  47.288   <2e-16 ***
## lnox        -0.645329   0.062580 -10.312   <2e-16 ***
## rooms        0.256727   0.018677  13.746   <2e-16 ***
## stratio     -0.050873   0.005926  -8.585   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.2673 on 502 degrees of freedom
## Multiple R-squared:  0.576,	Adjusted R-squared:  0.5734 
## F-statistic: 227.3 on 3 and 502 DF,  p-value: < 2.2e-16
```

## Example 4.6




```
## 
## Call:
## lm(formula = prate ~ mrate + age + totemp, data = k401k)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -77.698  -8.074   4.716  12.505  30.307 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  8.029e+01  7.777e-01 103.242  < 2e-16 ***
## mrate        5.442e+00  5.244e-01  10.378  < 2e-16 ***
## age          2.692e-01  4.514e-02   5.963 3.07e-09 ***
## totemp      -1.291e-04  3.666e-05  -3.521 0.000443 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.88 on 1530 degrees of freedom
## Multiple R-squared:  0.09954,	Adjusted R-squared:  0.09778 
## F-statistic: 56.38 on 3 and 1530 DF,  p-value: < 2.2e-16
```

The smallest t statistic in absolute value is that on the variable totemp: t = -3.25, and this is statistically significant at 1% significance levels. 

if a firm grows by 10,000 employees, the participation rate falls by 1.3 percentage points. This is a huge increase in number of employees with only a modest effect on the participation rate.  The effect is not practically very large.

## Example 4.7




```
## 
## Call:
## lm(formula = lscrap ~ hrsemp + lsales + lemploy, data = jtrain %>% 
##     filter(year == 1987 & union == 0))
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.6301 -0.7523 -0.4016  0.8697  2.8273 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)  
## (Intercept) 12.45837    5.68677   2.191   0.0380 *
## hrsemp      -0.02927    0.02280  -1.283   0.2111  
## lsales      -0.96203    0.45252  -2.126   0.0436 *
## lemploy      0.76147    0.40743   1.869   0.0734 .
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.376 on 25 degrees of freedom
##   (97 observations deleted due to missingness)
## Multiple R-squared:  0.2624,	Adjusted R-squared:  0.1739 
## F-statistic: 2.965 on 3 and 25 DF,  p-value: 0.05134
```

The t statistic on hrsemp is -1.26, and this as not being large enough in magnitude to conclude that hrsemp is statistically significant at the 5% level. hrsemp is not statistically significant, even using a one-sided alternative.

## Example 4.8




```
## 
## Call:
## lm(formula = lrd ~ lsales + profmarg, data = rdchem)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.97681 -0.31502 -0.05828  0.39020  1.21783 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -4.37827    0.46802  -9.355 2.93e-10 ***
## lsales       1.08422    0.06020  18.012  < 2e-16 ***
## profmarg     0.02166    0.01278   1.694    0.101    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5136 on 29 degrees of freedom
## Multiple R-squared:  0.918,	Adjusted R-squared:  0.9123 
## F-statistic: 162.2 on 2 and 29 DF,  p-value: < 2.2e-16
```

a 1% increase in sales is associated with a 1.084% increase in R&D spending.
The 95% confidence interval for log(sales) is between 0.961 and 1.21.
The estimated R&D-sales elasticity is not statistically different from 1 at the 5% level.
The 95% confidence interval for the population parameter, bprofmarg, is between -.0045 and .0479

the economic size of the profit margin coefficient is not trivial: holding sales fixed, a one percentage point increase in profmarg is estimated to increase R&D spending by 100(0.02166) = 2.2%




```
## 
## Call:
## lm(formula = lwage ~ jc + univ + exper, data = twoyear)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.10362 -0.28132  0.00551  0.28518  1.78167 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.4723256  0.0210602  69.910   <2e-16 ***
## jc          0.0666967  0.0068288   9.767   <2e-16 ***
## univ        0.0768762  0.0023087  33.298   <2e-16 ***
## exper       0.0049442  0.0001575  31.397   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4301 on 6759 degrees of freedom
## Multiple R-squared:  0.2224,	Adjusted R-squared:  0.2221 
## F-statistic: 644.5 on 3 and 6759 DF,  p-value: < 2.2e-16
```

jc and univ have both economically and statistically significant effects on wage. 




```
## 
## Call:
## lm(formula = lsalary ~ years + gamesyr + bavg + hrunsyr + rbisyr, 
##     data = mlb1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -3.02508 -0.45034 -0.04013  0.47014  2.68924 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.119e+01  2.888e-01  38.752  < 2e-16 ***
## years       6.886e-02  1.211e-02   5.684 2.79e-08 ***
## gamesyr     1.255e-02  2.647e-03   4.742 3.09e-06 ***
## bavg        9.786e-04  1.104e-03   0.887    0.376    
## hrunsyr     1.443e-02  1.606e-02   0.899    0.369    
## rbisyr      1.077e-02  7.175e-03   1.500    0.134    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.7266 on 347 degrees of freedom
## Multiple R-squared:  0.6278,	Adjusted R-squared:  0.6224 
## F-statistic: 117.1 on 5 and 347 DF,  p-value: < 2.2e-16
```

years and gamesyr are statistically significant, none of the variables bavg, hrunsyr, and rbisyr has a statistically significant t statistic against a two-sided alternative, at the 5% significance level.


```
## 
## Call:
## lm(formula = lsalary ~ years + gamesyr, data = mlb1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.66858 -0.46412 -0.01176  0.49219  2.68829 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 11.223804   0.108312 103.625  < 2e-16 ***
## years        0.071318   0.012505   5.703  2.5e-08 ***
## gamesyr      0.020174   0.001343  15.023  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.7527 on 350 degrees of freedom
## Multiple R-squared:  0.5971,	Adjusted R-squared:  0.5948 
## F-statistic: 259.3 on 2 and 350 DF,  p-value: < 2.2e-16
```


```
## Analysis of Variance Table
## 
## Model 1: lsalary ~ years + gamesyr
## Model 2: lsalary ~ years + gamesyr + bavg + hrunsyr + rbisyr
##   Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
## 1    350 198.31                                  
## 2    347 183.19  3    15.125 9.5503 4.474e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


```
## [1] 2.630641
```

reject the hypothesis that bavg, hrunsyr, and rbisyr have no effect on salary.


```
## 
## Call:
## lm(formula = lsalary ~ years + gamesyr + bavg + hrunsyr, data = mlb1)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.0642 -0.4614 -0.0271  0.4654  2.7216 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 11.020912   0.265719  41.476  < 2e-16 ***
## years        0.067732   0.012113   5.592 4.55e-08 ***
## gamesyr      0.015759   0.001564  10.079  < 2e-16 ***
## bavg         0.001419   0.001066   1.331    0.184    
## hrunsyr      0.035943   0.007241   4.964 1.08e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.7279 on 348 degrees of freedom
## Multiple R-squared:  0.6254,	Adjusted R-squared:  0.6211 
## F-statistic: 145.2 on 4 and 348 DF,  p-value: < 2.2e-16
```


```
## 
## Call:
## lm(formula = lsalary ~ years + gamesyr + bavg + rbisyr, data = mlb1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.97116 -0.45464 -0.05178  0.46468  2.67529 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 1.128e+01  2.737e-01  41.197  < 2e-16 ***
## years       6.973e-02  1.207e-02   5.776 1.70e-08 ***
## gamesyr     1.116e-02  2.145e-03   5.202 3.37e-07 ***
## bavg        7.398e-04  1.071e-03   0.691     0.49    
## rbisyr      1.652e-02  3.229e-03   5.117 5.13e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.7264 on 348 degrees of freedom
## Multiple R-squared:  0.6269,	Adjusted R-squared:  0.6226 
## F-statistic: 146.2 on 4 and 348 DF,  p-value: < 2.2e-16
```

dropping rbisyr, in which case hrunsyr becomes very significant. The same is true for rbisyr when hrunsyr is dropped from the model.

The F statistic is often useful for testing exclusion of a group of variables when the variables in the group are highly correlated.

## Example 4.9




```
## 
## Call:
## lm(formula = bwght ~ cigs + parity + faminc + motheduc + fatheduc, 
##     data = bwght)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -95.796 -11.960   0.643  12.679 150.879 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 114.52433    3.72845  30.716  < 2e-16 ***
## cigs         -0.59594    0.11035  -5.401 8.02e-08 ***
## parity        1.78760    0.65941   2.711  0.00681 ** 
## faminc        0.05604    0.03656   1.533  0.12559    
## motheduc     -0.37045    0.31986  -1.158  0.24702    
## fatheduc      0.47239    0.28264   1.671  0.09492 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 19.79 on 1185 degrees of freedom
## Multiple R-squared:  0.03875,	Adjusted R-squared:  0.03469 
## F-statistic: 9.553 on 5 and 1185 DF,  p-value: 5.986e-09
```

The R-squared for the full model turns out to be .0387



```
## 
## Call:
## lm(formula = bwght ~ cigs + parity + faminc, data = bwght)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -95.811 -11.552   0.524  12.739 150.848 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 115.46993    1.65590  69.733  < 2e-16 ***
## cigs         -0.59785    0.10877  -5.496 4.74e-08 ***
## parity        1.83227    0.65754   2.787  0.00541 ** 
## faminc        0.06706    0.03239   2.070  0.03865 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 19.8 on 1187 degrees of freedom
## Multiple R-squared:  0.03642,	Adjusted R-squared:  0.03398 
## F-statistic: 14.95 on 3 and 1187 DF,  p-value: 1.472e-09
```

When motheduc and fatheduc are dropped from the regression, the R-squared falls to .0364


```
## Analysis of Variance Table
## 
## Model 1: bwght ~ cigs + parity + faminc + motheduc + fatheduc
## Model 2: bwght ~ cigs + parity + faminc
##   Res.Df    RSS Df Sum of Sq      F Pr(>F)
## 1   1185 464041                           
## 2   1187 465167 -2   -1125.7 1.4373  0.238
```

fail to reject H0. In other words, motheduc and fatheduc are jointly insignificant in the birth weight equation.

## Example 4.10

## Problem 1

Which of the following can cause the usual OLS t statistics to be invalid (that is, not to have t distributions under H0)?
(i) Heteroskedasticity.

(ii) A sample correlation coefficient of .95 between two independent variables that are in
the model.

(iii) Omitting an important explanatory variable.


(i) and (iii) generally cause the t statistics not to have a t distribution under H0.  Homoskedasticity is one of the CLM assumptions.  An important omitted variable violates Assumption MLR.3.  The CLM assumptions contain no mention of the sample correlations among independent variables, except to rule out the case where the correlation is one.

## Problem 2

## Problem 3

The variable rdintens is expenditures on research and development (R&D) as a percentage of sales. Sales are measured in millions of dollars. The variable profmarg is profits as a percentage of sales.

Using the data in RDCHEM for 32 firms in the chemical industry, the following equation is estimated:



Using the data in WAGE1 gives the estimated equation

$$rdintens =  0.47225 + 0.32135 lsales + 0.05004 profmarg$$


```
## 
## Call:
## lm(formula = rdintens ~ lsales + profmarg, data = rdchem)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.3016 -1.2707 -0.6895  0.8785  6.0369 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)  0.47225    1.67606   0.282    0.780
## lsales       0.32135    0.21557   1.491    0.147
## profmarg     0.05004    0.04578   1.093    0.283
## 
## Residual standard error: 1.839 on 29 degrees of freedom
## Multiple R-squared:  0.09847,	Adjusted R-squared:  0.0363 
## F-statistic: 1.584 on 2 and 29 DF,  p-value: 0.2224
```

(i) Interpret the coefficient on log(sales). In particular, if sales increases by 10%, what is the estimated percentage point change in rdintens? Is this an economically large effect?

Holding profmarg fixed, $\Delta$rdintens  = .321 $\Delta$log(sales) = (.321/100)[100 * $\Delta$log(sales)] $\sim$ 0.00321(%$\Delta$sales).  Therefore, if %$\Delta$sales = 10, $\Delta$rdintens $\sim$ .032, or only about 3/100 of a percentage point.  For such a large percentage increase in sales, this seems like a practically small effect.

(ii) Test the hypothesis that R&D intensity does not change with sales against the alternative that it does increase with sales. Do the test at the 5% and 10% levels.

${H_0}: b_{lsales} = 0$
${H_1}: b_{lsales} > 0$

where $b_{lsales}$  is the population slope on log(sales).  

The t statistic is .321/.216 $\sim$ 1.486.  
The 5% critical value for a one-tailed test, with df = 32 – 3 = 29, is obtained from Table G.2 as 1.699; so we cannot reject H0 at the 5% level.  
The 10% critical value is 1.311; since the t statistic is above this value, we reject ${H_0}$ in favor of ${H_1}$ at the 10% level.



```
## [1] 1.699127
```

```
## [1] 1.311434
```

(iii) Interpret the coefficient on profmarg. Is it economically large?


(iv) Does profmarg have a statistically significant effect on rdintens?

profmarg is not statistically significant effect on rdintens.

## Problem 5

Consider the estimated equation from Example 4.3, which can be used to study the effects of skipping class on college GPA:




```
## 
## Call:
## lm(formula = colGPA ~ hsGPA + ACT + skipped, data = gpa1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.85698 -0.23200 -0.03935  0.24816  0.81657 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.38955    0.33155   4.191 4.95e-05 ***
## hsGPA        0.41182    0.09367   4.396 2.19e-05 ***
## ACT          0.01472    0.01056   1.393  0.16578    
## skipped     -0.08311    0.02600  -3.197  0.00173 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.3295 on 137 degrees of freedom
## Multiple R-squared:  0.2336,	Adjusted R-squared:  0.2168 
## F-statistic: 13.92 on 3 and 137 DF,  p-value: 5.653e-08
```

(i) Using the standard normal approximation, find the 95% confidence interval for bhsGPA.



```
## [1] 0.5956486
```

```
## [1] 0.2283514
```

(ii) Can you reject the hypothesis ${H_0}$: bhsGPA = .4 against the two-sided alternative at the 5% level?

The value bhsGPA = .4 is inside the 95% CI, therefore fail to reject the hypothesis ${H_0}$.

(iii) Can you reject the hypothesis ${H_0}$: bhsGPA = 1 against the two-sided alternative at the 5% level?

The value bhsGPA = 1 is not inside the 95% CI, therefore reject the hypothesis ${H_0}$.

## Problem 7

In Example 4.7, we used data on nonunionized manufacturing firms to estimate the relationship between the scrap rate and other firm characteristics. We now look at this example more closely and use all available firms.

(i) The population model estimated in Example 4.7 can be written as 

$$lscrap =  \beta_0 + \beta_1 * hrsemp + \beta_2 * lsales + \beta_3 * lemploy + u$$

Using the 43 observations available for 1987, the estimated equation is 

Compare this equation to that estimated using only the 29 nonunionized firms in
the sample.




```
## 
## Call:
## lm(formula = lscrap ~ hrsemp + lsales + lemploy, data = jtrain %>% 
##     filter(year == 1987))
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.81878 -0.91530  0.03304  0.87052  2.68042 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)   
## (Intercept) 11.74426    4.57470   2.567  0.01420 * 
## hrsemp      -0.04218    0.01868  -2.259  0.02957 * 
## lsales      -0.95064    0.36984  -2.570  0.01409 * 
## lemploy      0.99213    0.35692   2.780  0.00833 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.3 on 39 degrees of freedom
##   (114 observations deleted due to missingness)
## Multiple R-squared:  0.3099,	Adjusted R-squared:  0.2568 
## F-statistic: 5.838 on 3 and 39 DF,  p-value: 0.002148
```


```
## 
## Call:
## lm(formula = lscrap ~ hrsemp + lsales + lemploy, data = jtrain %>% 
##     filter(year == 1987 & union == 0))
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.6301 -0.7523 -0.4016  0.8697  2.8273 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)  
## (Intercept) 12.45837    5.68677   2.191   0.0380 *
## hrsemp      -0.02927    0.02280  -1.283   0.2111  
## lsales      -0.96203    0.45252  -2.126   0.0436 *
## lemploy      0.76147    0.40743   1.869   0.0734 .
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.376 on 25 degrees of freedom
##   (97 observations deleted due to missingness)
## Multiple R-squared:  0.2624,	Adjusted R-squared:  0.1739 
## F-statistic: 2.965 on 3 and 25 DF,  p-value: 0.05134
```

```
## [1] 0.03894561
```

```
## [1] 0.009645609
```

```
## [1] -0.06824561
```

The standard error on hrsemp has not changed, the magnitude of the coefficient has increased by half.  The t statistic on hrsemp has gone from about –1.28 to –2.21, so now the coefficient is statistically less than zero at the 5% level.  (From Table G.2 the 5% critical value with 40 df is –1.684.  The 1% critical value is –2.423, so the p-value is between .01 and .05.)

(ii) Show that the population model can also be written as
log(scrap) 5 b0 1 b1hrsemp 1 b2log(sales/employ) 1 u3log(employ) 1 u,
where u3 5 b2 1 b3. [Hint: Recall that log(x2/x3) 5 log(x2) 2 log(x3).] Interpret the

log(scrap)5 11.74 2 .042 hrsemp2 .951 log(sales)1 .992 log(employ) (4.57) (.019) (.370) (.360)
n543,R2 5.310.
hypothesis H0: u3 5 0.

(iii) When the equation from part (ii) is estimated, we obtain Controlling for worker training and for the sales-to-employee ratio, do bigger firms have larger statistically significant scrap rates?

(iv) Test the hypothesis that a 1% increase in sales/employ is associated with a 1% drop in the scrap rate.

## Problem 9

In Problem 3 in Chapter 3, we estimated the equation

$$sleep =  3638.25 - .148 * totwrk - 11.13 * educ + 2.20 * age $$
$$n = 706, R^{2} = .113$$

where we now report standard errors along with the estimates.




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

(i) Is either educ or age individually significant at the 5% level against a two-sided alternative? Show your work.

With df = 706 – 4 = 702, we use the standard normal critical value (df = $\infty$ in Table G.2), which is 1.96 for a two-tailed test at the 5% level.  
$t_{educ}$ = -11.13/5.88 $\sim$ -1.89, so |$t_{educ}$| = 1.89 < 1.96, therefore fail to reject $H_0$:  $t_{educ}$ = 0 at the 5% level.  educ is statistically insignificant at the 5% level.

$t_{age}$ = 2.20/1.446 $\sim$ 1.522, so |$t_{age}$| = 1.522 < 1.96, therefore fail to reject $H_0$: $t_{age}$ = 0 at the 5% level.  age is statistically insignificant at the 5% level.


(ii) Dropping educ and age from the equation gives

Are educ and age jointly significant in the original equation at the 5% level? Justify your answer.


```
## 
## Call:
## lm(formula = sleep ~ totwrk, data = sleep75)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2429.94  -240.25     4.91   250.53  1339.72 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 3586.37695   38.91243  92.165   <2e-16 ***
## totwrk        -0.15075    0.01674  -9.005   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 421.1 on 704 degrees of freedom
## Multiple R-squared:  0.1033,	Adjusted R-squared:  0.102 
## F-statistic: 81.09 on 1 and 704 DF,  p-value: < 2.2e-16
```

Compute the R-squared form of the F statistic for joint significance.  


```
## [1] 3.9891
```

```
## [1] 3.008553
```

```
## Analysis of Variance Table
## 
## Model 1: sleep ~ totwrk + educ + age
## Model 2: sleep ~ totwrk
##   Res.Df       RSS Df Sum of Sq      F  Pr(>F)  
## 1    702 123455057                              
## 2    704 124858119 -2  -1403061 3.9891 0.01894 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

F = [(.113 - .103)/(1 - .113)](702/2) $\sim$ 3.96.  

The 5% critical value in the $F_{2,702}$ distribution can be obtained from Table G.3b with denominator df = $\infty$:  critical value = 3.00.  Therefore, educ and age are jointly significant at the 5% level (3.96 > 3.00).  In fact, the p-value is about .019, and so educ and age are jointly significant at the 5% level.


(iii) Does including educ and age in the model greatly affect the estimated tradeoff between sleeping and working?

These variables are jointly significant, but including them only changes the coefficient on totwrk from -0.151 to -0.148.

(iv) Suppose that the sleep equation contains heteroskedasticity. What does this mean about the tests computed in parts (i) and (ii)?

Bothe standard t and F statistics assume homoskedasticity, in addition to the other CLM assumptions.  If the sleep equation contains heteroskedasticity, the tests are not valid.

## Problem 11

The following table was created using the data in CEOSAL, where standard errors are in parentheses below the coefficients:


```
## 
## Call:
## lm(formula = lsalary ~ lsales + lmktval + profmarg + ceoten + 
##     comten, data = ceosal2)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.5436 -0.2796 -0.0164  0.2857  1.9879 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  4.571977   0.253466  18.038  < 2e-16 ***
## lsales       0.187787   0.040003   4.694 5.46e-06 ***
## lmktval      0.099872   0.049214   2.029  0.04397 *  
## profmarg    -0.002211   0.002105  -1.050  0.29514    
## ceoten       0.017104   0.005540   3.087  0.00236 ** 
## comten      -0.009238   0.003337  -2.768  0.00626 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4947 on 171 degrees of freedom
## Multiple R-squared:  0.3525,	Adjusted R-squared:  0.3336 
## F-statistic: 18.62 on 5 and 171 DF,  p-value: 9.488e-15
```

```
## 
## Call:
## lm(formula = lsalary ~ lsales + lmktval + profmarg, data = ceosal2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.26981 -0.30174 -0.01638  0.30474  1.91129 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  4.620690   0.254344  18.167  < 2e-16 ***
## lsales       0.158483   0.039814   3.981 0.000101 ***
## lmktval      0.112261   0.050393   2.228 0.027190 *  
## profmarg    -0.002259   0.002165  -1.043 0.298346    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5102 on 173 degrees of freedom
## Multiple R-squared:  0.3035,	Adjusted R-squared:  0.2914 
## F-statistic: 25.13 on 3 and 173 DF,  p-value: 1.522e-13
```

```
## 
## Call:
## lm(formula = lsalary ~ lsales, data = ceosal2)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.12794 -0.33918  0.00698  0.30456  1.86858 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  4.96108    0.19996  24.810  < 2e-16 ***
## lsales       0.22428    0.02713   8.267 3.32e-14 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5154 on 175 degrees of freedom
## Multiple R-squared:  0.2809,	Adjusted R-squared:  0.2767 
## F-statistic: 68.35 on 1 and 175 DF,  p-value: 3.317e-14
```

The variable mktval is market value of the firm, profmarg is profit as a percentage of sales, ceoten is years as CEO with the current company, and comten is total years with the company.

(i) Comment on the effect of profmarg on CEO

In model 1 and 2, the coefficient on lmktval is actually negative (0.0999 and 0.112), although its t statistic is only about –1.  Once firm sales and market value have been controlled for, profit margin has no effect on CEO salary.


```
## Analysis of Variance Table
## 
## Model 1: lsalary ~ lsales + lmktval + profmarg + ceoten + comten
## Model 2: lsalary ~ lsales + lmktval + profmarg
##   Res.Df    RSS Df Sum of Sq      F   Pr(>F)   
## 1    171 41.856                                
## 2    173 45.026 -2   -3.1704 6.4763 0.001944 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

(ii) Does market value have a significant effect? Explain.

In model 1 and 2, the coefficient on profmarg is  positive (-0.00221 and -0.00226), although its t statistic is only about 0.1.  Once firm sales and profit as a percentage of sales have been controlled for, market value haseffect on CEO salary.

In model 1, market value controls for the most factors affecting salary.  The t statistic on log(mktval) is 2.03, which is significant at the 5% level against a two-sided alternative. log(mktval) is statistically significant.  Because the coefficient is an elasticity, a ceteris paribus 10% increase in market value is predicted to increase salary by 1%.  This is not a large nor negligible effect.

(iii) Interpret the coefficients on ceoten and comten. Are these explanatory variables statistically significant?

In model 1, years as ceo with company the t statistic on ceoten is 3.09, which is significant at the 5% level against a two-sided alternative. ceoten is statistically significant.

Other factors fixed, another year as CEO with the company increases salary by about 1.71%. 

In model 1, years with company the t statistic on ceoten is -2.77, which is significant at the 5% level against a two-sided alternative. comten is statistically significant.

Other factors fixed, another year with the company decreases salary by about 1.71%.

(iv) What do you make of the fact that longer tenure with the company, holding the other factors fixed, is associated with a lower salary?

One possibility is that firms that hire CEOs from outside the company (lower tenure with the company) often go after a small pool of highly regarded candidates, and salaries of these people are bid up.  

## C1

The following model can be used to study whether campaign expenditures affect election outcomes:

$$voteA =  \beta_0 + \beta_1 * lexpendA + \beta_2 * lexpendB + \beta_3 * prtystrA + u$$

where voteA is the percentage of the vote received by Candidate A, expendA and expendB are campaign expenditures by Candidates A and b, and prtystrA is a measure of party strength for Candidate A (the percentage of the most recent presidential vote that went to A’s party).

(i) What is the interpretation of $\beta_1$?




```
## 
## Call:
## lm(formula = voteA ~ lexpendA + lexpendB + prtystrA, data = vote1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -20.3968  -5.4174  -0.8679   4.9551  26.0660 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 45.07893    3.92631   11.48   <2e-16 ***
## lexpendA     6.08332    0.38215   15.92   <2e-16 ***
## lexpendB    -6.61542    0.37882  -17.46   <2e-16 ***
## prtystrA     0.15196    0.06202    2.45   0.0153 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 7.712 on 169 degrees of freedom
## Multiple R-squared:  0.7926,	Adjusted R-squared:  0.7889 
## F-statistic: 215.2 on 3 and 169 DF,  p-value: < 2.2e-16
```
Holding other factors fixed, $\Delta$voteA = $\beta_1\Delta$lexpendA where we use the fact that 100 * $\Delta$lexpendA $\sim$ %$\Delta$lexpendA.  So  $\beta_1$/100 is the (ceteris paribus) percentage point change in voteA when expendA increases by one percent.

(ii) In terms of the parameters, state the null hypothesis that a 1% increase in A’s expenditures is offset by a 1% increase in B’s expenditures.

${H_0}: \beta_1 - \beta_2 = 0$
${H_1}: \beta_1 - \beta_2 \ne 0$

(iii) Estimate the given model using the data in VOTE1 and report the results in usual form. Do A’s expenditures affect the outcome? What about B’s expenditures? Can you use these results to test the hypothesis in part (ii)?

(iv) Estimate a model that directly gives the t statistic for testing the hypothesis in part

(ii) What do you conclude? (Use a two-sided alternative.)

The coefficient on log(expendA) is very significant (t statistic = 15.9).  The estimates imply that a 10% ceteris paribus increase in spending by candidate A increases the predicted share of the vote going to A by about 0.608 percentage points. 

The coefficient on log(expendB) is very significant (t statistic = -17.5).  The estimates imply that a 10% ceteris paribus decrease in spending by candidate B increases the predicted share of the vote going to A by about -0.662 percentage points. 

The coefficients on log(expendA) and log(expendB) are of similar magnitudes but opposite in sign, we do not have the standard error of   +  , which is what we would need to test the hypothesis from part (ii).


## C2

Refer to Computer Exercise C2 in Chapter 3. Now, use the log of the housing price as the dependent variable:

$$log(price) =  \beta_0 + \beta_1 * sqrft + \beta_2 * bdrms  + u$$


(i) You are interested in estimating and obtaining a confidence interval for the percentage change in price when a 150-square-foot bedroom is added to a house. In decimal form, this is $\theta_1$ = 150 $\beta_1$ + $\beta_2$ Use the data in HPRICE1 to estimate u1.




```
## 
## Call:
## lm(formula = lprice ~ sqrft + bdrms, data = hprice1)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.75448 -0.12322 -0.01993  0.11938  0.62948 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 4.766e+00  9.704e-02  49.112  < 2e-16 ***
## sqrft       3.794e-04  4.321e-05   8.781  1.5e-13 ***
## bdrms       2.888e-02  2.964e-02   0.974    0.333    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.1971 on 85 degrees of freedom
## Multiple R-squared:  0.5883,	Adjusted R-squared:  0.5786 
## F-statistic: 60.73 on 2 and 85 DF,  p-value: < 2.2e-16
```

Therefore, $\hat{\theta_1}$ = 150 (0.000379) + 0.0289 = 0.0858, which means that an additional 150 square foot bedroom increases the predicted price by about 8.6%.

$\hat{\theta_1}$ = 0.0858, $\beta_1$ = 0.000379, $\beta_2$ = 0.0289

(ii) Write $\beta_2$ in terms of $\theta_1$ and $\beta_1$ and plug this into the log(price) equation.

$\theta_1$ = 150 $\beta_1$ + $\beta_2$

$\theta_1$ - 150 $\beta_1$ = $\beta_2$

log(price)	=	 $\beta_0$ +  $\beta_1$ sqrft  + ($\theta_1$ – 150 $\beta_1$) bdrms  + u
log(price)	=	 $\beta_0$ +  $\beta_1$ (sqrft – 150 bdrms) +  $\theta_1$ bdrms + u.


(iii) Use part (ii) to obtain a standard error for $\theta_1$ and use this standard error to construct a 95% confidence interval.

log(price) on (sqrft – 150 bdrms)

$\hat{\theta_1}$ = 0.0858; now we also get se($\hat{\theta_1}$) = 0.0268.  The 95% confidence interval is 0.0326 to 0.1390 (3.3% to 13.9%).
