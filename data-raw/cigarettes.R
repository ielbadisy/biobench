# cigarettes: copied from the R package AER (`CigarettesSW`, GPL-2 | GPL-3).
# Original source: online complements to Stock, J. H. and Watson, M. W.
# (2007). Introduction to Econometrics, 2nd ed. Addison Wesley. State
# tax and sales data. Values unchanged.
# Run: source("data-raw/cigarettes.R")

e <- new.env()
utils::data(list = "CigarettesSW", package = "AER", envir = e)
cigarettes <- get("CigarettesSW", envir = e)
stopifnot(nrow(cigarettes) == 96, ncol(cigarettes) == 9)
usethis::use_data(cigarettes, overwrite = TRUE, compress = "xz")
