# Write untouched source copies of three datasets to inst/extdata, for
# teaching data import and cleaning. The cleaned versions are in data/.
# Run interactively: source("data-raw/build_extdata.R")

library(biostatlab)

write.csv(high_risk_pregnancy, "inst/extdata/highriskpreg_raw.csv", row.names = FALSE)
write.csv(framingham, "inst/extdata/framingham_raw.csv", row.names = FALSE)
write.csv(tobacco_morocco, "inst/extdata/tobaccomorocco_raw.csv", row.names = FALSE)
