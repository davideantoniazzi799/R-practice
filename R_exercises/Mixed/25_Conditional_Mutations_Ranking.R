# Exercise 25 - Conditional Mutations and Ranking
# Create a data frame players:
# - player_id: 1, 2, 3, 4, 5
# - name: "John", "Mike", "Sara", "Anna", "Tom"
# - points: 15, 20, 18, 25, 10
# - assists: 5, 7, 6, 8, 4
# Tasks:
# 1. Add a new column performance which is "High" if points + assists >= 25, else "Low".
# 2. Rank the players by points (highest first) using rank.
# 3. Add a column points_category which is "Top" if points > 18, else "Other".
# 4. Compute the average assists for players in the "High" performance group.
# 5. Extract the top 3 players based on points.

library(dplyr)

players <- data.frame(player_id = c(1, 2, 3, 4, 5),
                      name = c("John", "Mike", "Sara", "Anna", "Tom"),
                      points = c(15, 20, 18, 25, 10),
                      assists = c(5, 7, 6, 8, 4))
players

# 1. Add a new column performance which is "High" if points + assists >= 25, else "Low".
players$performance <- ifelse(players$points + players$assists >= 25,
                              "High", "Low")
players

# 2. Rank the players by points (highest first) using rank.
players$rank_player <- rank(-players$points, ties.method='min')
players

# 3. Add a column points_category which is "Top" if points > 18, else "Other".
players$points_category <- ifelse(players$points > 18,
                              "Top", "Other")
players

# 4. Compute the average assists for players in the "High" performance group.
players %>% 
  filter(performance == "High") %>% 
  summarise(assist_avg = mean(assists))

# 5. Extract the top 3 players based on points.
players %>% top_n(3, wt=points) %>% arrange(-points)
players %>%
  arrange(desc(points)) %>%
  slice(1:3)
