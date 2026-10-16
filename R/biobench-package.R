#' biobench: Biomedical Datasets for Machine Learning Benchmarking
#'
#' A curated collection of real biomedical datasets for benchmarking
#' classification, regression, and survival machine learning methods.
#' Each dataset is documented with its canonical literature reference; see
#' [biobench_index()] for a summary table.
#'
#' The shipped datasets are lightly cleaned (syntactic names, blanks and
#' sentinel codes as `NA`). For teaching data import and cleaning, the
#' untouched source versions of three of them are installed as CSV files:
#' `highriskpreg_raw.csv` (names with spaces, blank outcome),
#' `framingham_raw.csv` (missing coded `-1`), and `tobaccomorocco_raw.csv`
#' (blank survey answers). Locate them with
#' `system.file("extdata", "framingham_raw.csv", package = "biobench")`.
#'
#' @keywords internal
"_PACKAGE"
