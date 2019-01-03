---
title: "Chapter 13"
author: "Marjorie Blanco"
date: "12/20/2018"
output: html_document
---



# Pooling Cross Sections Across Time: Simple Panel Data Method

## Exercise 13.1


```r
data('fertil1')
```


```r
fertil1 <- fertil1 %>% select(educ, age:agesq)
fit <- lm(kids~., data=fertil1)

summary(fit)
```

```
## 
## Call:
## lm(formula = kids ~ ., data = fertil1)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.9878 -1.0086 -0.0767  0.9331  4.6548 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -7.742457   3.051767  -2.537 0.011315 *  
## educ        -0.128427   0.018349  -6.999 4.44e-12 ***
## age          0.532135   0.138386   3.845 0.000127 ***
## black        1.075658   0.173536   6.198 8.02e-10 ***
## east         0.217324   0.132788   1.637 0.101992    
## northcen     0.363114   0.120897   3.004 0.002729 ** 
## west         0.197603   0.166913   1.184 0.236719    
## farm        -0.052557   0.147190  -0.357 0.721105    
## othrural    -0.162854   0.175442  -0.928 0.353481    
## town         0.084353   0.124531   0.677 0.498314    
## smcity       0.211879   0.160296   1.322 0.186507    
## y74          0.268183   0.172716   1.553 0.120771    
## y76         -0.097379   0.179046  -0.544 0.586633    
## y78         -0.068666   0.181684  -0.378 0.705544    
## y80         -0.071305   0.182771  -0.390 0.696511    
## y82         -0.522484   0.172436  -3.030 0.002502 ** 
## y84         -0.545166   0.174516  -3.124 0.001831 ** 
## agesq       -0.005804   0.001564  -3.710 0.000217 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.555 on 1111 degrees of freedom
## Multiple R-squared:  0.1295,	Adjusted R-squared:  0.1162 
## F-statistic: 9.723 on 17 and 1111 DF,  p-value: < 2.2e-16
```

## Exercise 13.2


```r
data('cps78_85')
```


```r
fit <- lm(lwage~y85+educ+y85educ+exper+expersq+union+female+y85fem, data=cps78_85)
summary(fit)
```

```
## 
## Call:
## lm(formula = lwage ~ y85 + educ + y85educ + exper + expersq + 
##     union + female + y85fem, data = cps78_85)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.56098 -0.25828  0.00864  0.26571  2.11669 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  4.589e-01  9.345e-02   4.911 1.05e-06 ***
## y85          1.178e-01  1.238e-01   0.952   0.3415    
## educ         7.472e-02  6.676e-03  11.192  < 2e-16 ***
## y85educ      1.846e-02  9.354e-03   1.974   0.0487 *  
## exper        2.958e-02  3.567e-03   8.293 3.27e-16 ***
## expersq     -3.994e-04  7.754e-05  -5.151 3.08e-07 ***
## union        2.021e-01  3.029e-02   6.672 4.03e-11 ***
## female      -3.167e-01  3.662e-02  -8.648  < 2e-16 ***
## y85fem       8.505e-02  5.131e-02   1.658   0.0977 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4127 on 1075 degrees of freedom
## Multiple R-squared:  0.4262,	Adjusted R-squared:  0.4219 
## F-statistic:  99.8 on 8 and 1075 DF,  p-value: < 2.2e-16
```

## Exercise 13.2


```r
data('kielmc')
```


```r
fit <- lm(rprice~nearinc, data=kielmc %>% filter(year == 1981))
summary(fit)
```

```
## 
## Call:
## lm(formula = rprice ~ nearinc, data = kielmc %>% filter(year == 
##     1981))
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -60678 -19832  -2997  21139 136754 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   101308       3093  32.754  < 2e-16 ***
## nearinc       -30688       5828  -5.266 5.14e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 31240 on 140 degrees of freedom
## Multiple R-squared:  0.1653,	Adjusted R-squared:  0.1594 
## F-statistic: 27.73 on 1 and 140 DF,  p-value: 5.139e-07
```


```r
fit <- lm(rprice~nearinc, data=kielmc %>% filter(year == 1978))
summary(fit)
```

```
## 
## Call:
## lm(formula = rprice ~ nearinc, data = kielmc %>% filter(year == 
##     1978))
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -56517 -16605  -3193   8683 236307 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    82517       2654  31.094  < 2e-16 ***
## nearinc       -18824       4745  -3.968 0.000105 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 29430 on 177 degrees of freedom
## Multiple R-squared:  0.08167,	Adjusted R-squared:  0.07648 
## F-statistic: 15.74 on 1 and 177 DF,  p-value: 0.0001054
```


```r
fit <- lm(rprice~y81+nearinc+y81nrinc, data=kielmc %>% filter(between(year, 1978, 1981)))
summary(fit)
```

```
## 
## Call:
## lm(formula = rprice ~ y81 + nearinc + y81nrinc, data = kielmc %>% 
##     filter(between(year, 1978, 1981)))
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -60678 -17693  -3031  12483 236307 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    82517       2727  30.260  < 2e-16 ***
## y81            18790       4050   4.640 5.12e-06 ***
## nearinc       -18824       4875  -3.861 0.000137 ***
## y81nrinc      -11864       7457  -1.591 0.112595    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 30240 on 317 degrees of freedom
## Multiple R-squared:  0.1739,	Adjusted R-squared:  0.1661 
## F-statistic: 22.25 on 3 and 317 DF,  p-value: 4.224e-13
```

## Exercise 13.3


```r
data('injury')
```


```r
fit <- lm(ldurat~afchnge+highearn+I(afchnge*highearn), data=injury)
summary(fit)
```

```
## 
## Call:
## lm(formula = ldurat ~ afchnge + highearn + I(afchnge * highearn), 
##     data = injury)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.0128 -0.7214 -0.0171  0.7714  4.0047 
## 
## Coefficients:
##                       Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            1.19934    0.02711  44.241  < 2e-16 ***
## afchnge                0.02364    0.03970   0.595  0.55164    
## highearn               0.21520    0.04336   4.963 7.11e-07 ***
## I(afchnge * highearn)  0.18835    0.06279   2.999  0.00271 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.298 on 7146 degrees of freedom
## Multiple R-squared:  0.01584,	Adjusted R-squared:  0.01543 
## F-statistic: 38.34 on 3 and 7146 DF,  p-value: < 2.2e-16
```
