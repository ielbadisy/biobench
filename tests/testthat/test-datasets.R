datasets <- biobenchindex()$dataset

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

test_that("biobenchindex covers all shipped datasets", {
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

test_that("highriskpreg implausible ages match the documentation", {
  d <- biobench::highriskpreg
  expect_equal(sum(is.na(d$age)), 1L)
  expect_true(is.na(d$age[d$study_id == 480]))
  expect_equal(sum(d$age >= 10 & d$age <= 13, na.rm = TRUE), 14L)
  expect_equal(sum(d$age == 10, na.rm = TRUE), 1L)
  expect_equal(sum(d$age >= 55 & d$age <= 65, na.rm = TRUE), 29L)
  expect_equal(sum(d$age == 60, na.rm = TRUE), 15L)
  raw <- utils::read.csv(system.file("extdata", "highriskpreg_raw.csv", package = "biobench"))
  expect_equal(raw$Age[raw$study_id == 480], 325)
})
