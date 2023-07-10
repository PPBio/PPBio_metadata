##############################################################################################
## Este scritp gera gráficos para os dados do gbif
## Versão | Version  R 4.3
## Author : Tainá Rocha
## Data : 07 June 2023
## Last update: 10 July 2023
##############################################################################################


library(dplyr)
library(geobr)
library(ggplot2)
library(knitr)
library(readr)
library(sf)
library(stringr)
library(wordcloud)


splink_peld = readr::read_delim("data-raw/speciesLink/PELD/20221012163802-0000744.txt")

## Kingdom

splink_peld |>
  filter(yearcollected > 1997) |> 
  #filter(!grepl('incertae sedis', kingdom)) |>
  #mutate(across('kingdom', str_replace, 'Animalia', 'Vertebrate'))  |> 
  # mutate(across('kingdom', str_replace, 'Chromista', 'Microorganism')) |>
  #mutate(across('kingdom', str_replace, 'Fungi', 'Microorganism')) |>
  group_by(kingdom) |>
  count() |>
  kable()


## Phylum
splink_peld|>
  filter(yearcollected > 2004) |> 
  #filter(!grepl('incertae sedis', kingdom)) |>
  group_by(phylum) |>
  count() |>
  kable() 


## Class

splink_peld|>
  filter(yearcollected > 2004) |> 
  #filter(!grepl('incertae sedis', kingdom)) |>
  group_by(class) |>
  count() |>
  kable()

## State

splink_peld|>
  filter(yearcollected > 2004) |> 
  #filter(!grepl('incertae sedis', kingdom)) |>
  group_by(stateprovince) |>
  count() |>
  arrange(desc(n)) |> 
  na.omit() |> 
  kable()


#readr::write_csv(t, "data/gbif_PPBIO_map.csv")


## Locality 
## State Provincia Bar graphic
state = splink_peld |>
  filter(yearcollected > 2004) |> 
  #filter(country == "Brasil") |> 
  group_by(stateprovince) |>
  count() |>
  arrange(desc(n)) |> 
  na.omit() #|> 
#kable()

state$stateprovince = factor(state$stateprovince, levels = state$stateprovince[order(state$n, decreasing = TRUE)])

ggplot(state, aes(x = stateprovince, y = n)) +
  geom_bar(stat = "identity", fill ="gray") +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = " ", y = "N",
       title = "PELD: States") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )



