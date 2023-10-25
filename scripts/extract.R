library(gmailr)
library(purrr)
library(stringr)

gm_auth(token = gm_token_read(
  path = "gmail.rds",
  key = "GMAILR_KEY"
))


#retorna message_id e thread_id

msg = gm_messages(
  search =  "subject:(current-totais|previous-totais) filename: .csv  newer_than:1d"
)

#retorna somente a coluna message_id

ids = gm_id(msg)


#retorna a message, lista que contém informações entre elas o attachmentId
#message = gm_message(ids)
messages = lapply(ids, gm_message)

#retonra o attachment_id, parametro necessário para a função de salvar renomeando
#attachment_id <- gm_attachments(message)[["id"]]
attachments_ids <- lapply(messages, function (x) gm_attachments(x)[["id"]])


#retorna o gm_attachment, parametro necessário para a função de salvar renomeando
#my_attachment <- gm_attachment(attachment_id,ids)
 my_attachments <- map2(attachments_ids, ids, gm_attachment)

#salva renomeando
#gm_save_attachment(my_attachment, "data-raw/totais_siafi_historico.csv")


####
 #retorna o filename
# attachments_filename <- lapply(messages, function (x) gm_attachments(x)[["filename"]]) 
# novo_attachments_filename <-str_extract(attachments_filename, "totais.execucao.siafi.historico")


## salva renomeando
  
  for (i in 1:length(messages)){
    
    if(str_detect(gm_attachments(messages[[i]])[["filename"]], "previous")){
      gm_save_attachment(my_attachments[[i]],"data-raw/previous-totais-siafi.csv")
    }else if ( 
      str_detect(gm_attachments(messages[[i]])[["filename"]], "current")){
      gm_save_attachment(my_attachments[[i]],"data-raw/current-totais-siafi.csv")
    } else {
      print("verificar anexos de email")
          } 
       }
    
  



  




