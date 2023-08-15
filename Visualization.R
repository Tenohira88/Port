library(tidyverse)

##Data Visualization
plot(mtcars$mpg,mtcars$hp,pch=16,col="red")


##boxplot
boxplot(mtcars$mpg)

##barplot
t1 <- table(mtcars$am)
barplot(t1)

##histrogram
hist(mtcars$mpg)
#or
ggplot(data = mtcars,aes(x=mpg)) + 
  geom_histogram(bins = 30)

##distribution
ggplot(data = mtcars,aes(x=mpg)) + 
  geom_density()

##freqpoly
p1 <- ggplot(data = mtcars,aes(x=mpg)) + 
  geom_freqpoly()


mtcars %>%
  filter(hp <= 200) %>%
  count()

##Discrete column

##summary table before creating chart
t2 <- mtcars %>% 
  mutate(am = ifelse(am==0,"Auto","Manual"))%>%
  count(am)

ggplot(t2, aes(am,n)) +
  geom_col()


ggplot(mtcars, aes(x=hp,y=mpg)) +
  geom_point(col="red",size=5)
