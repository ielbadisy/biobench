# diagnoses: copied from the R package irr (`diagnoses`, GPL (>= 2)).
# Original source: Fleiss, J. L. (1971). Measuring nominal scale agreement
# among many raters. Psychological Bulletin, 76(5), 378-382.
# Change: all six rater columns get the same five factor levels (rater6
# never used level 1 and lacked it in irr); values unchanged.
# Run: source("data-raw/diagnoses.R")

e <- new.env()
utils::data(list = "diagnoses", package = "irr", envir = e)
diagnoses <- get("diagnoses", envir = e)
lev <- levels(diagnoses$rater1)
stopifnot(length(lev) == 5)
old <- diagnoses
for (v in names(diagnoses)) diagnoses[[v]] <- factor(as.character(diagnoses[[v]]), levels = lev)
stopifnot(nrow(diagnoses) == 30, ncol(diagnoses) == 6,
          identical(lapply(diagnoses, as.character), lapply(old, as.character)))
usethis::use_data(diagnoses, overwrite = TRUE, compress = "xz")
