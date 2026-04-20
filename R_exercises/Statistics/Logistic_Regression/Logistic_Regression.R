# LOGISTIC REGRESSION

# We use logistic regression when we want to create a model
# where the outcome variable is binary. 

# 1) Single numeric variable
# 2) Single categorical variable
# 3) Adding variables
# 4) Confounding variables
# 5) Effect modifiers and interactions
# 6) Collinearity
# 7) Building the model
# 8) Model assumptions

library(tidyverse)
library(mlbench)
library(gtExtras)

data(PimaIndiansDiabetes, package = "mlbench")

# 1) Single numeric variables
model <- glm(diabetes ~ glucose,
             data = PimaIndiansDiabetes,
             family = binomial)

summary(model)
# In this case, the coefficient of the explanatory variable kind of works
# as a variation in the likelihood related to the meaning of the predicted variable.

# 2) Single categorical variable
age_data <- PimaIndiansDiabetes %>%
  mutate(age_group = case_when(
    age < 30 ~ "Young adult",
    age <= 50 ~ "Middle-aged",
    TRUE ~ "Older adult")) %>%
  mutate(age_group = 
           factor(age_group, levels = c("Young adult, 
                                        Middle-age", 
                                        "Older adult")))


model <- glm(diabetes ~ age_group,
             data = age_data,
             family = binomial)
# There is always a group of the categorical value that acts as base group

# 3) Adding variables
model <- glm(diabetes ~ glucose + age,
             data = PimaIndiansDiabetes,
             family = binomial)

summary(model)
# We need the check the AIC. If it goes down as we add variables, that's good
# The same thing for the Residual deviance

# 4) Confounding variables
model <- glm(diabetes ~ glucose + age,
             data = PimaIndiansDiabetes,
             family = binomial)

summary(model)
# We can see that, as we added age, the probability related to the glucose variable
# decreased. So glucose had been adjusted by age.
# That's probably due to fact that higher level of glucose
# is associated with being older and being older is associated with
# a higher risk of having diabetes. So being older doen not explain all
# the association between glucose and diabetes but only some of it. That's why
# the coefficient got adjusted

# 5) Effect modifiers and interactions
model <- glm(diabetes ~ glucose * age,
             data = PimaIndiansDiabetes,
             family = binomial)

summary(model)
# It seems that as you get older, the effect that glucose has
# on the likelihood of getting diabetes becomes smaller. Coefficients are
# statistically significant and both the AIC and the residual deviances decreases,
# so it's reasonable to include the interaction coefficient

# 6) Collinearity
# Here we check the correlation between our variables
# If it's higher that 0.8, we might have a problem of collinearity and remove some
correlation_matrix <- cor(PimaIndiansDiabetes[, sapply(PimaIndiansDiabetes, 
                                                       is.numeric)])

cor_df <- as.data.frame(round(correlation_matrix,2)) %>%
  tibble::rownames_to_column("Variable")

cor_df %>%
  gt() %>%
  gt_color_rows(
    columns = -Variable,
    palette="RdBu",
    domain=c(-1,1))

# 7) Building the model
# The idea is to add one variable at a time until AIC and the residual deviance
# decreases and the variables or interaction terms are statistically significant
library(readxl)
LR_variables <- read_excel("LR_variables.xlsx")

data_long <- LR_variables %>%
  pivot_longer(cols = -Variable, names_to = "variable", values_to = "value") %>%
  mutate(value = as.factor(value))

variables_order <- unique(LR_variables$Variable)
ggplot(data_long, aes(x = variable,
                      y = factor(Variable, levels = variables_order),
                      fill = value)) +
  geom_tile(color = "white") +
  scale_fill_manual(
    values = c("0" = "#dea49b", "1" = "#8ecfaf"),
    name = "Value"
  ) +
  scale_y_discrete(limits = rev(variables_order)) +
  guides(fill = "none") +
  labs(
    title = "Effect of additional variables on model parameters",
    x = "",
    y = "",
    caption = "For AIC and Residual deviance, green means a lower value and 
    so supports the inclusion of the variable in the model. \nFor statistical 
    significance, green means a lower p value and so supports the inclusion 
    of the variable in the model."
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    axis.text.x = element_text(hjust = 0.5, face = "bold"),
    axis.text.y = element_text(size = 10),
    panel.grid = element_blank()
  )

# Model
model <- glm(diabetes ~ glucose + age + glucose:age +
               pregnant + age:pregnant + mass + pressure + pedigree,
             data = PimaIndiansDiabetes,
             family = binomial)

summary(model)

