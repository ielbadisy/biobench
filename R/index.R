#' Index of datasets included in biobench
#'
#' Returns a summary table of every dataset shipped in the package,
#' including its task type, dimensions, missingness, and source package.
#' Optional arguments filter the table down to datasets matching given
#' criteria, so a benchmark suite can be assembled programmatically, e.g.
#' `biobenchindex(outcome = "survival", highdim = FALSE)`.
#'
#' @param outcome Character vector, one or more of `"classification"`,
#'   `"binary"`, `"regression"`, `"survival"`, `"other"`. If given, only
#'   datasets with a matching task are returned. `"binary"` is an alias for
#'   `"classification"`; note that this task also covers the two multiclass
#'   datasets (`dna`, `miceprotein`). `"other"` marks datasets made for
#'   other analyses (meta-analysis, diagnostic accuracy, rater agreement,
#'   psychometrics, reference tables), usually with no single outcome
#'   column. Default `NULL` (no filter).
#' @param highdim Logical. If `TRUE`, keep only high-dimensional datasets
#'   (more than `highdim_threshold` columns, or at least as many columns as
#'   rows); if `FALSE`, keep only low-dimensional ones. Default `NULL`
#'   (no filter).
#' @param highdim_threshold Integer number of columns above which a
#'   dataset is considered high-dimensional regardless of its number of
#'   rows. Default `100`, so ordinary clinical datasets with a few dozen
#'   covariates are not flagged.
#' @param source_package Character vector filtering on the upstream
#'   package a dataset was sourced from (`"mlbench"`, `"medicaldata"`,
#'   `"survival"`, `"TH.data"`, `"biobench"`, `"KMsurv"`, `"timereg"`,
#'   `"HSAUR3"`, `"pec"`, `"riskRegression"`, `"MASS"`, `"boot"`,
#'   `"aplore3"`, `"casebase"`, `"addhazard"`, `"cbioportal"`,
#'   `"frailtypack"`, `"uci"`, `"geo"`, `"datasets"`, `"panglm"`, `"CEACT"`, `"metadat"`). Default
#'   `NULL` (no filter). `"biobench"` marks datasets curated directly in
#'   biobench from their original publications, with no upstream R package;
#'   the former label `"biostatlab"` is still accepted, with a warning.
#' @param n_min Integer, minimum number of rows required. Default `NULL`.
#' @param n_max Integer, maximum number of rows allowed. Default `NULL`.
#' @param missing Logical. If `TRUE`, keep only datasets containing
#'   missing values; if `FALSE`, keep only complete-case datasets.
#'   Default `NULL` (no filter).
#'
#' @return A data frame with one row per matching dataset: `dataset`,
#'   `task`, `outcome_var`, `source_package`, `n_row`, `n_col`,
#'   `has_missing`, and `highdim`. `outcome_var` names the outcome column(s)
#'   given in the dataset's help page: one column for classification and
#'   regression, `"time, event"` for survival (for competing risks the event
#'   column holds the cause, for `readmission` the gap start, stop and event
#'   columns). It is `NA` when the help page does not identify a single
#'   outcome.
#' @export
#' @examples
#' biobenchindex()
#' biobenchindex(outcome = "survival", missing = FALSE)
#' biobenchindex(highdim = TRUE)
biobenchindex <- function(outcome = NULL,
                            highdim = NULL,
                            highdim_threshold = 100L,
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
      "burn1000", "support", "erspc", "bmtcrr", "eprchd", "nwtsco",
      "dpb", "duodenal", "epilepsy", "melgide", "melmsk", "readmission",
      "melliu", "arthritis", "miceprotein", "tcgaluad", "geolung"
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
      "survival", "survival", "survival", "survival", "survival",
      "regression", "classification", "regression",
      "survival", "survival", "survival",
      "survival", "classification", "classification", "survival",
      "classification"
    ),
    source_package = c(
      "mlbench", "mlbench", "mlbench",
      rep("medicaldata", 15),
      rep("survival", 6),
      "TH.data",
      rep("biobench", 8),
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
      "addhazard",
      rep("biobench", 2),
      "HSAUR3",
      rep("cbioportal", 2),
      "frailtypack",
      "cbioportal",
      "biobench", "uci", "cbioportal", "geo"
    ),
    stringsAsFactors = FALSE
  )

  outcome_vars <- c(
    breastcancer = "Class", pima2 = "diabetes", dna = "Class",
    bloodstorage = "TimeToRecurrence, Recurrence", covidtest = "result",
    cmv = "time.to.cmv, cmv", esophca = "ncases, ncontrols",
    indorct = "outcome", indometh = "conc", laryngoscope = NA,
    licorice = NA, opt = "Preg.ended...37.wk", polyps = NA, scurvy = NA,
    smartpill = NA, streptb = NA, supraclav = NA, theoph = "conc",
    lung = "time, status", veteran = "time, status", pbc = "time, status",
    colon = "time, status", flchain = "futime, death",
    rotterdam = "dtime, death", gbsg2 = "time, cens",
    crcfes = "time, event", crcmondaca = "time, status",
    framingham = "time, status", haberman = "survival_status",
    heartfailure = "time, DEATH_EVENT", highriskpreg = "risk_level",
    metabric = "overall_survival_months, overall_survival",
    tobaccomorocco = "cigar_use",
    bmt = "t2, d3", drug6mp = NA, larynx = "time, delta",
    kidney = "time, delta", std = "time, rinfct", channing = "time, death",
    mitrace = "time, status", respiratory = "status", toenail = "outcome",
    stroke = "time, status", pbc3 = "days, status",
    melanoma = "time, status", paquid = "time, status",
    birthwt = "bwt", anorexia = "Postwt", aidsdelay = "y", agefat = "fat",
    phosphate = NA,
    icu = "sta", glow500 = "fracture", myopia = "myopic", nhanes = "obese",
    polypharm = "polypharmacy", chdage = "chd", burn1000 = "death",
    support = "d.time, death", erspc = "Follow.Up.Time, DeadOfPrCa",
    bmtcrr = "ftime, Status", eprchd = "time, status",
    nwtsco = "tsur, dead",
    dpb = "DBP5", duodenal = "Healed_Week4", epilepsy = "seizure.rate",
    melgide = "time, status", melmsk = "time, status",
    readmission = "t_start, t_stop, event",
    melliu = "time, status", arthritis = "status", miceprotein = "class",
    tcgaluad = "time, status", geolung = "tissue"
  )
  # Datasets added from biobench 0.4.0 on, one row each: name, task,
  # source package, outcome column(s).
  more <- matrix(c(
    "seatbelts", "regression", "datasets", "DriversKilled",
    "respdeaths", "regression", "datasets", "deaths",
    "healthspend", "regression", "panglm", "chepc",
    "medicaid", "regression", "panglm", "uninsadult",
    "trialcea", "regression", "CEACT", "qaly",
    "bcg", "other", "metadat", NA
  ), ncol = 4, byrow = TRUE)
  meta <- rbind(meta, data.frame(dataset = more[, 1], task = more[, 2],
                                 source_package = more[, 3],
                                 stringsAsFactors = FALSE))
  more_out <- more[, 4]
  names(more_out) <- more[, 1]
  outcome_vars <- c(outcome_vars, more_out)

  meta <- data.frame(
    meta[c("dataset", "task")],
    outcome_var = unname(outcome_vars[meta$dataset]),
    source_package = meta$source_package,
    stringsAsFactors = FALSE
  )

  stats <- do.call(rbind, lapply(meta$dataset, function(nm) {
    e <- new.env()
    utils::data(list = nm, package = "biobench", envir = e)
    d <- get(nm, envir = e)
    data.frame(n_row = nrow(d), n_col = ncol(d), has_missing = anyNA(d))
  }))

  out <- cbind(meta, stats)
  out$highdim <- out$n_col > highdim_threshold | out$n_col >= out$n_row

  if (!is.null(outcome)) {
    outcome <- match.arg(outcome,
                         c("classification", "binary", "regression", "survival",
                           "other"),
                         several.ok = TRUE)
    outcome[outcome == "binary"] <- "classification"
    out <- out[out$task %in% outcome, ]
  }
  if (!is.null(highdim)) {
    out <- out[out$highdim == highdim, ]
  }
  if (!is.null(source_package)) {
    if ("biostatlab" %in% source_package) {
      warning("source_package \"biostatlab\" is now labelled \"biobench\".",
              call. = FALSE)
      source_package[source_package == "biostatlab"] <- "biobench"
    }
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
