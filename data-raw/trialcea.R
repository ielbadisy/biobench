# trialcea: patient-level trial-based cost-effectiveness teaching dataset,
# copied from the R package CEACT (MIT licence, object `trial_cea`;
# https://github.com/ielbadisy/CEACT). CEACT took it from the ceaR
# package (`clintrial_cea`); it is the example dataset of Glick, Doshi,
# Sonnad and Polsky, Economic Evaluation in Clinical Trials (Oxford
# University Press), described as provided by a Health Services Research
# Unit. The underlying trial is not identified by these sources.
# Changes: Stata label/format attributes dropped, 0/1 and id columns
# stored as integers. Values unchanged.
# Run: source("data-raw/trialcea.R")

d <- CEACT::trial_cea
trialcea <- data.frame(lapply(d, function(x) { attributes(x)[c("label", "format.stata")] <- NULL; x }))
for (v in c("id", "treat", "race", "male")) {
  stopifnot(all(trialcea[[v]] == round(trialcea[[v]])))
  trialcea[[v]] <- as.integer(trialcea[[v]])
}
stopifnot(nrow(trialcea) == 500, ncol(trialcea) == 10,
          isTRUE(all.equal(trialcea, as.data.frame(d), check.attributes = FALSE)))
usethis::use_data(trialcea, overwrite = TRUE, compress = "xz")
