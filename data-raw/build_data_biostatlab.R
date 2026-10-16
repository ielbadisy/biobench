# Build biobench data/*.rda for the 8 well-referenced additions sourced
# from the biostatlab package. Datasets that duplicated an existing,
# smaller biobench dataset (breast/gbsg2, colon_cancer/colon, pbc/pbc,
# pima_diabetes/pima2) and datasets without an identified canonical
# reference (arthritis, diabetes_prediction) or off-domain (kickstarter)
# were excluded. maternal_bangladesh was dropped as an exact row-for-row
# duplicate of high_risk_pregnancy (kept, larger citation trail).
# Run interactively: source("data-raw/build_data_biostatlab.R")

library(biostatlab)
source("data-raw/tidy_helpers.R")

crcfes <- crc_fes
crcmondaca <- crc_mondaca2020
names(crcmondaca)[1] <- "patient_id"
framingham <- framingham
haberman <- haberman
heartfailure <- heart_failure
highriskpreg <- rename_cols(high_risk_pregnancy, c(
  age = "Age", systolic_bp = "Systolic BP", diastolic_bp = "Diastolic",
  blood_sugar = "BS", body_temp = "Body Temp", bmi = "BMI",
  previous_complications = "Previous Complications",
  preexisting_diabetes = "Preexisting Diabetes",
  gestational_diabetes = "Gestational Diabetes",
  mental_health = "Mental Health", heart_rate = "Heart Rate",
  risk_level = "Risk Level"
))
highriskpreg <- tidy_strings(highriskpreg)
highriskpreg$risk_level <- factor(highriskpreg$risk_level, levels = c("Low", "High"))
metabric <- metabric
tobaccomorocco <- tobacco_morocco

usethis::use_data(
  crcfes, crcmondaca, framingham, haberman, heartfailure, highriskpreg,
  metabric, tobaccomorocco,
  overwrite = TRUE, compress = "xz"
)
