library(gmailr)

gm_auth(token = gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))



#retorna message_id e thread_id
msg = gm_messages(
  search =  "subject:(totais siafi) .csv  newer_than:1d"
)

#retorna message_id
ids = gm_id(msg)

#salva o anexo
for (i in ids){
  gm_save_attachments(gm_message(i), path = 'data-raw')
}



  

