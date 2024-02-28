
source("scripts/utils.R")

gmailr::gm_auth(token = gmailr::gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))

current_date = Sys.Date()

search_query <- paste0("subject:(totais)"," after: ", current_date, " filename:.csv")

gmailr::gm_messages(search_query) |>
gmailr::gm_id() |>
purrr::walk(write_attachment)
