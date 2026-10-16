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

test_that("column names are syntactic and no string column holds blanks", {
  for (nm in datasets) {
    e <- new.env()
    utils::data(list = nm, package = "biobench", envir = e)
    d <- get(nm, envir = e, inherits = FALSE)
    expect_identical(names(d), make.names(names(d)), info = nm)
    blank <- vapply(d, function(x) {
      if (is.factor(x)) any(trimws(levels(x)) == "")
      else is.character(x) && any(trimws(x) == "", na.rm = TRUE)
    }, logical(1))
    expect_false(any(blank), info = paste(nm, names(d)[blank]))
  }
})
