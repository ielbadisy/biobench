# Build biobench data/*.rda for a further 13 real datasets sourced from
# KMsurv, timereg, HSAUR3, pec, and riskRegression. Excluded candidates:
# flexsurv::bc (686 obs, same GBSG cohort as gbsg2, smaller column set),
# timereg::melanoma (205x6, same Danish cohort as riskRegression::Melanoma
# 205x11, smaller), Epi::steno2 (explicitly documented as "entirely
# simulated" in its own Rd file), timereg::cd4 and timereg::csl (long-format
# counting-process data with start/stop interval columns, inconsistent
# with biobench's one-row-per-subject convention).
# Run interactively: source("data-raw/build_data_more.R")

library(KMsurv)
data(list = c("bmt", "drug6mp", "larynx", "kidney", "std", "channing"), package = "KMsurv")

library(timereg)
data(list = "TRACE", package = "timereg")
mitrace <- TRACE # named to avoid clashing with base::trace()

library(HSAUR3)
data(list = c("respiratory", "toenail"), package = "HSAUR3")

library(pec)
data(list = c("cost", "Pbc3"), package = "pec")
stroke <- cost
pbc3 <- Pbc3

library(riskRegression)
data(list = c("Melanoma", "Paquid"), package = "riskRegression")
melanoma <- Melanoma
paquid <- Paquid

usethis::use_data(
  bmt, drug6mp, larynx, kidney, std, channing, mitrace,
  respiratory, toenail, stroke, pbc3, melanoma, paquid,
  overwrite = TRUE, compress = "xz"
)
