
library(ggplot2)

data(mtcars)

mtcars$cyl <- as.factor(mtcars$cyl)

ggplot(mtcars, aes(x = hp, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  labs(
    title = "Horsepower vs Miles Per Gallon",
    x = "Horsepower",
    y = "Miles Per Gallon"
  )

