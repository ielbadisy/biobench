datasets <- biobench_index()$dataset

test_that("every indexed dataset loads and is a non-empty data frame", {
  for (nm in datasets) {
    d <- get(nm, envir = asNamespace("biobench"))
    expect_s3_class(d, "data.frame")
    expect_gt(nrow(d), 0)
    expect_gt(ncol(d), 0)
  }
})

test_that("biobench_index covers all shipped datasets", {
  shipped <- data(package = "biobench")$results[, "Item"]
  expect_setequal(datasets, shipped)
})
