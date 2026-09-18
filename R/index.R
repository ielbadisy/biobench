#' Index of datasets included in biobench
#'
#' Returns a summary table of every dataset shipped in the package,
#' including its task type, dimensions, missingness, and source package.
#' Optional arguments filter the table down to datasets matching given
#' criteria, so a benchmark suite can be assembled programmatically, e.g.
#' `biobench_index(outcome = "survival", highdim = FALSE)`.
#'
#' @param outcome Character vector, one or more of `"classification"`,
#'   `"regression"`, `"survival"`. If given, only datasets with a matching
#'   task are returned. Default `NULL` (no filter).
#' @param highdim Logical. If `TRUE`, keep only high-dimensional datasets
#'   (more than `highdim_threshold` predictor columns); if `FALSE`, keep
#'   only low-dimensional ones. Default `NULL` (no filter).
#' @param highdim_threshold Integer number of columns above which a
#'   dataset is considered high-dimensional. Default `20`.
#' @param source_package Character vector filtering on the upstream
#'   package a dataset was sourced from (`"mlbench"`, `"medicaldata"`,
#'   `"survival"`, `"TH.data"`, `"biostatlab"`, `"KMsurv"`, `"timereg"`,
#'   `"HSAUR3"`, `"pec"`, `"riskRegression"`, `"MASS"`, `"boot"`,
#'   `"aplore3"`, `"casebase"`, `"addhazard"`). Default `NULL` (no
#'   filter).
#' @param n_min Integer, minimum number of rows required. Default `NULL`.
#' @param n_max Integer, maximum number of rows allowed. Default `NULL`.
#' @param missing Logical. If `TRUE`, keep only datasets containing
#'   missing values; if `FALSE`, keep only complete-case datasets.
#'   Default `NULL` (no filter).
#'
#' @return A data frame with one row per matching dataset: `dataset`,
#'   `task`, `source_package`, `n_row`, `n_col`, `has_missing`, and
#'   `highdim`.
#' @export
#' @examples
#' biobench_index()
#' biobench_index(outcome = "survival", missing = FALSE)
#' biobench_index(highdim = TRUE)
biobench_index <- function(outcome = NULL,
                            highdim = NULL,
                            highdim_threshold = 20L,
                            source_package = NULL,
                            n_min = NULL,
                            n_max = NULL,
                            missing = NULL) {
  meta <- data.frame(
    dataset = c(
      "breastcancer", "pima2", "dna",
      "bloodstorage", "covidtest", "cmv", "esophca", "indorct", "indometh",
      "laryngoscope", "licorice", "opt", "polyps", "scurvy", "smartpill",
      "streptb", "supraclav", "theoph",
      "lung", "veteran", "pbc", "colon", "flchain", "rotterdam", "gbsg2",
      "crcfes", "crcmondaca", "framingham", "haberman", "heartfailure",
      "highriskpreg", "metabric", "tobaccomorocco",
      "bmt", "drug6mp", "larynx", "kidney", "std", "channing", "mitrace",
      "respiratory", "toenail", "stroke", "pbc3", "melanoma", "paquid",
      "birthwt", "anorexia", "aidsdelay", "agefat", "phosphate",
      "icu", "glow500", "myopia", "nhanes", "polypharm", "chdage",
      "burn1000", "support", "erspc", "bmtcrr", "eprchd", "nwtsco"
    ),
    task = c(
      "classification", "classification", "classification",
      "survival", "classification", "survival", "classification",
      "classification", "regression", "regression", "classification",
      "classification", "regression", "classification", "regression",
      "classification", "survival",
      "regression",
      "survival", "survival", "survival", "survival", "survival",
      "survival", "survival",
      "survival", "survival", "survival", "classification", "survival",
      "classification", "survival", "classification",
      "survival", "survival", "survival", "survival", "survival",
      "survival", "survival",
      "classification", "classification", "survival", "survival",
      "survival", "survival",
      "regression", "regression", "regression", "regression", "regression",
      "classification", "classification", "classification",
      "classification", "classification", "classification",
      "classification",
      "survival", "survival", "survival", "survival", "survival"
    ),
    source_package = c(
      "mlbench", "mlbench", "mlbench",
      rep("medicaldata", 15),
      rep("survival", 6),
      "TH.data",
      rep("biostatlab", 8),
      rep("KMsurv", 6),
      "timereg",
      rep("HSAUR3", 2),
      rep("pec", 2),
      rep("riskRegression", 2),
      rep("MASS", 2),
      "boot",
      rep("HSAUR3", 2),
      rep("aplore3", 7),
      rep("casebase", 4),
      "addhazard"
    ),
    stringsAsFactors = FALSE
  )

  stats <- do.call(rbind, lapply(meta$dataset, function(nm) {
    e <- new.env()
    utils::data(list = nm, package = "biobench", envir = e)
    d <- get(nm, envir = e)
    data.frame(n_row = nrow(d), n_col = ncol(d), has_missing = anyNA(d))
  }))

  out <- cbind(meta, stats)
  out$highdim <- out$n_col > highdim_threshold

  if (!is.null(outcome)) {
    outcome <- match.arg(outcome, c("classification", "regression", "survival"),
                          several.ok = TRUE)
    out <- out[out$task %in% outcome, ]
  }
  if (!is.null(highdim)) {
    out <- out[out$highdim == highdim, ]
  }
  if (!is.null(source_package)) {
    out <- out[out$source_package %in% source_package, ]
  }
  if (!is.null(n_min)) {
    out <- out[out$n_row >= n_min, ]
  }
  if (!is.null(n_max)) {
    out <- out[out$n_row <= n_max, ]
  }
  if (!is.null(missing)) {
    out <- out[out$has_missing == missing, ]
  }

  rownames(out) <- NULL
  out
}
