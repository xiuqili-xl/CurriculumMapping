# //////////////////////////////////////////////////////////////
# ---- Figure 1. Concept diagram of competency framework ----
# /////////////////////////////////////////////////////////////


## Load libraries ----
library(tidyverse)
library(here)


## Import and wrangle data ----
competency_list <- read_csv(file = here("data", "CompetencyList.csv"))
comp_area <- unique(competency_list$area)

competency_graph <- competency_list %>%
  left_join(tibble(area = comp_area, area.order = 1:13), by = "area") %>%
  mutate(competency.length = str_length(competency))


## Create visual ----
comp_pallete <- c("#6699CC", "#88CCEE", "#44AA99", "#117733", "#999933", "#DDCC77", 
                  "#CC6677", "#AA4466", "#990000", "#661100", "#882255","#AA4499", "#332288")
names(comp_pallete) <- comp_area

ggplot() +
  geom_col(data = competency_graph,
           mapping = aes(x = factor(competency.order), y = competency.length, 
                         fill = reorder(area, area.order)),
           width = 0.85) +
  geom_hline(mapping = aes(yintercept = -8), linewidth = 0.2, color = "grey70") +
  geom_text(mapping = aes(x = 1, y = -80, label = "COMPETENCIES"), 
            color = "grey45", size = 5) +
  scale_y_continuous(limits = c(-80, 100)) +
  scale_fill_manual(values = comp_pallete) +
  coord_polar() +
  theme_minimal() +
  theme(legend.position = "none",
        panel.grid = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank())


## Export visual ----
ggsave(filename = here("graphs", "Figure1_ConceptDiagram_WhiteBackground.png"),
       width = 6, height = 6, units = "in", dpi = 300, bg = "white")

ggsave(filename = here("graphs", "Figure1_ConceptDiagram_ClearBackground.png"),
       width = 6, height = 6, units = "in", dpi = 300)

