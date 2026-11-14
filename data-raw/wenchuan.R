# wenchuan: copied from the R package MPsychoR (`Wenchuan`, GPL-2).
# Original source: McNally, R. J., Robinaugh, D. J., Wu, G. W. Y., Wang,
# L., Deserno, M. K. and Borsboom, D. (2015). Mental disorders as causal
# systems: a network approach to posttraumatic stress disorder. Clinical
# Psychological Science, 3(6), 836-849. Values unchanged.
# Run: source("data-raw/wenchuan.R")

e <- new.env()
utils::data(list = "Wenchuan", package = "MPsychoR", envir = e)
wenchuan <- get("Wenchuan", envir = e)
stopifnot(nrow(wenchuan) == 362, ncol(wenchuan) == 17)
usethis::use_data(wenchuan, overwrite = TRUE, compress = "xz")
