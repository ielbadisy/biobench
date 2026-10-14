# Build biobench data/*.rda for the last three datasets carried over from
# biostatlab before it was archived. dpb and duodenal are read from the
# CSVs reconstructed from Peace and Chen (2010), Tables 3.1 and 3.2, kept
# alongside this script. epilepsy comes from HSAUR3 (identical to the
# HSAUR2 copy biostatlab used). biostatlab's simulated cardio dataset was
# excluded (biobench holds real data only).
# Run interactively: source("data-raw/build_data_clinicaltrials.R")

dpb <- read.csv("data-raw/diastolic_blood_pressure_trial.csv")
dpb$TRT <- factor(dpb$TRT)
dpb$Sex <- factor(dpb$Sex)

duodenal <- read.csv("data-raw/duodenal_ulcer_trial_raw_reconstructed.csv")
duodenal$TRT <- factor(duodenal$TRT,
                       levels = c("Placebo", "400mg C", "800mg C", "1600mg C"))
duodenal$Healing_Time <- factor(duodenal$Healing_Time)

library(HSAUR3)
data(list = "epilepsy", package = "HSAUR3")

usethis::use_data(dpb, duodenal, epilepsy, overwrite = TRUE, compress = "xz")
