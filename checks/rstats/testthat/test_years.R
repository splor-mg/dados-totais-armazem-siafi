test_that("cobertura temporal anos totais_execucao_siafi", {  
  expected <- 2002:year(Sys.Date())
  result <- sort(unique(package$totais_execucao_siafi$ano))
  
  expect_equal(result, expected)
})

test_that("cobertura temporal anos totais_siafi_restos_pagar", {  
  expected <- 2002:year(Sys.Date())
  result <- sort(unique(package$totais_siafi_restos_pagar$ano))
  
  expect_equal(result, expected)
})
