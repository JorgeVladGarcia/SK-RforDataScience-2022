
# save needed graphs ------------------------------------------------------

# load packages -----------------------------------------------------------
library(tidyverse)
library(janitor)

# load data ---------------------------------------------------------------
censos_bolivia <- read_csv("data-raw/censos_bolivia.csv")

# create graphs -----------------------------------------------------------

graph1 <- censos_bolivia_tidy %>% 
  ggplot(aes(
    x = year, 
    y = value,
    group = pob_type,
  )) +
  geom_line() # geom_point, geom_area

graph2 <- censos_bolivia_tidy %>% 
  ggplot(aes(
    x = year, 
    y = value,
    group = pob_type,
    color = pob_type
  )) +
  geom_line(size = 0.4) +
  scale_color_manual(values = c("#cc0000", "#3cb371", "#71a6d2")) + 
  theme_minimal() +
  geom_point() + 
  scale_x_continuous(breaks = c(1976,1992,2001,2012)) +
  scale_y_continuous(labels = scales::unit_format(unit = "M"
                                                  , scale = 1e-6)) + 
  labs(title = "Population by area of residence in Bolivia",
       subtitle = "Urban and rural population",
       y = "Population (millions)",
       x = "Year",
       caption = "Sources: INE") +
  # urban vs rural population comparison
  annotate("text",
           x = 1983.24,
           y = 3600000,
           #hjust = 0,
           size = 3,
           label = "Urban population starts\nto grow faster than rural\nin 1983",
           color = "#778899") +
  # total population since 1976
  annotate("text",
           x = 1976,
           y = 5700000, 
           hjust = 0.2,
           size = 3,
           label = "Total population\nis 4.6 M in 1976",
           color = "#778899") +
  # total population doubles in 2006
  annotate("text",
           x = 2006,
           y = 9900000,
           size = 3,
           color = "#778899",
           label = "Population doubles\nto 9.2 M in 2006.") +
  transition_reveal(year) # <- line of code to create animations


# save graphs -------------------------------------------------------------
ggsave("figures/graph1.png", plot = graph1)
anim_save("figures/graph2.gif", graph2)
