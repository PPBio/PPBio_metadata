### STOPWORDS IN PORTUGUESE
### Code from: https://gist.github.com/lgelape/edcc0250f21bcc5710c0a9fd0488d1ea

## Create a unique dataset from several datasets with stopwords in Portuguese

# Lucas Gelape

# Packages
library(dplyr)
library(stringi)
library(readr)
library(purrr)
library(tidytext)
library(tm)

###############################################################################

## STOPWORDS ISO (https://github.com/stopwords-iso/stopwords-pt)

# Datasets links
links_stopwords_pt <- c("https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/bbalet_stopwords_pt.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/fergiemcdowall_stopwords_pt.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/geonetwork-por.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/gh-stopwords-json-pt.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/language-resource-stopwords-variant.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/language-resource-stopwords.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/ranksnl-brazilian.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/ranksnl-portugese.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/stop-words-portugese.txt",
                        "https://raw.githubusercontent.com/stopwords-iso/stopwords-pt/master/raw/stopwords-filter-pt.txt")

# Function to download all datasets 
stopwords_pt_iso_complete <- function(link){
  
  # Open each dataset and pile them up
  stopwords_pt_final <- suppressMessages(read_delim(link, delim = "\n", col_names = "word"))
  # Add stopwords source and clean word text
  stopwords_pt_final <- stopwords_pt_final %>%
    mutate(source = "stopwords-iso",
           word = tolower(trimws(word)))
  
}

# Download datasets and delete duplicate entries
stopwords_pt_iso <- map_df(.x = links_stopwords_pt,
                           .f = stopwords_pt_iso_complete) %>%
  distinct()

###############################################################################

## TIDYTEXT (package)

stopwords_tidytext <- tidytext::get_stopwords(language = "pt") %>%
  mutate(source = "stopwords package (via tidytext) - snowball") %>%
  select(-lexicon)

###############################################################################

## TM (package)

stopwords_tm <- data.frame(word = tm::stopwords(kind = "pt")) %>%
  mutate(source = "tm package")

###############################################################################

## IDENTIFY UNIQUE STOPWORDS FROM ALL SOURCES

# Pile datasets from all sources and delete duplicate words
stopwords_pt_final <- bind_rows(stopwords_pt_iso, stopwords_tidytext, stopwords_tm) %>%
  select(-source) %>%
  distinct()

# Remove objects which will not be used if user sources the file
rm(list = c("stopwords_pt_final_noaccent", "stopwords_pt_iso", "stopwords_tidytext", "stopwords_tm"))

# If the user wants to eliminate accents, she should execute the following code
#stopwords_pt_final_noaccent <- stopwords_pt_final %>%
#  mutate(word = stri_trans_general(word, "ascii")) %>%
#  distinct()
