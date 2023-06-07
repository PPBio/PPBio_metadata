## Este scritp formata os dados do GBIF para depois ser incluido na tabela Version_ALL |
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
## Dowload data : 26 October 2022

library(data.table)
library(dplyr)
library(readr)

############## PELD

gbif_peld_1 = data.table::fread("data-raw/gbif/PELD/Datasets/0098756-220831081235567.csv")

gbif_peld_2 = data.table::fread("data-raw/gbif/PELD/Datasets/0098781-220831081235567.csv")

gbif_peld_3 = data.table::fread("data-raw/gbif/PELD/Datasets/0098793-220831081235567.csv")


gbif_peld_bind = dplyr::bind_rows(list(gbif_peld_1, gbif_peld_2, gbif_peld_3)) 

readr::write_csv(gbif_peld_bind, "data/gbif/peldBind.csv")

## Pipeline PELD 

## gbif_peld_1

peld1 = rep("PELD", time = 1656 )
gbifpeld1 = rep("gbif", time = 1656 )

gbifpeld_1 = gbif_peld_1 |> 
  select(occurrenceID, recordedBy, institutionCode, collectionCode, catalogNumber, year, month, day, decimalLatitude, decimalLongitude, locality, stateProvince, countryCode, kingdom, phylum, class, order, family, genus, species, scientificName) |> 
  rename(Title = occurrenceID,
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
         Country = countryCode,
         Kingdom = kingdom,
         Phylum = phylum,
         Class = class,
         Order = order,
         Family = family,
         Genus = genus,
         Species = species,
         Scientific_Name = scientificName) |> 
  add_column(PPBio_PELD = peld1, .after =  "Collector_Author") |> 
  add_column(Database_Repository = gbifpeld1, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")

## gbif_peld_2

peld2 = rep("PELD", time = 394)
gbifpeld2 = rep("gbif", time = 394)

gbifpeld_2 = gbif_peld_2 |> 
  select(occurrenceID, recordedBy, institutionCode, collectionCode, catalogNumber, year, month, day, decimalLatitude, decimalLongitude, locality, stateProvince, countryCode, kingdom, phylum, class, order, family, genus, species, scientificName) |> 
  rename(Title = occurrenceID,
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
         Country = countryCode,
         Kingdom = kingdom,
         Phylum = phylum,
         Class = class,
         Order = order,
         Family = family,
         Genus = genus,
         Species = species,
         Scientific_Name = scientificName) |> 
  add_column(PPBio_PELD = peld2, .after =  "Collector_Author") |> 
  add_column(Database_Repository = gbifpeld2, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")

## gbif_peld_3

peld3 = rep("PELD", time = 771)
gbifpeld3 = rep("gbif", time = 771)

gbifpeld_3 = gbif_peld_3 |> 
  select(occurrenceID, recordedBy, institutionCode, collectionCode, catalogNumber, year, month, day, decimalLatitude, decimalLongitude, locality, stateProvince, countryCode, kingdom, phylum, class, order, family, genus, species, scientificName) |> 
  rename(Title = occurrenceID,
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
         Country = countryCode,
         Kingdom = kingdom,
         Phylum = phylum,
         Class = class,
         Order = order,
         Family = family,
         Genus = genus,
         Species = species,
         Scientific_Name = scientificName) |> 
  add_column(PPBio_PELD = peld3, .after =  "Collector_Author") |> 
  add_column(Database_Repository = gbifpeld3, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")


############## PPBio

gbif_ppbio_1 = data.table::fread("data-raw/gbif/ppbio/Datasets/0098589-220831081235567.csv")

gbif_ppbio_2 = data.table::fread("data-raw/gbif/ppbio/Datasets/0098608-220831081235567.csv")

gbif_ppbio_3 = data.table::fread("data-raw/gbif/ppbio/Datasets/0098611-220831081235567.csv") |> 
  dplyr::mutate(occurrenceID = as.character(occurrenceID))

BindPPBIO = dplyr::bind_rows(list(gbif_ppbio_1, gbif_ppbio_2, gbif_ppbio_3)) 

readr::write_csv(BindPPBIO, "data/gbif/ppbioBind.csv")

## Pipeline PPBio 

## gbif_ppbio_1

ppbio1 = rep("PPBIO", time = 537)
gbifppbio1 = rep("gbif", time =  537)

gbifppbio_1 = gbif_ppbio_1 |> 
  select(occurrenceID, recordedBy, institutionCode, collectionCode, catalogNumber, year, month, day, decimalLatitude, decimalLongitude, locality, stateProvince, countryCode, kingdom, phylum, class, order, family, genus, species, scientificName) |> 
  rename(Title = occurrenceID,
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
         Country = countryCode,
         Kingdom = kingdom,
         Phylum = phylum,
         Class = class,
         Order = order,
         Family = family,
         Genus = genus,
         Species = species,
         Scientific_Name = scientificName) |> 
  add_column(PPBio_PELD = ppbio1, .after =  "Collector_Author") |> 
  add_column(Database_Repository = gbifppbio1, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")

## gbif_ppbio_2

ppbio2 = rep("PPBIO", time = 3122)
gbifppbio2 = rep("gbif", time = 3122)

gbifppbio_2 = gbif_ppbio_2 |> 
  select(occurrenceID, recordedBy, institutionCode, collectionCode, catalogNumber, year, month, day, decimalLatitude, decimalLongitude, locality, stateProvince, countryCode, kingdom, phylum, class, order, family, genus, species, scientificName) |> 
  rename(Title = occurrenceID,
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
         Country = countryCode,
         Kingdom = kingdom,
         Phylum = phylum,
         Class = class,
         Order = order,
         Family = family,
         Genus = genus,
         Species = species,
         Scientific_Name = scientificName) |> 
  add_column(PPBio_PELD = ppbio2, .after =  "Collector_Author") |> 
  add_column(Database_Repository = gbifppbio2, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")

## gbif_ppbio_3 ## pay Attention here

ppbio3 = rep("PPBIO", time = 136556)
gbifppbio3 = rep("gbif", time = 136556)

gbifppbio_3 = gbif_ppbio_3 |> 
  select(datasetKey, recordedBy, institutionCode, collectionCode, catalogNumber, year, month, day, decimalLatitude, decimalLongitude, locality, stateProvince, countryCode, kingdom, phylum, class, order, family, genus, species, scientificName) |> 
  rename(Title = datasetKey,
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
         Country = countryCode,
         Kingdom = kingdom,
         Phylum = phylum,
         Class = class,
         Order = order,
         Family = family,
         Genus = genus,
         Species = species,
         Scientific_Name = scientificName) |> 
  add_column(PPBio_PELD = ppbio3, .after =  "Collector_Author") |> 
  add_column(Database_Repository = gbifppbio3, .after = "PPBio_PELD") |> 
  add_column(Funding_Agency = NA, .after = "Catalog_Number") |> 
  add_column(Biome_Domain = NA, .after = "Country")



############# Merge all

gbif_bind = bind_rows(list(gbifpeld_1, gbifpeld_2, gbifpeld_3, gbifppbio_1, gbifppbio_2, gbifppbio_3)) 

write_csv(gbif_bind, "data/gbif/gbif_bind.csv")

