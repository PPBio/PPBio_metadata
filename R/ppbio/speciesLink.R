###############################################################################################
## Script para análise de dados do speciesLink| Script for data analysis of speciesLink . 
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
###############################################################################################

## Packages 

library(dplyr)
library(tidyr)
library(readr)

## Read raw data

splink = readr::read_delim("data-raw/speciesLink/PPBIo/20221012162526-0011185.txt")


## Pipeline 1 

splink |> 
  group_by(collectioncode) |> 
  summarise() |> 
  ungroup()
  
