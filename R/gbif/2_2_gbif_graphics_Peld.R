## Este scritp gera gráficos para os dados do gbif
## Versão | Version  R 4.3
## Author : Tainá Rocha
## Data : 07 June 2023
## Last update: 08 July 2023


library(dplyr)
library(geobr)
library(ggplot2)
library(knitr)
library(readr)
library(sf)
library(stringr)
library(wordcloud)


inat_peld = readr::read_csv("data-raw/iNaturalist/peld/peld_inat.csv")

## Kingdom

inat_peld |>
  mutate(across('iconic_taxon_name', str_replace, 'Amphibia', 'Vertebrate'))  |> 
  mutate(across('iconic_taxon_name', str_replace, 'Aves', 'Vertebrate'))  |>
  mutate(across('iconic_taxon_name', str_replace, 'Mammalia', 'Vertebrate'))  |>
  mutate(across('iconic_taxon_name', str_replace, 'Reptilia', 'Vertebrate'))  |>
  mutate(across('iconic_taxon_name', str_replace, 'Arachnida', 'Invertebrate')) |>
  mutate(across('iconic_taxon_name', str_replace, 'Mollusca', 'Invertebrate')) |>
  mutate(across('iconic_taxon_name', str_replace, 'Insecta', 'Invertebrate')) |>
  mutate(across('iconic_taxon_name', str_replace, 'Fungi', 'Invertebrate')) |>
  group_by(iconic_taxon_name) |>
  count() |>
  kable()

inat_peld |> 
  group_by(iconic_taxon_name) |>
  count() |>
  kable()


#readr::write_csv(inat_map, "data/inat_PPBIO_map.csv")



## State

inatpeld|>
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


