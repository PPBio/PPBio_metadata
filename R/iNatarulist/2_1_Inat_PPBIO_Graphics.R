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


inat_ppbio = readr::read_csv("data-raw/iNaturalist/ppbio/ppbio_inat.csv")

## Kingdom

inat_ppbio |>
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

inat_ppbio  |> 
  group_by(iconic_taxon_name) |>
  count() |>
  kable()

  
#readr::write_csv(inat_map, "data/inat_PPBIO_map.csv")




## Indentication cloud names

inat_map |>
  group_by(user_login) |>
  count() |>
  na.omit() |>  
  kable()

IDfiltered_data = inat_map |>
  group_by(user_login) |>
  count() |>
  na.omit()

# Create a word cloud
wordcloud(IDfiltered_data$user_login, IDfiltered_data$n, random.order = FALSE)
