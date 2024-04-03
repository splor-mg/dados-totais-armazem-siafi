library(frictionless)
library(purrr)
library(glue)

source("scripts/utils.R")

package <- read_package("datapackage.yaml")
data_files_count <- map(package$resources, "path") |> unlist() |> length()

gmailr::gm_auth(token = gmailr::gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))

current_date = Sys.Date()

search_query <- paste0("subject:(totais)"," after: ", current_date, " filename:.csv")

attachment_ids <- gmailr::gm_messages(search_query) |>
                  gmailr::gm_id()

attachments_count <- length(attachment_ids)

if (data_files_count != attachments_count) {
  stop(glue("Expected {data_files_count} data files but only found {attachments_count} in gmail"))
}

purrr::walk(attachment_ids,write_attachment)
