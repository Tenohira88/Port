install.packages("patchwork")
install.packages("Rmarkdown")
library(patchwork)
library(tidyverse)

##ordinal factor (can be ordered high <-> low)
temp <- c("high", "medium","low","high")
temp <- factor(temp, levels = c("low","med", "high"), ordered = T)

##categorical factor (cannot be ordered)
gender <- c("m","f","m")
gender <- factor(gender)

##count
glimpse(diamonds)
diamonds %>%
  count(cut,color,clarity)

##sample
set.seed(1)
diamonds %>%
  sample_n(5)

diamonds %>%
  sample_frac(0.5)

diamonds %>%
  slice(1:5)

##relationship (pattern of data)
ggplot(diamonds %>% sample_n(500),aes(carat,price))+
  geom_point()+
  geom_smooth(method = "lm")+
  geom_rug()

## setting vs mapping

ggplot(diamonds, aes(price))+
  geom_histogram(bins = 100, fill = "Salmon", color = "black")

ggplot(diamonds %>% sample_n(500),
       aes(carat,price)) +
  geom_point(size=5,alpha=0.1,col="Red")

##mapping
ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat,price,col=cut, shape=cut)) +
  geom_point(size=5,alpha=0.8) +
  theme_minimal()+
  labs(
    title = "Relationship between carat and price",
    x = "Carat",
    y = "Price USD",
    subtitle = "We found a positive relationship",
    caption = "Datasource: diamonds ggplot 2"
  )+
  scale_color_manual(values = c(
    "red","green","blue","yellow","salmon"
  ))

##Facet
ggplot(diamonds %>% sample_n(5000), aes(carat,price))+
  geom_point()+
  geom_smooth()+
  theme_minimal()+
  facet_wrap(~cut, ncol=1)

ggplot(diamonds %>% sample_n(5000), aes(carat,price))+
  geom_point()+
  geom_smooth()+
  theme_minimal()+
  facet_grid(cut ~ color)

##quick plot
p1 = qplot(mpg,data=mtcars,geom="histogram")
p2 = qplot(hp,mpg,data=mtcars,geom="point")
p3 = qplot(hp,data=mtcars,geom="density")

##patch work
p1+p2+p3

(p1+p2)/p3

p1/p2/p3

