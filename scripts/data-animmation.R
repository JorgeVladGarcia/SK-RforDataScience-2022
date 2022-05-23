
# data - animmation -------------------------------------------------------


# load packages -----------------------------------------------------------
library(gganimate)  # Package to create animations
library(gifski)     # Package to render animationss
library(png)

# add animation code ------------------------------------------------------
censos_bolivia_tidy_gif <- censos_bolivia_tidy %>% 
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
       caption = "Sources: National Insitute of Statistics") +
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
  transition_reveal(year) # <- Linea de codigo para crear animaciones

censos_bolivia_tidy_gif

anim_save("figures/censos_bolivia_tidy_gif.gif", censos_bolivia_tidy_gif)
