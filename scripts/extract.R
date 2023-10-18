library(gmailr)

gm_auth(token = gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))


#retorna message_id e thread_id

msg_hist = gm_messages(
  search =  "subject:(historico) .csv  newer_than:1d"
)

#retorna message_id
ids_hist = gm_id(msg_hist)

#retorna a message, lista que contém informações entre elas o attachmentId
message = gm_message(ids_hist)


#extrai attachmentId independemente da sua posição na lista recursiva
extract_data_by_name <- function(list, name) {
  result <- list()
  
  if (length(ids_hist == 1)){
        recursive_extract <- function(x) {
    if (is.list(x)) {
      if (name %in% names(x)) {
        result <<- c(result, list(x[[name]]))
      } else {
        lapply(x, recursive_extract)
      }
    }
    }
  recursive_extract(list)
  return(result[[1]])
}
}

attachment_id <- extract_data_by_name(message, 'attachmentId')
#salva o anexo renomeando-o
my_attachment = gm_attachment(attachment_id, ids_hist)
gm_save_attachment(my_attachment, "data-raw/totais_siafi_historico.csv")

  

