## Este scritp gera gráficos para os dados do gbif
## Versão | Version  R 4.3
## Author : Tainá Rocha
## Data : 07 June 2023
## Last update: 09 June 2023


library(dplyr)
library(ggplot2)
library(knitr)
library(readr)
library(stringr)
library(wordcloud)


gbif_peld = readr::read_csv("data/gbif/peldBind.csv")

## Kingdom

gbif_peld |>
  filter(year > 1997) |> 
  filter(!grepl('incertae sedis', kingdom)) |>
  group_by(kingdom) |>
  count() |>
  kable()

g = gbif_peld |>
  filter(year > 1997) |> 
  filter(!grepl('incertae sedis', kingdom)) |>
  group_by(kingdom) |>
  count() #|>
#kable()

g$kingdom = factor(g$kingdom, levels = g$kingdom[order(g$n, decreasing = TRUE)])

h = ggplot(g, aes(x = kingdom, y = n))
h +  geom_bar(stat = "identity", fill ="gray", width = 0.5) +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = "kingdom", y = "n",
       title = "Kingdom") +
  scale_y_sqrt() +
  xlab(" ") + ylab("n") +
  theme_bw() +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )

## Family 

fgbif_peld = gbif_peld |>
  filter(year > 1997) |> 
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |> 
  na.omit()

fgbif_peld$family = factor(fgbif_peld$family, levels = fgbif_peld$family[order(fgbif_peld$n, decreasing = TRUE)])

ggplot(fgbif_peld, aes(x = family, y = n)) +
  geom_bar(stat = "identity", fill ="gray") +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = " ", y = "N",
       title = "Families") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )


## Genus 


## Locality 
## State Provincia Bar graphic
state = gbif_peld |>
  filter(year > 1997) |> 
  filter(countryCode == "BR") |> 
  mutate(across('stateProvince', str_replace, 'BA.', 'Bahia')) |> 
  mutate(across('stateProvince', str_replace, 'Baha', 'Bahia')) |> 
  mutate(across('stateProvince', str_replace, 'Minas Gerias', 'Minas Gerais')) |> 
  mutate(across('stateProvince', str_replace, 'Para', 'Pará')) |> 
  mutate(across('stateProvince', str_replace, 'Piaui', 'Piauí')) |> 
  mutate(across('stateProvince', str_replace, 'Rio de Janeirp', 'Rio de Janeiro')) |> 
  group_by(stateProvince) |>
  count() |>
  na.omit() #|>   
#kable()

state$stateProvince = factor(state$stateProvince, levels = state$stateProvince[order(state$n, decreasing = TRUE)])

ggplot(state, aes(x = stateProvince, y = n)) +
  geom_bar(stat = "identity", fill ="gray", width = 0.5) +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = " ", y = "N",
       title = "States") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )


## Instution  Bar graphic
Inst = gbif_peld |>
  filter(year > 1997) |> 
  group_by(institutionCode) |>
  count() |>
  na.omit()  
#kable()

ggplot(Inst, aes(x = institutionCode, y = n)) +
  geom_bar(stat = "identity", fill = "grey", width = 0.25) +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = "_", y = "N",
       title = "Institutions") +
  theme_bw() +
  #theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )


## Indentication cloud names

gbif_peld |>
  filter(year > 1997) |> 
  filter(!grepl("^-", identifiedBy)) |> 
  filter(!grepl("^[0-9]+", identifiedBy)) |>
  group_by(identifiedBy) |>
  count() |>
  na.omit() |>  
  kable()

IDfiltered_data = gbif_peld |>
  filter(year > 1997) |> 
  #filter(!grepl("^-", identifiedBy)) |> 
  #filter(!grepl("^[0-9]+", identifiedBy)) |>
  #filter(!grepl("Administrador", identifiedBy)) |>
  group_by(identifiedBy) |>
  count() |>
  na.omit()

# Create a word cloud
wordcloud(IDfiltered_data$identifiedBy, IDfiltered_data$n, random.order = FALSE)

IDfiltered_data$identifiedBy = factor(IDfiltered_data$identifiedBy, levels = IDfiltered_data$identifiedBy[order(IDfiltered_data$n, decreasing = TRUE)])

ggplot(IDfiltered_data, aes(x = identifiedBy, y = n)) +
  geom_bar(stat = "identity", fill = "grey", width = 0.5) +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = "_", y = "N",
       title = "Identified") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )

