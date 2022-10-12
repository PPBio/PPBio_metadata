########################################################
## Here I used Microsoft365R to acess the shared folder
## I used too ...
########################################################


library(Microsoft365R)
library(AzureAuth)
library(AzureGraph)
#library(tableHTML)


create_graph_login("9188040d-6c67-4c5b-b112-36a304b66dad")
create_graph_login("consumers")


autentica <- get_personal_onedrive() # began here


az <- create_graph_login() # it will open a broswer tab, close all window
az <- get_graph_login() # give you the information necessary to  next command line

az <- create_graph_login("mytenant", app="{d44a05d5-c6a5-4bbb-82d2-443123722380}", password="{aaccf80a2c4a938420c1426459dfb3cc}")



t1 <-  list_sharepoint_sites()

#############


