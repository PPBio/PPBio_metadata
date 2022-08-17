####

library(tidytext)
library(stringi)
library(wordcloud)
#the_table <- readr::read_csv()



text_df <- tibble(line = 1:395, text = final_2$value)

text_words= text_df |> 
  unnest_tokens(word, text) |>
 # filter(!grepl("[[:digit:]]", text)) |> 
  anti_join(stop_words) |> 
  anti_join(stopwords_pt_iso) |> 
  count(word, sort = TRUE) |> 
  filter(n > 10, n < 250) |> 
  mutate(word = reorder(word, n)) |> 
  ggplot(aes(n, word)) +
  geom_col() +
  labs(y = NULL)

text_df |> 
  unnest_tokens(word, text) |>
  # filter(!grepl("[[:digit:]]", text)) |> 
  anti_join(stop_words) |> 
  anti_join(stopwords_pt_iso) |> 
  count(word, sort = TRUE) |>
  filter(n > 10, n < 250) |> 
  with(wordcloud(word, n, 
                 colors = brewer.pal(12, "Set1"),
                 max.words = 200)) 
