library(gapminder)
library(ggplot2)
library(dplyr)

gm <- gapminder::gapminder

#8
life <- gm %>% 
  group_by(lifeExp) %>%
  filter(year == 1982) %>%
  tally

ggplot(data = life,
       aes(x=lifeExp)) +
  geom_histogram()

#9/10
Asia <- gm %>% 
  group_by(pop,year,country) %>%
  filter(continent == 'Asia') %>%
  tally

ggplot(data = Asia,
       aes(x=year,
           y=pop,
           color = country)) +
  geom_line(size = 1.5,alpha = 0.5) +
  scale_y_log10() +
  labs(title = 'Pop in Asia by years',
       x = 'Year',
       y = 'Population')

#11/12
europe <- gm %>% 
  group_by(gdpPercap,country) %>%
  filter(year == 2002 & continent == 'Europe') %>%
  tally

ggplot(data = europe,
       aes(x=country,
           y=gdpPercap)) +
  geom_bar(stat = 'identity',
           alpha = 0.25,
           fill = 'blue') +
  theme(axis.text.x = element_text(angle = 90))

#13
the_nineties <- gm %>% filter(year > 1989 & year < 2000)

#14
setwd('C:/Users/zrshu/Documents/datascience')
write.csv(the_nineties,'thenineties.csv')
                              