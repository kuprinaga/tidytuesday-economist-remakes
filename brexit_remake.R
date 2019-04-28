source('./get_data.R')
source('./brexit.R')

p_brexit <- ggplot(data = brexit,
                   aes(x = date_pretty, 
                       y = perc, 
                       color = response)) +
  geom_smooth() +
  geom_point(alpha = 0.3) +
  geom_label_repel(data = brexit,
                   aes(label = label_data),
                   nudge_x = 1,
                   na.rm = TRUE) + 
  coord_cartesian(ylim = c(38,max(brexit$perc))) + 
  scale_x_date(date_breaks = "6 months", 
               date_labels = "%b '%y") +
  scale_y_continuous(position = 'right',
                     breaks = c(seq(38, 48, 2)),
                     labels = number_format(accuracy = 1)) +
  theme_classic(base_size = 12, base_family = "sans")  + 
  scale_color_manual(values = c("#116ea0", "#dd6e6d")) + 
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.position = "none",
        text = element_text(family="Arial Narrow"),
        panel.grid.major.y = element_line(
          colour = '#c2cdd4',
          linetype = 'solid',
          size = 0.5
        ),
        plot.title = element_text(family = "Arial Narrow")) +
  labs(title = '"In hindsight, do you think Britain was right or wrong \n to vote to leave the EU?"',
       subtitle = '% responding')