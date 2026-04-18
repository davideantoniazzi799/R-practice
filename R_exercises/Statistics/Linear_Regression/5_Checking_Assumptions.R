# DIAGNOSTIC OF THE ASSUMPTIONS OF THE LINEAR MODEL

# The four assumption within a linear model:
# 1 - the relationship between the exposure variable and the outcome variable
# 2 - the residuals have a normal distribution
# 3 - homoscedastic: the variance of the residuals is spread evenly across 
#     all the fitted values. Basically, it doesn't have a pattern.
# 4 - The residuals are indipendent from each other (not like a time series for example)

library(tidyverse)

mtcars %>% 
  mutate(predicted=predict(lm(mpg~wt, data = .))) %>%
  ggplot(aes(wt, mpg))+
  geom_point(size=1.5)+
  geom_smooth(method=lm, se=F,size=0.5)+
  geom_segment(aes(xend=wt,yend=predicted), color="red")+
  theme_bw()

# Model
model <- lm(mpg ~ wt, data = mtcars)
plot(model)

# The first plot is about Residuals vs. Fitted
# We can visually check the distribution, how they spread, if there's a pattern
# and if there are more or less the same number of residuals above and below the line
# A pattern might suggest a dependency

# The second plot is about the Q-Q Residuals.
# The idea is to have as many as possible points along the dotted line
# In that case, the more there are the more the residuals have a normal distribution

# The third plot helps to visually check the homoscedatic assumption.
# If there is no pattern, it's respected

# STATISTICAL TEST
# 1) FOR LINEARITY: HARVEY-COLLIER MULTIPLIER TEST
library(lmtest)
harvtest(model)
# The null hypothesis is that our model has a linear relationship
# Therefore, we would like to have a large p-value
# This p-value is pretty high and good, so we accept the hull hypothesis

# 2) FOR RESIDUALS FOLLOWING A NORMAL DISTRIBUTION: SHAPIRO-WILK TEST
shapiro.test(residuals(model))
# The p-value is not small, so we accept the null hypothesis
# (that the residuals are normally distributed)

# 3) FOR RESIDUALS HOMOSCEDASTIC: BREUSCH-PAGAN TEST
bptest(model)
# Large p-value, so accept null hypothesis (yes homoscedastic)

# 4) FOR INDIPENDENCY OF THE RESIDUALS: DURBIN WATSON TEST
library(car)
durbinWatsonTest(model)
# We are interested in the D-W Statistic
# If it's value is close to 2, it suggests that there is independence

  








