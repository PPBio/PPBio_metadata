###############################################################################################
## Script para análise de dados do speciesLink| Script for data analysis of speciesLink . 
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
###############################################################################################

## Packages 
library(dplyr)
library(tidyr)
library(readr)
library(tibble)

######################################### PPBio ######################################### 

## Read raw data

splinkppbio = readr::read_delim("data-raw/speciesLink/PPBIo/20221012162526-0011185.txt")


## Pipeline PPBio 

PPBIo = rep("PPBio", time = 14299)
splppbio = rep("speciesLink", time = 14299)

slppbio = splinkppbio |> 
  select(notes, collector, institutioncode, collectioncode, catalognumber, yearcollected, monthcollected, daycollected, latitude, longitude, locality, stateprovince, country, kingdom, phylum, taxonclass, ordem, family, genus, species, scientificname) |> 
  rename(Title = notes,
         Collector_Author = collector,
         Institution = institutioncode,
         Collection_Code = collectioncode,
         Catalog_Number = catalognumber,
         Year = yearcollected,
         Month = monthcollected,
         Day = daycollected,
         Latitude = latitude,
         Longitude = longitude,
         Locality = locality,
         State = stateprovince,
         Country = country,
         Kingdom = kingdom,
         Phylum = phylum,
         Class = taxonclass,
         Order = ordem,
         Family = family,
         Genus = genus,
         Species = species,
         Scientific_Name = scientificname) |> 
  add_column(PPBio_PELD = PPBIo, .after =  "Collector_Author") |> 
  add_column(Database_Repository = splppbio, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")
  
######################################### PELD ######################################### 


## Read raw data

splinkpeld = readr::read_delim("data-raw/speciesLink/PELD/20221012163802-0000744.txt")


## Pipeline PELD 

PELD = rep("PELD", time = 1086 )
splpeld = rep("speciesLink", time = 1086 )

slpeld = splinkpeld |> 
  select(notes, collector, institutioncode, collectioncode, catalognumber, yearcollected, monthcollected, daycollected, latitude, longitude, locality, stateprovince, country, kingdom, phylum, taxonclass, ordem, family, genus, species, scientificname) |> 
  rename(Title = notes,
         Collector_Author = collector,
         Institution = institutioncode,
         Collection_Code = collectioncode,
         Catalog_Number = catalognumber,
         Year = yearcollected,
         Month = monthcollected,
         Day = daycollected,
         Latitude = latitude,
         Longitude = longitude,
         Locality = locality,
         State = stateprovince,
         Country = country,
         Kingdom = kingdom,
         Phylum = phylum,
         Class = taxonclass,
         Order = ordem,
         Family = family,
         Genus = genus,
         Species = species,
         Scientific_Name = scientificname) |> 
  add_column(PPBio_PELD = PELD, .after =  "Collector_Author") |> 
  add_column(Database_Repository = splpeld, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")


################################################# Bind


splink_bind = bind_rows(list(slpeld, slppbio)) 

write_csv(splink_bind, "data/speciesLink/splink_bind.csv")




  
