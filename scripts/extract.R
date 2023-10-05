print(.libPaths())
library(gmailr)

gm_auth(token = gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))



#retorna message_id e thread_id
exec = gm_messages(
  search = 'totais newer_than:1d'
)

#retorna message_id
ids = gm_id(exec)

#salva o anexo
for (i in ids){
  gm_save_attachments(gm_message(i), path = 'data-raw')
  
}

if 
  (length(ids) == 2){
    print('total de bases ok')
  }else{
  print('verificar bases')
  }


