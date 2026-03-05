# Exercise 24 - Data Frame Reshaping
# Using the scores data frame from Exercise 23:
# Tasks:
# 1. Convert the data frame from wide to long format using tidyr::pivot_longer,
# with columns math, english, science turned into subject and score.
# 2. Compute the average score per subject using the long format.
# 3. Convert the long format back to wide format using pivot_wider.
# 4. Create a summary table showing min, max, and mean for each subject.
# 5. Filter the long format data to include only scores > 85.

library(tidyr)
library(dplyr)
library(psych)

# 1. Convert the data frame from wide to long format using tidyr::pivot_longer,
# with columns math, english, science turned into subject and score.
scores <- scores %>% pivot_longer(cols=c('math', 'english', 'science'),
                    names_to='subject',
                    values_to='score')
scores

# 2. Compute the average score per subject using the long format.
score_subject_mean <- scores %>%
  group_by(subject) %>%
  summarise(mean_score = mean(score))

score_subject_mean

# 3. Convert the long format back to wide format using pivot_wider.
scores <- scores %>% 
  pivot_wider(names_from = subject, values_from = score)

scores

# 4. Create a summary table showing min, max, and mean for each subject.
describe(scores[, 2:5])

# 5. Filter the long format data to include only scores > 85.
scores <- scores %>% pivot_longer(cols=c('math', 'english', 'science'),
                                  names_to='subject',
                                  values_to='score')
scores

scores_filtered <- subset(scores, score > 85)
scores_filtered
