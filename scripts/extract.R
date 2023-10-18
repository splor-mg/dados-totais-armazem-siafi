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

attachment_id <- gm_attachments(message)[["id"]]
#salva o anexo renomeando-o
my_attachment = gm_attachment(attachment_id, ids_hist)
gm_save_attachment(my_attachment, "data-raw/totais_siafi_historico.csv")

  

