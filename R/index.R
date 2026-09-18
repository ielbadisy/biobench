#' Index of datasets included in biobench
#'
#' Returns a summary table of every dataset shipped in the package,
#' including its task type, dimensions, and source package.
#'
#' @return A data frame with one row per dataset.
#' @export
#' @examples
#' biobench_index()
biobench_index <- function() {
  meta <- data.frame(
    dataset = c(
      "breastcancer", "pima2", "dna",
      "bloodstorage", "covidtest", "cmv", "esophca", "indorct", "indometh",
      "laryngoscope", "licorice", "opt", "polyps", "scurvy", "smartpill",
      "streptb", "supraclav", "theoph",
      "lung", "veteran", "pbc", "colon", "flchain", "rotterdam", "gbsg2"
    ),
    task = c(
      "classification", "classification", "classification",
      "survival", "classification", "survival", "classification",
      "classification", "regression", "regression", "classification",
      "classification", "regression", "classification", "regression",
      "classification", "survival",
      "regression",
      "survival", "survival", "survival", "survival", "survival",
      "survival", "survival"
    ),
    source_package = c(
      "mlbench", "mlbench", "mlbench",
      rep("medicaldata", 15),
      rep("survival", 6),
      "TH.data"
    ),
    stringsAsFactors = FALSE
  )
  dims <- do.call(rbind, lapply(meta$dataset, function(nm) {
    e <- new.env()
    utils::data(list = nm, package = "biobench", envir = e)
    d <- get(nm, envir = e)
    data.frame(n_row = nrow(d), n_col = ncol(d))
  }))
  cbind(meta, dims)
}
