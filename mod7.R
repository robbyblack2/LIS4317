library(ggplot2)

data(mtcars)

# Ensure output directory exists so ggsave won't prompt
if (!dir.exists("docs")) dir.create("docs", recursive = TRUE)

#factor
mtcars$cyl <- factor(mtcars$cyl)

#Historgram
mean_mpg <- mean(mtcars$mpg)

p_hist <- ggplot(mtcars, aes(x = mpg, fill = cyl)) +
  geom_histogram(color = "white") +
  geom_vline(xintercept = mean_mpg, linetype = "dashed", color = "red") +
  facet_wrap(~ cyl, scales = "fixed") +
  labs(title = "MPG distribution by cylinders",
       subtitle = "Dashed line = overall mean MPG",
       x = "MPG", y = "Count") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2") +
  guides(fill = "none")


#bar Plot
p_bar <- ggplot(mtcars, aes(x = factor(gear), fill = factor(gear))) +
  geom_bar(color = "white") +
  labs(title = "Count by number of gears", x = "Gears", y = "Count", fill = "Gears") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")


# Scatter Grid
p_scatter <- ggplot(mtcars, aes(x = hp, y = mpg, color = cyl)) +
  geom_point() +
  facet_wrap(~ cyl, scales = "fixed") +
  labs(title = "HP vs MPG by cylinders", x = "Horsepower", y = "MPG", color = "Cylinders") +
  theme_minimal()


# Ensure plots render in RStudio when sourcing the script
if (interactive()) {
  print(p_hist)
  print(p_bar)
  print(p_scatter)
}

