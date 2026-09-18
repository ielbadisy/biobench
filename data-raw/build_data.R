# Build biobench data/*.rda from upstream source packages.
# Run interactively: source("data-raw/build_data.R")

# mlbench --------------------------------------------------------------
data("BreastCancer", package = "mlbench")
breastcancer <- BreastCancer

data("PimaIndiansDiabetes2", package = "mlbench")
pima2 <- PimaIndiansDiabetes2

data("DNA", package = "mlbench")
dna <- DNA

# medicaldata ------------------------------------------------------------
data("blood_storage", package = "medicaldata")
bloodstorage <- blood_storage

data("covid_testing", package = "medicaldata")
covidtest <- covid_testing

data("cytomegalovirus", package = "medicaldata")
cmv <- cytomegalovirus

data("esoph_ca", package = "medicaldata")
esophca <- esoph_ca

data("indo_rct", package = "medicaldata")
indorct <- indo_rct

data("indometh", package = "medicaldata")

data("laryngoscope", package = "medicaldata")

data("licorice_gargle", package = "medicaldata")
licorice <- licorice_gargle

data("opt", package = "medicaldata")

data("polyps", package = "medicaldata")

data("scurvy", package = "medicaldata")

data("smartpill", package = "medicaldata")

data("strep_tb", package = "medicaldata")
streptb <- strep_tb

data("supraclavicular", package = "medicaldata")
supraclav <- supraclavicular

data("theoph", package = "medicaldata")

# survival -----------------------------------------------------------
# lung/veteran/pbc/colon/flchain/rotterdam are lazy-loaded on attach, not
# via data(), since they share .rda files with other survival datasets.
library(survival)
lung <- lung
veteran <- veteran
pbc <- pbc
colon <- colon
flchain <- flchain
rotterdam <- rotterdam

# TH.data ----------------------------------------------------------------
data("GBSG2", package = "TH.data")
gbsg2 <- GBSG2

# save ---------------------------------------------------------------------
usethis::use_data(
  breastcancer, pima2, dna,
  bloodstorage, covidtest, cmv, esophca, indorct, indometh, laryngoscope,
  licorice, opt, polyps, scurvy, smartpill, streptb, supraclav, theoph,
  lung, veteran, pbc, colon, flchain, rotterdam,
  gbsg2,
  overwrite = TRUE, compress = "xz"
)
