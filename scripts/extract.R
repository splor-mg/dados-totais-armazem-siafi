
source("scripts/utils.R")

gmailr::gm_auth(token = gmailr::gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))

search_query <- "subject:(totais) filename:.csv newer_than:1d"

gmailr::gm_messages(search_query) |>
gmailr::gm_id() |>
purrr::walk(write_attachment)






  




