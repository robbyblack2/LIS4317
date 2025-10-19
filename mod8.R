
library(ggplot2)
data(mtcars)

mtcars$cyl <- factor(mtcars$cyl)

vars <- c("mpg", "hp", "wt", "disp")
cor_mat <- cor(mtcars[, vars])

hp <- ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  labs(title = "HP vs MPG", x = "Horsepower", y = "MPG") +
  theme_minimal()

weight <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  labs(title = "Weight vs MPG", x = "Weight 1000lbs", y = "MPG") +
  theme_minimal()

hp_both <- ggplot(mtcars, aes(hp, mpg)) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ cyl, nrow = 1, scales = "fixed") +
  labs(title = "HP vs MPG by cylinders", x = "Horsepower", y = "MPG") +
  theme_minimal()

if (interactive()) {
  print(round(cor_mat, 2))
  print(hp)
  print(weight)
  print(hp_both)
}

