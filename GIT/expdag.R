library(ggdag)
library(tidyverse)

coords <- tribble(
  ~name,    ~x,  ~y,
  "x1",     1,   1,
  "x2",     1,   0.75,
  "x3",     1,   0.5,
  "x4",     1,   0.25,
  "y",      2,   1,
  "m1",     1.3, 0,
  "m2",     1.7, 0,
  "holder1", 1.5, 1.07,
  "holder2", 1.5, .95,
  "holder3", 1.5, .83,
  "holder4", 1.5, .70
)

dag <- dagify(
  y ~ x1 + x2 + x3 + x4,
  holder1 ~ m1 + m2,
  holder2 ~ m1 + m2,
  holder3 ~ m1 + m2,
  holder4 ~ m1 + m2,
  coords = coords
) 

dag_plot <- ggplot(dag, aes(x = x, y = y, xend = xend, yend = yend)) + 
  geom_dag_point(data = function(x) filter(x, !grepl("^holder[1-4]", name)), aes(color = name)) +
  scale_color_manual(values = c("x1" = "blue", "x2" = "blue", "x3" = "blue", "x4" = "blue",
                                "m1" = "red", "m2" = "orange",
                                "y" = "darkgreen")) +
  geom_dag_edges() + 
  geom_dag_text(data = function(x) filter(x, !grepl("^holder[1-4]", name)), aes(label = name)) +
  theme_dag_gray()

# Print to console
print(dag_plot)

# Save as PNG
ggsave("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/GIT/dag_plot.png", dag_plot, width = 10, height = 6, units = "in")
