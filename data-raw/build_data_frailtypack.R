# Build biobench data/readmission.rda from frailtypack (CRAN, GPL >= 2).
#
# readmission: rehospitalizations after surgery in 403 colorectal cancer
# patients (Gonzalez et al. 2005), the standard example for recurrent
# events with a terminal event (death). Kept in long counting-process
# form, one row per gap between readmissions. t.start and t.stop are
# renamed t_start and t_stop, death is stored as an integer, and the
# Charlson level "3" is relabelled "3+" since it codes an index of 3 or
# more.
# Run interactively: source("data-raw/build_data_frailtypack.R")

source("data-raw/tidy_helpers.R")
data(list = "readmission", package = "frailtypack")

readmission <- rename_cols(readmission, c(t_start = "t.start", t_stop = "t.stop"))
readmission$death <- as.integer(readmission$death)
levels(readmission$charlson)[levels(readmission$charlson) == "3"] <- "3+"
rownames(readmission) <- NULL

usethis::use_data(readmission, overwrite = TRUE, compress = "xz")
