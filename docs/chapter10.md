

# Basic Regression Analysis with Time Series Data

## Example 10.1




```
## 
## Call:
## lm(formula = inf ~ unem, data = phillips %>% filter(year < 1997))
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -5.3826 -1.9797 -0.7229  1.3577  8.7562 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)
## (Intercept)   1.4236     1.7190   0.828    0.412
## unem          0.4676     0.2891   1.617    0.112
## 
## Residual standard error: 3.131 on 47 degrees of freedom
## Multiple R-squared:  0.05272,	Adjusted R-squared:  0.03257 
## F-statistic: 2.616 on 1 and 47 DF,  p-value: 0.1125
```

## Example 10.2




```
## 
## Call:
## lm(formula = i3 ~ inf + def, data = intdef)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.9948 -1.1694  0.1959  0.9602  4.7224 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.73327    0.43197   4.012  0.00019 ***
## inf          0.60587    0.08213   7.376 1.12e-09 ***
## def          0.51306    0.11838   4.334 6.57e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.843 on 53 degrees of freedom
## Multiple R-squared:  0.6021,	Adjusted R-squared:  0.5871 
## F-statistic: 40.09 on 2 and 53 DF,  p-value: 2.483e-11
```


## Example 10.3




```
## 
## Call:
## lm(formula = lprepop ~ lmincov + lusgnp, data = prminwge %>% 
##     filter(between(year, 1950, 1987)))
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.117133 -0.036998 -0.005943  0.028182  0.113938 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)  
## (Intercept) -1.05442    0.76541  -1.378   0.1771  
## lmincov     -0.15444    0.06490  -2.380   0.0229 *
## lusgnp      -0.01219    0.08851  -0.138   0.8913  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.0557 on 35 degrees of freedom
## Multiple R-squared:  0.6605,	Adjusted R-squared:  0.6411 
## F-statistic: 34.04 on 2 and 35 DF,  p-value: 6.17e-09
```

## Example 10.4




```
## 
## Call:
## lm(formula = gfr ~ pe + ww2 + pill, data = fertil3 %>% filter(between(year, 
##     1913, 1984)))
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -27.0187  -9.6195   0.3393   9.4746  28.0730 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  98.68176    3.20813  30.760  < 2e-16 ***
## pe            0.08254    0.02965   2.784  0.00694 ** 
## ww2         -24.23840    7.45825  -3.250  0.00180 ** 
## pill        -31.59403    4.08107  -7.742 6.46e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 14.69 on 68 degrees of freedom
## Multiple R-squared:  0.4734,	Adjusted R-squared:  0.4502 
## F-statistic: 20.38 on 3 and 68 DF,  p-value: 1.575e-09
```

```
## 
## Call:
## lm(formula = gfr ~ pe + pe_1 + pe_2 + ww2 + pill, data = fertil3 %>% 
##     filter(between(year, 1913, 1984)))
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -24.6461  -9.5409  -0.0312   8.3378  29.1295 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  95.87050    3.28196  29.211  < 2e-16 ***
## pe            0.07267    0.12553   0.579   0.5647    
## pe_1         -0.00578    0.15566  -0.037   0.9705    
## pe_2          0.03383    0.12626   0.268   0.7896    
## ww2         -22.12650   10.73197  -2.062   0.0433 *  
## pill        -31.30499    3.98156  -7.862 5.63e-11 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 14.27 on 64 degrees of freedom
##   (2 observations deleted due to missingness)
## Multiple R-squared:  0.4986,	Adjusted R-squared:  0.4594 
## F-statistic: 12.73 on 5 and 64 DF,  p-value: 1.353e-08
```

## Example 10.5




```
## 
## Call:
## lm(formula = lchnimp ~ lchempi + lgas + lrtwex + befile6 + affile6 + 
##     afdec6, data = barium)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.03356 -0.39080  0.03048  0.40248  1.51719 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -17.80300   21.04537  -0.846   0.3992    
## lchempi       3.11719    0.47920   6.505 1.72e-09 ***
## lgas          0.19635    0.90662   0.217   0.8289    
## lrtwex        0.98302    0.40015   2.457   0.0154 *  
## befile6       0.05957    0.26097   0.228   0.8198    
## affile6      -0.03241    0.26430  -0.123   0.9026    
## afdec6       -0.56524    0.28584  -1.978   0.0502 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5974 on 124 degrees of freedom
## Multiple R-squared:  0.3049,	Adjusted R-squared:  0.2712 
## F-statistic: 9.064 on 6 and 124 DF,  p-value: 3.255e-08
```

## Example 10.7




