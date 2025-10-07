
gmailr::gm_auth(token = gmailr::gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))


search_query_old <- "older_than:15d"

gmailr::gm_messages(search_query_old, num_results = 1000)|>
gmailr::gm_id() |>
purrr::walk(gmailr::gm_delete_message)






  




