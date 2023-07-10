#############################################################################################
##This code do a text mining for exploratory analysis
## Versão | Version  R 4.2.2
## Author : Tainá Rocha
#############################################################################################

## Pacotes | Packages

library(dplyr)
library(forcats)
library(ggplot2)
library(stringi)
library(stringr)
library(tidytext)
library(wordcloud)
library(tm)

## Data One 

ppbio = readr::read_csv("data/DataOne/ppbio/ppbio_dataone_formatada.csv")

ppbioplots = ppbio |> 
  filter(!grepl('Geographic coordinates', taxon))



## Taxon  

taxon = ppbioplots |> 
  count(taxon) |> 
  mutate(taxon = fct_reorder(taxon, n, .desc = TRUE))  |> 
  ggplot(aes(x = taxon, y = n)) + geom_bar(stat = 'identity')

taxon + coord_flip()

## Env 

env = ppbioplots |> 
  count(enviroment) |> 
  mutate(taxon = fct_reorder(enviroment, n, .desc = FALSE))  |> 
  ggplot(aes(x = enviroment, y = n)) + geom_bar(stat = 'identity')

env + coord_flip()


## State 

state = ppbioplots |> 
  count(State) |> 
  mutate(State = fct_reorder(State, n, .desc = FALSE))  |> 
  ggplot(aes(x = State, y = n)) + geom_bar(stat = 'identity')

state + coord_flip()


tm_2 = ppbioplots |>
  select(title) |> 
  unnest_tokens(title2, title) |> #name of colunm, in this case text column
  # filter(!grepl("[[:digit:]]", text)) |> 
  anti_join(stop_words, by = c("title2" = "word")) |> 
  anti_join(stopwords_pt_final, by = c("title2" = "word")) |> 
  count(title2, sort = TRUE) |> 
  filter(n > 26, n < 50) |> 
  mutate(title2 = reorder(title2, n)) |> 
  ggplot(aes(n, title2)) +
  geom_col() +
  labs(y = NULL)

graph_names  = ppbio |>
  select(title) |> 
  unnest_tokens(title2, title) |> #name of colunm, in this case text column
  # filter(!grepl("[[:digit:]]", text)) |> 
  anti_join(stop_words, by = c("title2" = "word")) |> 
  anti_join(stopwords_pt_final, by = c("title2" = "word")) |> 
  count(title2, sort = TRUE) |> 
  filter(n > 50) |> 
  with(wordcloud(title2, n, 
                 colors = brewer.pal(12, "Set1"),
                 max.words = 100)) 



############
ggplot(data=ppbioplots)+       # reference to data
  geom_bar(                 # geometry - a shape
    aes(x= taxon,   # aesthetics - x, y, and color values
        fill=taxon)   
  )


############# GBIF

gbif_1 = readr::read_delim("data-raw/gbif/ppbio/Datasets/0098589-220831081235567.csv", delim = "\t")

gbif_2 = readr::read_delim("data-raw/gbif/ppbio/Datasets/0098608-220831081235567.csv", delim = "\t")

gbif_3 = readr::read_delim("data-raw/gbif/ppbio/Datasets/0098611-220831081235567.csv", delim = "\t")

bind = rbind(gbif_1, gbif_2, gbif_3)


gbifppbio = bind |> 
  filter(!grepl('Geographic coordinates', taxon))


## Taxon  

taxon = bind |> 
  count(class) |> 
  mutate(class = fct_reorder(class, n, .desc = TRUE))  |> 
  ggplot(aes(x = class, y = n)) + geom_bar(stat = 'identity')

taxon + coord_flip()

## Env 

env = ppbioplots |> 
  count(enviroment) |> 
  mutate(taxon = fct_reorder(enviroment, n, .desc = FALSE))  |> 
  ggplot(aes(x = enviroment, y = n)) + geom_bar(stat = 'identity')

env + coord_flip()


## State 

state = bind |> 
  filter(countryCode == "BR") |> 
  count(stateProvince) |> 
  mutate(stateProvince = fct_reorder(stateProvince, n, .desc = TRUE))  |> 
  ggplot(aes(x = stateProvince, y = n)) + geom_bar(stat = 'identity')

state + coord_flip()


readr::write_csv(bind, "data/gbif/gbif_bind2.csv")


############# INaturalist

inat = readr::read_csv("data-raw/iNaturalist/ppbio/ppbio_inat.csv")


## Taxon  

taxon = inat |> 
  mutate(across('iconic_taxon_name', str_replace, 'Aves', 'Birds')) |> 
  count(iconic_taxon_name) |> 
  mutate(iconic_taxon_name = fct_reorder(iconic_taxon_name, n, .desc = TRUE))  |> 
  ggplot(aes(x = iconic_taxon_name, y = n)) + geom_bar(stat = 'identity')

taxon + coord_flip()

## Env 

env = ppbioplots |> 
  count(enviroment) |> 
  mutate(taxon = fct_reorder(enviroment, n, .desc = FALSE))  |> 
  ggplot(aes(x = enviroment, y = n)) + geom_bar(stat = 'identity')

env + coord_flip()


## State 

state = bind |> 
  filter(countryCode == "BR") |> 
  count(stateProvince) |> 
  mutate(stateProvince = fct_reorder(stateProvince, n, .desc = TRUE))  |> 
  ggplot(aes(x = stateProvince, y = n)) + geom_bar(stat = 'identity')

state + coord_flip()


readr::write_csv(bind, "data/gbif/gbif_bind2.csv")

