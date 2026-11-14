# auditc: copied from the R package mada (`AuditC`, GPL-2).
# Original source: Kriston, L., Hoelzel, L., Weiser, A.-K., Berner, M. M.
# and Haerter, M. (2008). Meta-analysis: are 3 questions enough to detect
# unhealthy alcohol use? Annals of Internal Medicine, 149(12), 879-888.
# Published aggregate 2x2 counts. Counts stored as integers.
# Run: source("data-raw/auditc.R")

e <- new.env()
utils::data(list = "AuditC", package = "mada", envir = e)
auditc <- get("AuditC", envir = e)
for (v in names(auditc)) auditc[[v]] <- as.integer(auditc[[v]])
stopifnot(nrow(auditc) == 14, identical(names(auditc), c("TP", "FN", "FP", "TN")))
usethis::use_data(auditc, overwrite = TRUE, compress = "xz")
