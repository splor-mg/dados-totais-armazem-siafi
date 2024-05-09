library(data.table)
library(formattable)
library(purrr)

data <- fread('C:/projects/dados-totais-armazem-siafi/data/totais_siafi_execucao.csv')

names(data)

colunas <- names(data)[grepl("^vlr_", names(data))]

data[
  , 
  (colunas) := map(.SD, accounting, big.mark = ".", decimal.mark = ",") ,
  .SDcols =colunas
]

data <- data[, map(.SD, sum), by = .(ano, mes_cod), .SDcols = colunas]

totals <- fread('C:/projects/dados-totais-armazem-siafi/data/totais_siafi_execucao.csv')

names(totals)

colunastotals <- names(totals)[grepl("^vlr",names(totals))]

totals[,(colunastotals) := map(.SD, accounting, big.mark = ".", decimal.mark = ","), 
       .SDcols = colunastotals]

totals_2024 <- totals[ano == 2024, map(.SD, sum), by = .(ano,mes_cod), .SDcols = colunastotals]


totals[ano==2024,]

result <- totals_2024[,diff := vlr_pago_financeiro - data$vlr_pago_financeiro]

