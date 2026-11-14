# medexp: copied from the R package Ecdat (`MedExp`, GPL (>= 2)).
# Original source: Deb, P. and Trivedi, P. K. (2002). The structure of
# demand for health care: latent class versus two-part models. Journal of
# Health Economics, 21(4), 601-625. Data from the RAND Health Insurance
# Experiment, distributed through the Journal of Applied Econometrics data
# archive (http://qed.econ.queensu.ca/jae/). Values unchanged.
# Run: source("data-raw/medexp.R")

e <- new.env()
utils::data(list = "MedExp", package = "Ecdat", envir = e)
medexp <- get("MedExp", envir = e)
stopifnot(nrow(medexp) == 5574, ncol(medexp) == 15)
usethis::use_data(medexp, overwrite = TRUE, compress = "xz")
