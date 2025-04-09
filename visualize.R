# -*- coding: utf-8 -*-
# ---
# jupyter:
#   jupytext:
#     formats: R:percent
#     text_representation:
#       extension: .R
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.16.4
#   kernelspec:
#     display_name: R
#     language: R
#     name: ir
# ---

# %%
# Chargement des bibliothèques
#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("scales")
library(ggplot2)
library(dplyr)
library(scales)

# Données fictives intégrées dans le code
data <- data.frame(
  year = rep(2000:2020, 3),
  country = rep(c("Suisse", "France", "Allemagne"), each = 21),
  gdp_per_capita = c(
    # Suisse
    seq(40000, 82000, length.out = 21),
    # France
    seq(25000, 43000, length.out = 21) + rnorm(21, 0, 1000),
    # Allemagne
    seq(27000, 48000, length.out = 21) + rnorm(21, 0, 1200)
  )
)

# Création de la visualisation
ggplot(data, aes(x = year, y = gdp_per_capita, color = country)) +
  geom_line(size = 1.2) +
  geom_smooth(se = FALSE, method = "loess", span = 0.3, linetype = "dashed") +
  scale_color_manual(values = c("Suisse" = "#1f78b4", "France" = "#33a02c", "Allemagne" = "#e31a1c")) +
  scale_y_continuous(labels = dollar_format(suffix = " CHF", prefix = "")) +
  labs(
    title = "Évolution du PIB par habitant (2000–2020)",
    subtitle = "Comparaison entre la Suisse, la France et l'Allemagne",
    x = "Année",
    y = "PIB par habitant",
    color = "Pays"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18),
    plot.subtitle = element_text(size = 14),
    legend.position = "top",
    panel.grid.minor = element_blank()
  )

#Si le graphique ne s'affiche pas, vérifiez que les trois librairy au début du code soient installées.
