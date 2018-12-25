Sample size is `r nrow(k401k)`. $R^{2}$ value is `r round(summary(fit)$r.square, 4)`. Adjusted $R^{2}$ value is `r round(summary(fit)$adj.r.square, 4)`.


`r signif(summary(fit)$coefficients["(Intercept)", 1], 3)`


`r signif(summary(fit)$coefficients["X", 1], 3)`

$$\hat{prate} =  \hat{\beta}_0 + \hat{\beta}_1 * mrate$$,
$$n = 722, R^{2} = .214$$
  

A 10% increase in `expendidure` is associated with a `r signif(abs(summary(fit)$coefficients["lexpend", 1]), 3)` in the average perc studs passing MEAP math`r ifelse(summary(fit)$coefficients["lexpend", 1] > 0, "increase", "decrease")` and this effect is  ``r ifelse(summary(fit)$coefficients["lexpend", 4] < 0.1, "is", "is not")` statistically significant at 1%`.

The Adjusted $R^{2}$ value is `r round(summary(fit)$r.square, 4)`. This tells us that `r round(summary(fit)$r.square*100, 2)`% of the variation in percentage of eligible workers with an active account, as quantified by `prate`, is explained by ``r attr(summary(fit)$terms,"term.labels")``.

$$sleep =  \beta_0 + \beta_1 * totwrk + \beta_2 * educ + \beta_3 * age + u$$,
$$x =  \beta_0 + \beta_1 * x + \beta_2 * x + \beta_3 * x + u$$,
$$x =  \beta_0 + \beta_1 * x + \beta_2 * x  + u$$,
```{r}
pred <- predict(fit, new, se.fit = TRUE)
hprice1[1, "price"] - pred$fit
```

signif(summary(fit)$coefficients["sqrft", 1], 3) * 140


```{r}
new <- data.frame(hsperc = c(20), sat = c(1050))
predict(fit, new, se.fit = TRUE)
```
abs(qt(0.05, 526))
abs(qt(0.001, 526))
