# Build biobench data/*.rda for the 8 well-referenced additions sourced
# from the biostatlab package. Datasets that duplicated an existing,
# smaller biobench dataset (breast/gbsg2, colon_cancer/colon, pbc/pbc,
# pima_diabetes/pima2) and datasets without an identified canonical
# reference (arthritis, diabetes_prediction) or off-domain (kickstarter)
# were excluded. maternal_bangladesh was dropped as an exact row-for-row
# duplicate of high_risk_pregnancy (kept, larger citation trail).
# Run interactively: source("data-raw/build_data_biostatlab.R")

library(biostatlab)

crcfes <- crc_fes
crcmondaca <- crc_mondaca2020
names(crcmondaca)[1] <- "patient_id"
framingham <- framingham
haberman <- haberman
heartfailure <- heart_failure
highriskpreg <- high_risk_pregnancy
metabric <- metabric
tobaccomorocco <- tobacco_morocco

usethis::use_data(
  crcfes, crcmondaca, framingham, haberman, heartfailure, highriskpreg,
  metabric, tobaccomorocco,
  overwrite = TRUE, compress = "xz"
)
