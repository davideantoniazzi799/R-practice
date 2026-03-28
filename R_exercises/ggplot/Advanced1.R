# ADVANCED 1

# 1) First Improvement
# 2) Change tic marks and tic marks labels

library(car)
library(tidyverse)

theme_set(theme_bw())

head(Salaries)

Salaries %>%
  ggplot(aes(x=yrs.since.phd,
             y=salary,
             color=rank))+
  geom_point()


# 1) First Improvement
Salaries %>%
  ggplot(aes(x=yrs.since.phd,
             y=salary))+
  geom_jitter(aes(color=rank,
                  shape=discipline))+
  geom_smooth(method = lm)+
  facet_wrap(~sex)+
  labs(title="Salary vs Years since PhD",
       x="Years since PhD",
       y="Income",
       color="Position",
       shape="Research Area")

# 2) Change tic marks and tic marks labels
# Starting Plot
Salaries %>%
  filter(salary<150000) %>%
  ggplot(aes(x=rank, y=salary,fill=sex))+
  geom_boxplot(alpha=0.5)+
  labs(title="Faculty Salary by Rank and Gender",
       x="",
       y="",
       fill="Gender")

# Final Plot
Salaries %>%
  filter(salary<150000) %>%
  ggplot(aes(x=rank, y=salary,fill=sex))+
  geom_boxplot(alpha=0.5)+
  scale_x_discrete(breaks=c("AsstProf",
                            "AssocProf",
                            "Prof"),
                   labels=c("Assistant\nProfessor",
                            "Associate\nProfessor",
                            "Full\nProfessor"))+
  scale_y_continuous(breaks = c(50000,
                                100000,
                                150000,
                                200000),
                     labels = c("$50K",
                                "$100K",
                                "$150K",
                                "$200K"))+
  labs(title="Faculty Salary by Rank and Gender",
       x="",
       y="",
       fill="Gender")+
  theme(legend.position = c(.11, .78))
