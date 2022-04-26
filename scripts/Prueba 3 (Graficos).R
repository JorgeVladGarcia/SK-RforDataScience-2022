
# Exoprtacion por Script
ggplot(Censo_Bolivia_2, aes(x=Año, y=value, group=func))+
  geom_line(aes(linetype=func), size = 0.7) +
  geom_point(shape=21, color="black", fill="#69b3a2", size=2) +
  geom_label( x=1977, y=5500000, label="La población en \n1976 es de 4.6 M", size=2) +
  geom_label( x=2002, y=9500000, label="La población de Bolivia \nse duplicó a 9.2 M en 2005", size=2) +
  geom_label( x=1983, y=3500000, label="En 1983 población \nurbana supera a rural", size=2) +
  scale_x_continuous(breaks = c(1976,1992,2001,2012)) +
  scale_y_continuous(labels = scales::unit_format(unit = "M", scale = 1e-6)) +
  labs(title = "Bolivia.Población total por área de residencia",
       subtitle = "Área urbana vs rural",
       y = "",
       x = "",
       fill = "",
       caption = "Fuente: INE")

# ANIMACIONES
install.packages("hrbrthemes")
install.packages("gifski") # para gganimate
install.packages("png") # para gganimate

library(gganimate)  # Libreria para animaciones
library(gifski)     # Libreria para renderizaciones

# Animacion
ggplot(Censo_Bolivia_2, aes(x=Año, y=value, group=func))+
  geom_line(aes(linetype=func), size = 0.7) +
  geom_point(shape=21, color="black", fill="#69b3a2", size=2) +
  geom_label( x=1980, y=5500000, label="La población en \n1976 es de 4.6 M", size=3) +
  geom_label( x=2002, y=9500000, label="La población de Bolivia \nse duplicó a 9.2 M en 2005", size=3) +
  geom_label( x=1983, y=3500000, label="En 1983 población \nurbana supera a rural", size=3) +
  scale_x_continuous(breaks = c(1976,1992,2001,2012)) +
  scale_y_continuous(labels = scales::unit_format(unit = "M", scale = 1e-6)) +
  labs(title = "Bolivia.Población total por área de residencia",
       subtitle = "Área urbana vs rural",
       y = "",
       x = "",
       fill = "",
       caption = "Fuente: INE") +
  transition_reveal(Año) # <- Linea de codigo para crear animaciones

# Hallar interseccio

2005-1976
