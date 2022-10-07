#############################################################################################
## Este scritp faz uma mineração de texto para análise exploratório | This code do a text mining for exploratory analysis
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
#############################################################################################

## Pacotes | Packages

library(dplyr)
library(ggplot2)
library(stringi)
library(tidytext)
library(wordcloud)

## Lendo a planilha 

peld = readr::read_csv("data/Metadata_ppbio_peld/peld/1_peld_datasets_node.csv")


## Primeiro é preciso executar o script stop_words

source("R/Metadata/stop_words_pt.R")
data("stop_words")
stop_words

## Pipelines para mineração de texto na coluna título | Pipeline to text mining in title column

tm_1 = peld |>
  select(title) |> 
  unnest_tokens(title2, title) |> #name of colunm, in this case text column
  # filter(!grepl("[[:digit:]]", text)) |> 
  anti_join(stop_words, by = c("title2" = "word")) |> 
  anti_join(stopwords_pt_final, by = c("title2" = "word")) |> 
  count(title2, sort = TRUE) |> 
  filter(n > 10, n < 25) |> 
  mutate(title2 = reorder(title2, n)) |> 
  ggplot(aes(n, title2)) +
  geom_col() +
  labs(y = NULL)


tm_2 = peld |>
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


tm_3 = peld |>
  select(title) |> 
  unnest_tokens(title2, title) |> #name of colunm, in this case text column
  # filter(!grepl("[[:digit:]]", text)) |> 
  anti_join(stop_words, by = c("title2" = "word")) |> 
  anti_join(stopwords_pt_final, by = c("title2" = "word")) |> 
  count(title2, sort = TRUE) |> 
  filter(n > 51, n < 100) |> 
  mutate(title2 = reorder(title2, n)) |> 
  ggplot(aes(n, title2)) +
  geom_col() +
  labs(y = NULL)

graph_names  = peld |>
  select(title) |> 
  unnest_tokens(title2, title) |> #name of colunm, in this case text column
  # filter(!grepl("[[:digit:]]", text)) |> 
  anti_join(stop_words, by = c("title2" = "word")) |> 
  anti_join(stopwords_pt_final, by = c("title2" = "word")) |> 
  count(title2, sort = TRUE) |> 
  filter(n < 20) |> 
  with(wordcloud(title2, n, 
                 colors = brewer.pal(12, "Set1"),
                 max.words = 800)) 

##
