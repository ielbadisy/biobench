# healthspend: copied unchanged from the R package panglm (MIT licence, version
# 1.7.1, https://github.com/ielbadisy/panglm), where it is built by
# data-raw/healthspend.R from the original public sources (see ?healthspend for the
# sources, their licences and the required attribution).
# Run: source("data-raw/healthspend.R")

stopifnot(utils::packageVersion("panglm") >= "1.7.1")
e <- new.env()
utils::data(list = "healthspend", package = "panglm", envir = e)
healthspend <- e$healthspend
stopifnot(is.data.frame(healthspend))
usethis::use_data(healthspend, overwrite = TRUE, compress = "xz")
