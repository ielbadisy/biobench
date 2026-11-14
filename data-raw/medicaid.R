# medicaid: copied unchanged from the R package panglm (MIT licence, version
# 1.7.1, https://github.com/ielbadisy/panglm), where it is built by
# data-raw/medicaid.R from the original public sources (see ?medicaid for the
# sources, their licences and the required attribution).
# Run: source("data-raw/medicaid.R")

stopifnot(utils::packageVersion("panglm") >= "1.7.1")
e <- new.env()
utils::data(list = "medicaid", package = "panglm", envir = e)
medicaid <- e$medicaid
stopifnot(is.data.frame(medicaid))
usethis::use_data(medicaid, overwrite = TRUE, compress = "xz")
