###############################################################################################
## Script para formatar dados PELD e PPBIO do JABOT| This script setting PELD or 
## PPBio data from  JABOT. 
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
## Date: 26 octuber 2022
###############################################################################################

## Packages 
library(dplyr)
library(tidyr)
library(readr)
library(tibble)

## Read raw data

jabot_ppbio_peld = readr::read_csv("data/JABOT/jabot_peld_ppbio.csv")

## Pipeline formatar

PP = rep("PELD_PPBIO", time = 64)
jabotPP = rep("RFFP-Herbário da Faculdade de Formação de Professores da UERJ", time = 64)

jabot = jabot_ppbio_peld |> 
  select(fieldNotes, recordedBy, institutionCode, collectionCode, catalogNumber, year, month, day, decimalLatitude, decimalLongitude, locality, stateProvince, country, kingdom, phylum, order, family, genus, specificEpithet, scientificName) |> 
  rename(Title = fieldNotes,
         Collector_Author = recordedBy,
         Institution = institutionCode,
         Collection_Code = collectionCode,
         Catalog_Number = catalogNumber,
         Year = year,
         Month = month,
         Day = day,
         Latitude = decimalLatitude,
         Longitude = decimalLongitude,
         Locality = locality,
         State = stateProvince,
         Country = country,
         Kingdom = kingdom,
         Phylum = phylum,
         Order = order,
         Family = family,
         Genus = genus,
         Species = specificEpithet,
         Scientific_Name = scientificName) |> 
  add_column(PPBio_PELD = PP, .after =  "Collector_Author") |> 
  add_column(Class = NA, .after = "Phylum") |> 
  add_column(Database_Repository = jabotPP, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")
########

write_csv(jabot, "data/JABOT/jabot_PP_final.csv")
