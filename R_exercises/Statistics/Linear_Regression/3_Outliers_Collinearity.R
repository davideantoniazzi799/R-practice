# OUTLIERS AND COLLINEARITY

# When we talk about OUTLIERS we refer to residuals
# or we talk about extreme values

library(tidyverse)

plot(model, which = 5)
# With leverage we refer to which extent the values in the dataset are extreme
# and far away from everything else

# We might consider outliers the point with high leverage and that are
# outside of the two standard deviations of the standard residuals



# When we talk about COLLINEARITY and multiple linear regression,
# the idea is that the predictiors should not be perfectly correlated 
# with each other (better less than 0.7 correlation). 
# If we have perfect multicollinearity, one predictor
# can be linearly predicted from the others.
mtcars %>%
  select(mpg, disp, hp) %>%
  cor() %>%
  round(2)









