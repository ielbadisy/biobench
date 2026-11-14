test_that("outcome = 'binary' is an alias for 'classification'", {
  b <- biobenchindex(outcome = "binary")
  expect_identical(b, biobenchindex(outcome = "classification"))
  expect_gt(nrow(b), 0)
  both <- biobenchindex(outcome = c("binary", "survival"))
  expect_setequal(both$task, c("classification", "survival"))
  expect_error(biobenchindex(outcome = "nonsense"))
})

test_that("the index records each dataset's outcome variable", {
  ix <- biobenchindex()
  expect_true("outcome_var" %in% names(ix))
  expect_type(ix$outcome_var, "character")
  for (i in which(!is.na(ix$outcome_var))) {
    e <- new.env()
    utils::data(list = ix$dataset[i], package = "biobench", envir = e)
    d <- get(ix$dataset[i], envir = e, inherits = FALSE)
    vars <- trimws(strsplit(ix$outcome_var[i], ",")[[1]])
    expect_true(all(vars %in% names(d)), info = ix$dataset[i])
  }
  expect_equal(ix$outcome_var[ix$dataset == "gbsg2"], "time, cens")
  expect_equal(ix$outcome_var[ix$dataset == "pima2"], "diabetes")
})

test_that("biostatlab is no longer listed as a source", {
  ix <- biobenchindex()
  expect_false("biostatlab" %in% ix$source_package)
  rmd <- testthat::test_path("..", "..", "README.Rmd")
  skip_if_not(file.exists(rmd))
  expect_false(any(grepl("biostatlab", readLines(rmd))))
})

test_that("outcome = 'other' selects the non-prediction datasets", {
  o <- biobenchindex(outcome = "other")
  expect_gt(nrow(o), 0)
  expect_true(all(o$task == "other"))
  expect_true("bcg" %in% o$dataset)
})
