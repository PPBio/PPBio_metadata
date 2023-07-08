## Este scritp gera gráficos para os dados do gbif
## Versão | Version  R 4.3
## Author : Tainá Rocha
## Data : 07 June 2023
## Last update: 09 June 2023


library(dplyr)
library(ggplot2)
library(knitr)
library(readr)
library(stringr)
library(wordcloud)


gbif_peld = readr::read_csv("data/gbif/peldBind.csv")

## Kingdom


gbif_peld |>
  filter(year > 1997) |> 
  filter(!grepl('incertae sedis', kingdom)) |>
  group_by(kingdom) |>
  count() |>
  kable()

## Phylum
gbif_peld |>
  filter(year > 1997) |> 
  filter(!grepl('incertae sedis', kingdom)) |>
  group_by(phylum) |>
  count() |>
  kable()


gbpeld = gbif_peld |>
  filter(year > 1997) |> 
  mutate(Map = phylum) |>
  filter(!grepl('incertae sedis', kingdom)) |>
  mutate(across('Map', str_replace, 'Chlorophyta', 'Invertebrate'))  |> 
  mutate(across('Map', str_replace, 'Chordata', 'Vertebrate'))  |> 
  mutate(across('Map', str_replace, 'Cnidaria', 'Invertebrate'))  |> 
  mutate(across('Map', str_replace, 'Cyanobacteria', 'Invertebrate'))  |> 
  mutate(across('Map', str_replace, 'Tracheophyta', 'Plantae')) 

readr::write_csv(gbpeld, "data/gbif_PELD_map.csv")


## State

gbpeld|>
  filter(year > 1997) |> 
  filter(!grepl('incertae sedis', kingdom)) |>
  group_by(stateProvince) |>
  count() |>
  arrange(desc(n)) |> 
  kable()

## Instution  Bar graphic

gbpeld |>
  filter(year > 1997) |> 
  group_by(institutionCode) |>
  count() |>
  na.omit() |>
  kable()

## Indentication cloud names

gbpeld |>
  filter(year > 1997) |> 
  #filter(!grepl("^-", identifiedBy)) |> 
  #filter(!grepl("^[0-9]+", identifiedBy)) |>
  group_by(identifiedBy) |>
  count() |>
  na.omit() |>  
  kable()

IDfiltered_data = gbpeld |>
  filter(year > 1997) |> 
  #filter(!grepl("^-", identifiedBy)) |> 
  #filter(!grepl("^[0-9]+", identifiedBy)) |>
  #filter(!grepl("Administrador", identifiedBy)) |>
  group_by(identifiedBy) |>
  count() |>
  na.omit()

# Create a word cloud
wordcloud(IDfiltered_data$identifiedBy, IDfiltered_data$n, random.order = FALSE)


