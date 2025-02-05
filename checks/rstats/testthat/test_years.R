test_that("cobertura temporal anos totais_siafi_execucao_cota", {  
  expected <- 2002:2025
  result <- sort(unique(package$totais_siafi_execucao_cota$ano))
  
  expect_equal(result, expected)
})


test_that("cobertura temporal anos totais_siafi_execucao", {  
  expected <- 2002:2025
  result <- sort(unique(package$totais_siafi_execucao$ano))
  
  expect_equal(result, expected)
})

test_that("cobertura temporal anos totais_siafi_restos_pagar", {  
  expected <- 2002:2025
  result <- sort(unique(package$totais_siafi_restos_pagar$ano))
  
  expect_equal(result, expected)
})

