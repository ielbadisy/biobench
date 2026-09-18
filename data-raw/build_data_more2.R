# Build biobench data/*.rda for 12 more real datasets, sourced from
# aplore3 (companion package to Hosmer, Lemeshow & Sturdivant, "Applied
# Logistic Regression", 3rd ed.), casebase, and addhazard. All on CRAN,
# so licensing follows the same clean CRAN norms as every other biobench
# source (as opposed to scraping arbitrary GitHub CSVs of unclear reuse
# rights, e.g. the popular but unlicensed jaredleekatzman/DeepSurv repo).
#
# Excluded duplicates: aplore3::lowbwt (same Baystate Medical Center 1986
# birthweight study as MASS::birthwt, already in biobench, kept the
# bigger one); casebase::brcancer (686 obs, same GBSG cohort as gbsg2,
# fewer columns, kept the bigger one); aplore3::glow11m and other GLOW/
# burn variants (redundant subsets of the same GLOW500/BURN1000 studies).
# casebase::simdat excluded (simulated).
#
# Note: ERSPC and eprchd are documented by their source package as
# reconstructed from published Kaplan-Meier curves rather than raw
# patient-level extracts (same precedent as medicaldata::scurvy and
# medicaldata::strep_tb already in biobench).
# Run interactively: source("data-raw/build_data_more2.R")

library(aplore3)
data(list = c("icu", "glow500", "myopia", "nhanes", "polypharm", "chdage", "burn1000"),
     package = "aplore3")

library(casebase)
data(list = c("support", "ERSPC", "bmtcrr", "eprchd"), package = "casebase")
erspc <- ERSPC

library(addhazard)
data(list = "nwtsco", package = "addhazard")

usethis::use_data(
  icu, glow500, myopia, nhanes, polypharm, chdage, burn1000,
  support, erspc, bmtcrr, eprchd, nwtsco,
  overwrite = TRUE, compress = "xz"
)