```
## 
## Call:
## lm(formula = linvpc ~ lprice, data = hseinv)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.45991 -0.08694 -0.01264  0.08651  0.34672 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -0.55023    0.04303 -12.788 1.03e-15 ***
## lprice       1.24094    0.38242   3.245  0.00238 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.1554 on 40 degrees of freedom
## Multiple R-squared:  0.2084,	Adjusted R-squared:  0.1886 
## F-statistic: 10.53 on 1 and 40 DF,  p-value: 0.002376
```

```
## 
## Call:
## lm(formula = linvpc ~ lprice + t, data = hseinv)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -0.45092 -0.08583 -0.01734  0.08517  0.26024 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -0.913060   0.135613  -6.733    5e-08 ***
## lprice      -0.380961   0.678835  -0.561  0.57787    
## t            0.009829   0.003512   2.798  0.00794 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.1436 on 39 degrees of freedom
## Multiple R-squared:  0.3408,	Adjusted R-squared:  0.307 
## F-statistic: 10.08 on 2 and 39 DF,  p-value: 0.000296
```

## Example 10.8




```
## 
## Call:
## lm(formula = gfr ~ pe + ww2 + pill + t, data = fertil3 %>% filter(between(year, 
##     1913, 1984)))
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -24.6418  -8.4574   0.2445   9.3819  17.2837 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 111.76943    3.35777  33.287  < 2e-16 ***
## pe            0.27888    0.04002   6.968 1.72e-09 ***
## ww2         -35.59228    6.29738  -5.652 3.53e-07 ***
## pill          0.99745    6.26163   0.159    0.874    
## t            -1.14987    0.18790  -6.119 5.49e-08 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 11.85 on 67 degrees of freedom
## Multiple R-squared:  0.6622,	Adjusted R-squared:  0.642 
## F-statistic: 32.84 on 4 and 67 DF,  p-value: 3.756e-15
```


```
## 
## Call:
## lm(formula = gfr ~ pe + ww2 + pill + t + tsq, data = fertil3 %>% 
##     filter(between(year, 1913, 1984)))
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -25.9791  -6.9775  -0.2713   7.7975  19.9861 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 124.091935   4.360738  28.457  < 2e-16 ***
## pe            0.347813   0.040260   8.639 1.91e-12 ***
## ww2         -35.880277   5.707921  -6.286 2.95e-08 ***
## pill        -10.119723   6.336094  -1.597 0.115008    
## t            -2.531426   0.389386  -6.501 1.24e-08 ***
## tsq           0.019613   0.004971   3.945 0.000196 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 10.74 on 66 degrees of freedom
## Multiple R-squared:  0.7267,	Adjusted R-squared:  0.706 
## F-statistic: 35.09 on 5 and 66 DF,  p-value: < 2.2e-16
```

## Example 10.9


```
## 
## Call:
## lm(formula = lprepop ~ lmincov + lusgnp + t, data = prminwge %>% 
##     filter(between(year, 1950, 1987)))
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.049493 -0.024425 -0.009596  0.017055  0.086354 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -8.696298   1.295764  -6.711 1.04e-07 ***
## lmincov     -0.168695   0.044246  -3.813 0.000552 ***
## lusgnp       1.057351   0.176637   5.986 8.98e-07 ***
## t           -0.032354   0.005023  -6.442 2.31e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.03793 on 34 degrees of freedom
## Multiple R-squared:  0.8471,	Adjusted R-squared:  0.8336 
## F-statistic: 62.78 on 3 and 34 DF,  p-value: 6.007e-14
```

## C1


```
## 
## Call:
## lm(formula = i3 ~ inf + def + y79, data = intdef)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.4674 -0.8407  0.2388  1.0148  3.9654 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.29623    0.42535   3.047  0.00362 ** 
## inf          0.60842    0.07625   7.979 1.37e-10 ***
## def          0.36266    0.12025   3.016  0.00396 ** 
## y79TRUE      1.55877    0.50577   3.082  0.00329 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.711 on 52 degrees of freedom
## Multiple R-squared:  0.6635,	Adjusted R-squared:  0.6441 
## F-statistic: 34.18 on 3 and 52 DF,  p-value: 2.408e-12
```

## C2


```
## 
## Call:
## lm(formula = lchnimp ~ lchempi + lgas + lrtwex + befile6 + affile6 + 
##     afdec6, data = barium)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.03356 -0.39080  0.03048  0.40248  1.51719 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -17.80300   21.04537  -0.846   0.3992    
## lchempi       3.11719    0.47920   6.505 1.72e-09 ***
## lgas          0.19635    0.90662   0.217   0.8289    
## lrtwex        0.98302    0.40015   2.457   0.0154 *  
## befile6       0.05957    0.26097   0.228   0.8198    
## affile6      -0.03241    0.26430  -0.123   0.9026    
## afdec6       -0.56524    0.28584  -1.978   0.0502 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5974 on 124 degrees of freedom
## Multiple R-squared:  0.3049,	Adjusted R-squared:  0.2712 
## F-statistic: 9.064 on 6 and 124 DF,  p-value: 3.255e-08
```

