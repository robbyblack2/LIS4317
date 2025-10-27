

library(ggplot2)
data(mtcars)

mtcars$cyl <- factor(mtcars$cyl)
mtcars$gear <- factor(mtcars$gear)
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))

multivar_plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = cyl, size = hp, shape = am), alpha = 0.7) +
  scale_color_brewer(palette = "Set1", name = "Cylinders") +
  scale_size_continuous(name = "Horsepower", range = c(2, 8)) +
  scale_shape_manual(values = c(16, 17), name = "Transmission") +
  labs(
    title = "Car Performance: Weight vs MPG",
    subtitle = "Color = Cylinders, Size = Horsepower, Shape = Transmission",
    x = "Weight 1000lbs",
    y = "Miles Per Gallon"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "right"
  )


print(multivar_plot)