# 8) Model assumptions
# The assumptions are 8:
# 1 - The dependent variable (or outcome) is binary
# 2 - Observations are independent
# 3 - Adequate sample size
# 4 - No omitted variables that bias the study
# 5 - Good logistic regression model fit
# 6 - No perfect multicollinearity
# 7 - Linear relationship between the log-odds and precitors
# 8 - Absence of highly influential outliers

# 1 - Yes, out dependent variable is binary
table(PimaIndiansDiabetes$diabetes)

# 2 - Our observations are independent

# 3 - We are okay in this case

# 4 - We are fine

# 5 - Hosmer and Lemeshow goodness of fit (GOF) test
library(ResourceSelection)

hoslem.test(model$y, fitted(model), g = 10)

# A p-value of 0.09 says that this model is a good fit
# In this case we are looking for a p-value higher than 0.05

# 6 - Variance Inflation Factor (VIF)
library(car)

model <- glm(diabetes ~ glucose + age + pregnant + mass + pressure + pedigree, 
             data = PimaIndiansDiabetes, family = binomial)

vif(model)
# If there is something bigger than 10, we would have a problem and need to investigate
# We don't have it here

# 7 - For each value of a predictor, there is an odds of the outcome being positive
# or negative. We take the natural logaritm of it and we get the log-odds.
# We think there should be a linear relationship between the log-odds and the values
# of the predictor values
# The test is the Box-Tidwell test
PimaIndiansDiabetes$diabetes <- ifelse(PimaIndiansDiabetes$diabetes == "pos", 
                                       1, 0)

PimaIndiansDiabetes <- PimaIndiansDiabetes %>%
  mutate(pressure_log = log(pressure), 
         pressure_interaction = pressure * pressure_log)

model <- glm(diabetes ~ pressure + pressure_interaction, 
             family = binomial, 
             data = PimaIndiansDiabetes)

summary(model)
# If the p-value of the interaction term is more than 0.05,
# so not significant, we are in a linear relationship

# 8 - We can start with a visual check with the Cook's distance
model <- glm(diabetes ~ glucose + age + glucose:age + pregnant + age:pregnant + 
               mass + pressure + pedigree, 
             data = PimaIndiansDiabetes, 
             family = binomial)

cooks_d <- cooks.distance(model)
cooks_df <- data.frame(Observation = seq_along(cooks_d), CooksDistance = cooks_d)

ggplot(cooks_df, aes(x = Observation, y = CooksDistance)) +
  geom_segment(aes(xend = Observation, yend = 0), color = "steelblue") +
  geom_point(color = "coral") +
  labs(title = "Cook's Distance", x = "", y = "Cook's Distance") +
  theme_minimal()

# We see that in our dataset everything is kind of small, the highest outlier has 0.04
# Definitely smaller than 1. So there isn't a big outlier that if took out, the model
# would change dramatically.


# We can also use the leverage values. Such values measure the influence 
# of an observation on the predicted outcomes by evaluating 
# how far the observation's predictor values deviate from the mean of the predictors
model <- glm(diabetes ~ glucose + age + glucose:age + pregnant + 
               age:pregnant + mass + pressure + pedigree, 
             data = PimaIndiansDiabetes, family = binomial)

leverage_values <- hatvalues(model)

n <- nrow(PimaIndiansDiabetes)
p <- length(coefficients(model))
leverage_threshold <- 2 * p / n

leverage_df <- data.frame(Observation = seq_along(leverage_values), 
                          Leverage = leverage_values)

ggplot(leverage_df, aes(x = Observation, y = Leverage)) +
  geom_point(color = "blue") +
  geom_hline(yintercept = leverage_threshold, linetype = "dashed", color = "red") +
  labs(title = "Leverage Values", x = "Observation Index", y = "Leverage") +
  theme_minimal()

# We can check the values over the threshold. There is no need to
# be worried, considering the Cook's distance

# Also the deviance residuals are good to check.
# Deviance residuals measure the discrepancy between 
# observed and predicted values in logistic regression, 
# providing a way to assess individual data points’ fit within the model.
model <- glm(diabetes ~ glucose + age + glucose:age + pregnant + age:pregnant + 
               mass + pressure + pedigree, 
             data = PimaIndiansDiabetes, 
             family = binomial)

deviance_residuals <- residuals(model, type = "deviance")

residuals_df <- data.frame(Observation = seq_along(deviance_residuals), 
                           DevianceResiduals = deviance_residuals)

ggplot(residuals_df, aes(x = Observation, y = DevianceResiduals)) +
  geom_point(color = "blue") +
  geom_hline(yintercept = c(-2, 2), linetype = "dashed", color = "red") +
  labs(title = "Deviance Residuals", 
       x = "Observation Index", 
       y = "Deviance Residuals") +
  theme_minimal()