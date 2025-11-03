


library(readr)
library(ggplot2)

hotdogs <- read_csv("http://datasets.flowingdata.com/hot-dog-contest-winners.csv")
head(hotdogs)

names(hotdogs) <- make.names(names(hotdogs))

colors <- ifelse(hotdogs$New.record == 1, "darkred", "grey")
barplot(hotdogs$Dogs.eaten, names.arg = hotdogs$Year, col=colors, border=NA,
        main = "Nathan's Hot Dog Eating Contest Results, 1980-2010",  xlab="Year", ylab="Hot dogs and buns (HDBs) eaten")

ggplot(hotdogs) +
  geom_bar(aes(x=Year, y=Dogs.eaten, fill=factor(New.record)), stat="identity") +
  labs(title="Nathan's Hot Dog Eating Contest Results, 1980-2010", fill="New Record") +
  xlab("Year") + ylab("Hot dogs and buns (HDBs) eaten")

hotdog_places <- as.matrix(hotdog_places) # Rename the columns to correspond to the years 2000-2010
colnames(hotdog_places) <- lapply(2000:2010, as.character)
barplot(hotdog_places, border=NA, main="Hot Dog Eating Contest Results, 1980-2010", xlab="Year", ylab="Hot dogs and buns (HDBs) eaten")

head(economics)
year <- function(x) as.POSIXlt(x)$year + 1900
economics$year <- year(economics$date) # we setting up our analysis
head(economics)
plot1 <- qplot(date, unemploy / pop, data = economics, geom = "line")
plot1

plot2 <- qplot(date, uempmed, data = economics, geom = "line")
grid.arrange(plot1, plot2, ncol=2)
plot1 <- qplot(unemploy/pop, uempmed, data = economics, geom = c("point", "path"))
plot2 <- qplot(unemploy/pop, uempmed, data = economics, geom = c("point", "path"), color=year)
grid.arrange(plot1, plot2, ncol=2)
plot2

