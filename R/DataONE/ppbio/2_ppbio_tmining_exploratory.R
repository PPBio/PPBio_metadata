#############################################################################################
##Este scritp faz uma mineração de texto para análise exploratória | This code do a text mining for exploratory analysis
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
#############################################################################################

## Pacotes | Packages

library(dplyr)
library(ggplot2)
library(stringi)
library(stringr)
library(tidytext)
library(wordcloud)
library(tm)

## Lendo a planilha 

ppbio = readr::read_csv("data/DataOne/ppbio/1_ppbio_datasets_node.csv")


## Primeiro é preciso executar o script stop_words

source("R/stop_words_pt.R")
data("stop_words")
stop_words

## Pipelines para mineração de texto na coluna título | Pipeline to text mining in title column

tm_1 = ppbio |>
  select(title) |> 
  unnest_tokens(title2, title) |> #name of colunm, in this case text column
  # filter(!grepl("[[:digit:]]", text)) |> 
  anti_join(stop_words, by = c("title2" = "word")) |> 
  anti_join(stopwords_pt_final, by = c("title2" = "word")) |> 
  count(title2, sort = TRUE) |> 
  filter(n > 20, n < 50) |> 
  mutate(title2 = reorder(title2, n)) |> 
  ggplot(aes(n, title2)) +
  geom_col() +
  labs(y = NULL)


tm_2 = ppbio |>
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

##  Filter

## Test 1- Not good for the purpose

library(dplyr)
library(stringr)

keywords = c("Manaus", "USA", "Mato Grosso")

ppbio_2 = as_tibble(ppbio) %>%
  mutate(abstract = tolower(abstract),
         match = str_c(keywords, collapse = '|'),
         key_word = str_extract_all(abstract, match)) %>%
  select(-match)

rm(keywords)


### GBIF 