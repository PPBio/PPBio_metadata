###############################################################################################
## Script para filtrar dados PELD e PPBIO do JABOT| This script filter only PELD or 
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

jabotdata = readr::read_delim("data-raw/jabot_rffp/dwca-rffp-v1.31/occurrence.txt")

## Pipeline 1: to filter only PELD or PPBio data 

peld_ppbio = jabotdata |> 
  filter(municipality == "Angra dos Reis") |> 
  filter(grepl('RAPEDL|Módulo|PPBio', locality))

write_csv(peld_ppbio, "data/JABOT/jabot_peld_ppbio.csv")
