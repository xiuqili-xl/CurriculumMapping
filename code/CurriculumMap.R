# //////////////////////////////////////////////////////////////
# ---- Figure 2 & S1. Stacked heat man of curriculum map ----
# /////////////////////////////////////////////////////////////


## Load libraries ----
library(tidyverse)
library(here)


## Import data ----
mapping_data <- read_csv(file = here("data", "CurriculumMapping.csv"))
competency_list <- read_csv(file = here("data", "CompetencyList.csv"))


## Wrangle data ----
comp_area <- unique(competency_list$area)
course_list <- paste("Course", 1:5)
mapping_scale <- c("Introduced", "Reinforced", "Applied")

# turn mapping data long
mapping_data_long <- mapping_data %>%
  select(-stage) %>%
  pivot_longer(cols = -courseID, names_to = "competency", values_to = "instruction.level") %>%
  # separate competency area from specific competencies
  separate(competency, into = c("area", "competency"), sep = " \\[") %>%
  mutate(competency = str_remove(competency, "\\]"),
         area = str_trim(area)) %>%
  # clean up instructional level selection
  separate_rows(instruction.level, sep = ", ") %>%
  filter(!is.na(instruction.level)) %>%
  mutate(selected = TRUE)

competency_graph <- competency_list %>%
  # create an empty data frame with courseID, competencies, and instructional level
  left_join(tibble(area = comp_area, area.order = 1:13), by = "area") %>%
  mutate(courseID = list(course_list)) %>%
  unnest(courseID) %>%
  mutate(instruction.level = list(mapping_scale)) %>%
  unnest(instruction.level) %>%
  # bring in mapping data
  left_join(mapping_data_long, by = c("courseID", "area", "competency", "instruction.level")) %>%
  mutate(selected = replace_na(selected, FALSE),
         color.code = if_else(selected == TRUE, str_sub(instruction.level, start = 1, end = 1), NA)) %>%
  arrange(desc(courseID), area.order, area, competency.order, competency) %>%
  select(courseID, area.order, area, competency.order, competency, instruction.level, selected, color.code)


## Create and export full curriculum map (Figure S1) ----
ggplot(data = competency_graph) +
  geom_tile(mapping = aes(x = factor(competency.order), 
                          y = factor(instruction.level, level = mapping_scale), fill = color.code),
            color = "grey50", linewidth = 0.08) +
  scale_x_discrete(expand = c(0.035, 0.035)) +
  scale_y_discrete(position = "right", expand = c(0.25, 0.25)) +
  scale_fill_manual(values = c("I" = "#C6DBEF", "R" = "#6BAED6", "A" = "#4292C6"), 
                    na.value = "white") +
  coord_fixed(ratio = 1) +
  facet_wrap(facets = ~factor(courseID, levels = rev(course_list)), 
             ncol = 1, strip.position = "left") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 8),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(angle = 0, hjust = 0, size = 8),
        axis.ticks.y = element_blank(),
        legend.position = "none",
        strip.text = element_text(face = "bold", size = 9),
        panel.grid = element_blank(),
        panel.spacing.y = unit(0.5, "lines")) +
  labs(x = "", y = "", fill = "Instruction\nLevel")

# export Figure S1, full curriculum map
ggsave(filename = here("graphs", "FigureS1_FullCurriculumMap.png"),
       width = 10, height = 4, units = "in", dpi = 300, bg = "white")



## Create and export partial curriculum map (Figure 2) ----
ggplot(data = competency_graph %>% filter(area.order %in% 1:5)) +
  geom_tile(mapping = aes(x = factor(competency.order), 
                          y = factor(instruction.level, level = mapping_scale), fill = color.code),
            color = "grey50", linewidth = 0.08) +
  scale_x_discrete(expand = c(0.035, 0.035)) +
  scale_y_discrete(position = "right", expand = c(0.25, 0.25)) +
  scale_fill_manual(values = c("I" = "#C6DBEF", "R" = "#6BAED6", "A" = "#4292C6"), 
                    na.value = "white") +
  coord_fixed(ratio = 1) +
  facet_wrap(facets = ~factor(courseID, levels = rev(course_list)), 
             ncol = 1, strip.position = "left") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 8),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(angle = 0, hjust = 0, size = 8),
        axis.ticks.y = element_blank(),
        legend.position = "none",
        strip.text = element_text(face = "bold", size = 9),
        panel.grid = element_blank(),
        panel.spacing.y = unit(0.5, "lines")) +
  labs(x = "", y = "", fill = "Instruction\nLevel")

# export Figure S1, full curriculum map
ggsave(filename = here("graphs", "Figure2_PartialCurriculumMap.png"),
       width = 5, height = 4, units = "in", dpi = 300, bg = "white")


