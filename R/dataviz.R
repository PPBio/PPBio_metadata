## Scritp de visuaização dos dados | Scritp to dataviz
## Code to download PPBIO data from ebird
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
## Dowload data : 27 October 2022

library(data.table)
library(dplyr)
library(ggplot2)
library(knitr)
library(readr)

all = read_csv("data/all_merged.csv")

## Databases

databases = all |> 
  group_by(Database_Repository) |>
  count() |>
  kable()


databases_2 = all |>
  group_by(Database_Repository) |>
  count() |>
  ggplot(aes(x=Database_Repository, y=n)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()

databases_2 + coord_flip()

## Institutions 

inst = all |> 
  group_by(Institution) |>
  count() |>
  kable()


inst_2 = all |> 
  group_by(Institution) |>
  count() |>
  ggplot(aes(x=Institution, y=n)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()

inst_2 + coord_flip()

## Country 
countr = all |> 
  group_by(Country) |>
  count() |>
  kable()

countr_2 = all |> 
  group_by(Country) |>
  count() |>
  ggplot(aes(x=Country, y=n)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()

countr_2  + coord_flip()

## State
state = all |> 
  group_by(State) |>
  count() |>
  kable()

state_2 = all |> 
  group_by(State) |>
  count() |>
  ggplot(aes(x=State, y=n)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()

state_2 + coord_flip()


## Kingdown

kin = all |> 
  group_by(Kingdom) |>
  count() |>
  ggplot(aes(x=Kingdom, y=n)) +
  geom_bar(stat="identity", fill="steelblue")+
  theme_minimal()

kin + coord_flip()


