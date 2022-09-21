
library(purrr)
library(xml2)
library(XML)
library(dplyr)

### Teste selecionano os arquivos
dados = list.files("data-raw/ppbio_raw/Metacat/documents from metacat 02062022")

metadata_all <- tibble::tibble(metadata = dados)


metadata_2_all= metadata_all |>
  tidyr::separate(metadata, c("name", "id", "version"), remove = FALSE) |>
  dplyr::mutate(id = as.numeric(id), version = as.numeric(version)) |>
  dplyr::group_by(name, id) |>
  dplyr::slice_max(version, n = 1) |>
  dplyr::ungroup()

nomes = metadata_2_all$metadata

dado2 = sapply(nomes, function(x){list.files("data-raw/ppbio_raw/Metacat/documents from metacat 02062022",pattern = x)})

my_function <- function(x){
  file.rename( from = file.path("/home/tai-rocha/Documents/Github/Projetos/PPBio/data-raw/ppbio_raw/Metacat/documents from metacat 02062022", x) ,
               to = file.path("/home/tai-rocha/Documents/Github/Projetos/PPBio/data/ppbio", x) )
}

# apply the function to all files
lapply(nomes, my_function)


### teste xml
my_files <- list.files("data/ppbio", full.names = TRUE)

read_my_xml <- function(x, path = "//dataset") {
  tmp <- read_xml(x) # read the xml file
  tmp <- tmp %>% 
    xml_find_first(path) %>% # select the //dataset node
    xml_children # select all children of that node
  
  # this extracts the text of all children 
  # aka the text between the > TEXT </ Tags
  out <- tmp %>% xml_text 
  # Takes the names of the tags <NAME> ... </NAME>
  names(out) <- tmp %>% xml_name
  # Turns out to tibble - see https://stackoverflow.com/q/40036207/3301344
  bind_rows(out)
}

dat <- map_df(my_files, read_my_xml) # map_df is similar to a loop + binding it to one tibble



