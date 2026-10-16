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

crcfes <- tidy_strings(crc_fes)
# Ras.mutated is the only yes/no column coded in lower case
crcfes$Ras.mutated <- c(no = "No", yes = "Yes")[crcfes$Ras.mutated]
names(crcfes$Ras.mutated) <- NULL
crcmondaca <- crc_mondaca2020
names(crcmondaca)[1] <- "patient_id"
framingham <- framingham
# scl1, scl2, smok (and a few ht, wt, mrw) code missing as -1
for (v in c("ht", "wt", "scl1", "scl2", "mrw", "smok")) {
  framingham[[v]][framingham[[v]] == -1] <- NA
}
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
tobaccomorocco <- tidy_strings(tobacco_morocco)

usethis::use_data(
  crcfes, crcmondaca, framingham, haberman, heartfailure, highriskpreg,
  metabric, tobaccomorocco,
  overwrite = TRUE, compress = "xz"
)
