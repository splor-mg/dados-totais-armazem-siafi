library(frictionless)
library(purrr)
library(glue)

source("scripts/utils.R")

package <- read_package("datapackage.yaml")
datapackage_files <- map(package$resources, "path") |> 
  unlist() |>
  stringr::str_remove("^data-raw/")
  
datapackage_files_count <- datapackage_files |> 
  length() 

gmailr::gm_auth(token = gmailr::gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))

current_date = Sys.Date()

search_query <- paste0("subject:(totais)"," after: ", current_date, " filename:.csv")

attachment_ids <- gmailr::gm_messages(search_query) |>
                  gmailr::gm_id()

attachments_count <- length(attachment_ids)

if (datapackage_files_count != attachments_count) {
  gmail_files <- purrr::map(attachment_ids, get_attachment_name)
  extra_files <- setdiff(unlist(gmail_files), datapackage_files)
  if(length(extra_files) > 0){
    logger::log_warn("O filtro de busca do gmail trouxe o arquivo adicional '{extra_files}'")
  }
}
  missing_files <- setdiff(datapackage_files, unlist(gmail_files))
  if(length(missing_files) > 0){
    logger::log_warn("O filtro de busca do gmail não trouxe o arquivo '{missing_files}'")
  }
  stop(glue("Expected {datapackage_files_count} data files but only found {attachments_count} in gmail"))

purrr::walk(attachment_ids,write_attachment)