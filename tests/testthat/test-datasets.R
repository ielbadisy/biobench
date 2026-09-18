datasets <- biobench_index()$dataset

test_that("every indexed dataset loads and is a non-empty data frame", {
  for (nm in datasets) {
    e <- new.env()
    utils::data(list = nm, package = "biobench", envir = e)
    d <- get(nm, envir = e, inherits = FALSE)
    expect_s3_class(d, "data.frame")
    expect_gt(nrow(d), 0)
    expect_gt(ncol(d), 0)
  }
})

test_that("biobench_index covers all shipped datasets", {
  shipped <- data(package = "biobench")$results[, "Item"]
  expect_setequal(datasets, shipped)
})
