library(classdata)
library(tidyverse)
library(ggplot2)
happy

head(happy)
str(happy)
?happy
dim(happy)


#12 variables mostly factor variables
happy %>%
  ggplot(aes(x=happy))+
  geom_bar()


happy <- happy %>% mutate(
  nhappy = NA,
  nhappy = if_else(happy == 'not too happy', 1, nhappy),
  nhappy = if_else(happy == 'pretty happy', 2, nhappy),
  nhappy = if_else(happy == 'very happy', 3, nhappy)
)

happy$nhappy

library(haven)
happy %>%
  ggplot(aes(x=year, y=nhappy))+
  geom_point(alpha = 0.01)

happy %>%
  filter(!is.na(nhappy)) %>%
  group_by(year, sex) %>%
  summarise(
    avg_happy = mean(nhappy, na.rm=TRUE)
  ) %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x=year, y=avg_happy, color=sex)) + geom_line()

happy %>%
  group_by(partyid) %>%
  summarise(
    avg_happy = mean(nhappy, na.rm=TRUE)
  )
  
  
happy %>%
  group_by(partyid, finrela) %>%
  summarise(
    avg_happy = mean(nhappy, na.rm=TRUE)
  )  %>% ggplot(aes(x=partyid, weight=avg_happy)) + geom_bar()
  
