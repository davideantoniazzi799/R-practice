# Factors and Categorical Variables with FORCATS()

# 1) Manually reordering
# 2) By the value of the factor
# 3) By the average value of another variable
# 4) By reversing the order
# 5) Order factor levels by the frequency of the values of that variable
# 6) Manually recoding factors
# 7) By collapsing
# 8) By lumping
# 9) Reordering a factor y by its value corresponding to the largest x value

library(tidyverse)
library(forcats)
library(patchwork)

view(gss_cat)
glimpse(gss_cat)

# 1) Manually reordering
unique(gss_cat$race)
gss_cat %>%
  pull(race) %>% #pulls out the variable race as vector
  unique()

# 2) By the value of the factor
count(gss_cat, race, sort = T)
gss_cat %>%
  count(race)

gss_cat %>%
  pull(race) %>%
  levels()

gss_cat %>%
  select(race) %>%
  table()

gss_cat %>%
  mutate(race=fct_drop(race))%>%
  pull(race)%>%
  levels()

# 3) By the average value of another variable
# Order factor levels by the value 
# of another numeric variable
gss_cat %>%
  drop_na(tvhours)%>%
  group_by(relig)%>%
  summarise(mean_tv=mean(tvhours))%>%
  ggplot(aes(mean_tv,relig))+
  geom_point(size=4)

gss_cat %>%
  drop_na(tvhours)%>%
  group_by(relig)%>%
  summarise(mean_tv=mean(tvhours))%>%
  mutate(relig=fct_reorder(relig,mean_tv))%>%
  ggplot(aes(mean_tv,relig))+
  geom_point(size=4)
# with fct_reorder() relig is reordered based on the mean_tv value


# 4) By reversing the order
gss_cat %>%
  drop_na(age)%>%
  filter(rincome!="Not applicable")%>%
  group_by(rincome)%>%
  summarise(mean_age=mean(age))%>%
  ggplot(aes(mean_age,rincome))+
  geom_point(size=4)

gss_cat %>%
  drop_na(age)%>%
  filter(rincome!="Not applicable")%>%
  group_by(rincome)%>%
  summarise(mean_age=mean(age))%>%
  mutate(rincome=fct_rev(rincome))%>%
  ggplot(aes(mean_age,rincome))+
  geom_point(size=4)


# 5) Order factor levels by the frequency of the values of that variable
gss_cat%>%
  count(marital)

gss_cat %>%
  mutate(marital=fct_infreq(marital))%>%
  count(marital)

gss_cat %>%
  mutate(marital=fct_infreq(marital))%>%
  mutate(marital = fct_rev(marital)) %>%
  count(marital)


# 6) Manually recoding factors
gss_cat %>%
  mutate(partyid=fct_recode(partyid,
                             "Republican, strong"="Strong republican",
                             "Republican, weak"="Not str republican",
                             "Independent, near rep"="Ind,near rep",
                             "Independent, near dem"="Ind,near dem",
                             "Democrat, weak"="Not str democrat",
                             "Democrat, strong"="Strong democrat",
                             "Other"="No answer",
                             "Other"="Don't know",
                             "Other"="Other party")) %>%
  count(partyid)


# 7) By collapsing
gss_cat %>%
  mutate(partyid = fct_collapse(partyid,
                                other=c("No answer", "Don't know", "Other party"),
                                rep=c("Strong republican", "Not str republican"),
                                ind=c("Ind,near rep", "Independent", "Ind,near dem"),
                                dem=c("Not str democrat", "Strong democrat"))) %>%
  count(partyid)


# 8) By lumping
# Lumping into "other
gss_cat %>%
  count(relig, sort=T)

gss_cat%>%
  mutate(relig=fct_lump(relig,n=2))%>%
  count(relig)
# keeps the two observations with the highest count
# and groups the rest in "Other"


# 9) Reordering a factor y by its value corresponding to the largest x value
gss_cat %>%
  filter(!is.na(age))%>%
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed"))%>%
  count(age, marital)%>%
  group_by(age)%>%
  mutate(prop=n/sum(n))%>%
  ggplot(aes(age,prop,colour = marital))+
  geom_line(size=2,na.rm = TRUE)+
  theme_minimal()

gss_cat %>%
  filter(!is.na(age))%>%
  filter(marital %in% c("Never married",
                        "Married",
                        "Widowed"))%>%
  count(age, marital)%>%
  group_by(age)%>%
  mutate(prop=n/sum(n))%>%
  mutate(marital=fct_reorder2(marital,age,prop))%>%
  mutate(marital=fct_rev(marital))%>%
  ggplot(aes(age,prop,colour = marital))+
  geom_line(size=2,na.rm = TRUE)+
  theme_minimal()