```
## 
## Call:
## lm(formula = lchnimp ~ lchempi + lgas + lrtwex + befile6 + affile6 + 
##     afdec6 + t, data = barium)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.94317 -0.31168  0.03172  0.36366  1.21218 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)   
## (Intercept) -2.367526  20.782165  -0.114  0.90949   
## lchempi     -0.686236   1.239711  -0.554  0.58089   
## lgas         0.465679   0.876178   0.531  0.59604   
## lrtwex       0.078224   0.472440   0.166  0.86876   
## befile6      0.090470   0.251289   0.360  0.71945   
## affile6      0.097006   0.257313   0.377  0.70683   
## afdec6      -0.351502   0.282542  -1.244  0.21584   
## t            0.012706   0.003844   3.305  0.00124 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5748 on 123 degrees of freedom
## Multiple R-squared:  0.3616,	Adjusted R-squared:  0.3252 
## F-statistic: 9.951 on 7 and 123 DF,  p-value: 8.358e-10
```


```
## 
## Call:
## lm(formula = lchnimp ~ lchempi + lgas + lrtwex + befile6 + affile6 + 
##     afdec6 + t + feb + mar + apr + may + jun + jul + aug + sep + 
##     oct + nov + dec, data = barium)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.86054 -0.36284  0.02233  0.37155  1.09845 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)   
## (Intercept) 27.300074  31.397067   0.870  0.38643   
## lchempi     -0.451656   1.271528  -0.355  0.72310   
## lgas        -0.820624   1.345056  -0.610  0.54303   
## lrtwex      -0.197141   0.529531  -0.372  0.71038   
## befile6      0.164851   0.256979   0.641  0.52251   
## affile6      0.153400   0.271986   0.564  0.57388   
## afdec6      -0.295016   0.299428  -0.985  0.32662   
## t            0.012339   0.003916   3.151  0.00209 **
## feb         -0.355415   0.293754  -1.210  0.22886   
## mar          0.062566   0.254858   0.245  0.80652   
## apr         -0.440615   0.258398  -1.705  0.09093 . 
## may          0.031299   0.259200   0.121  0.90410   
## jun         -0.200950   0.259213  -0.775  0.43984   
## jul          0.011111   0.268378   0.041  0.96705   
## aug         -0.127114   0.267792  -0.475  0.63594   
## sep         -0.075193   0.258350  -0.291  0.77155   
## oct          0.079763   0.257051   0.310  0.75691   
## nov         -0.260303   0.253062  -1.029  0.30588   
## dec          0.096533   0.261553   0.369  0.71277   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.5788 on 112 degrees of freedom
## Multiple R-squared:  0.4106,	Adjusted R-squared:  0.3158 
## F-statistic: 4.334 on 18 and 112 DF,  p-value: 6.188e-07
```

## C3


```
## 
## Call:
## lm(formula = lprepop ~ lmincov + lusgnp + lprgnp + t, data = prminwge %>% 
##     filter(between(year, 1950, 1987)))
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.054679 -0.023653 -0.004039  0.018638  0.076947 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -6.663432   1.257831  -5.298 7.67e-06 ***
## lmincov     -0.212261   0.040152  -5.286 7.92e-06 ***
## lusgnp       0.486046   0.221983   2.190   0.0357 *  
## lprgnp       0.285239   0.080492   3.544   0.0012 ** 
## t           -0.026663   0.004627  -5.763 1.94e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.03277 on 33 degrees of freedom
## Multiple R-squared:  0.8892,	Adjusted R-squared:  0.8758 
## F-statistic: 66.23 on 4 and 33 DF,  p-value: 2.677e-15
```

## C4



## C5



## C6


```
## 
## Call:
## lm(formula = gfr ~ t + tsq, data = fertil3 %>% filter(between(year, 
##     1913, 1984)))
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -28.7519 -12.5333   0.3168  13.7611  28.7346 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 107.056263   6.049651  17.696   <2e-16 ***
## t             0.071697   0.382446   0.187    0.852    
## tsq          -0.007959   0.005077  -1.568    0.122    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 16.64 on 69 degrees of freedom
## Multiple R-squared:  0.3141,	Adjusted R-squared:  0.2942 
## F-statistic:  15.8 on 2 and 69 DF,  p-value: 2.243e-06
```


