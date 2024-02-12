library(classdata)
library(ggplot2)

#Facet for ggplot
ggplot(aes(x = year, y = homicide), data=fbiwide) +
  facet_wrap(~state, ncol = 11) +
  geom_point()

#Boxplot for ggplot
ggplot(data = fbi, aes(x = type, y = log10(count))) +
  geom_boxplot() + 
  coord_flip()

#boxplot with number of robberies by state
ggplot(data = fbiwide, aes(x = state_abbr , y = log10(robbery))) +
  geom_boxplot() + 
  coord_flip()
