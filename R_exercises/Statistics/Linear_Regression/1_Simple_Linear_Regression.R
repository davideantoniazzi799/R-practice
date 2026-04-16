# SIMPLE LINEAR REGRESSION

# 1) Visualize relationship (height and weight of a woman)
# 2) Create model
# 3) Generate summary of the model
# 4) Predictive modeling

library(tidyverse)

head(women)

# 1) Visualize relationship (height and weight of a woman)
women %>%
  ggplot(aes(height, weight))+
  geom_point(size=3,alpha=.5)+
  geom_smooth(method = lm, se=F)+
  theme_bw()+
  labs(title = "Weight explained by Height in Women",
       x="Height(explanatory or indipendent variable)",
       y="Weight(outcome or dependent variable)")

# 2) Create model
model1 <- lm(weight ~ height, data = women)

# 3) Generate summary of the model
summary(model1)

# We see the residuals. They represents the difference/distance
# between the actual value that we observed and the value predicted by the model

# The coefficients tell us how much the dependent variable changes
# based on the independent variable. 
# We can see that every coefficient is statistically significant

# The p-value at the end is pretty small, therefore the model seems to be fine
# The Multiple R-Squared tells us how much of the change of the depedent variable
# is explained by the change in the independent variable

# 4) Predictive modeling
new_data <- data.frame(height=68)
predict(model1, new_data)

new_data <- data.frame(height=c(68,70,72))
round(predict(model1, new_data))
