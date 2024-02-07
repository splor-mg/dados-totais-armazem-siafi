
gmailr::gm_auth(token = gmailr::gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))


search_query_old <- "subject:(totais) filename:.csv filename:.csv older_than:15d"

gmailr::gm_messages(search_query_old)|>
gmailr::gm_id() |>
purrr::walk(gmailr::gm_delete_message)






  




