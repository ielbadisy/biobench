# Build biobench data/*.rda for 5 real regression datasets, added to
# rebalance biobench's task distribution (regression was the thinnest
# category: 5/46 datasets before this addition).
# boot::urine and boot::nodal were considered but excluded: their studied
# outcome (`r`, presence of crystals / nodal involvement) is binary, i.e.
# a classification target, not a natural regression target.
# Run interactively: source("data-raw/build_data_regression.R")

library(MASS)
birthwt <- birthwt
anorexia <- anorexia

library(boot)
aidsdelay <- aids

library(HSAUR3)
agefat <- agefat
phosphate <- phosphate

usethis::use_data(
  birthwt, anorexia, aidsdelay, agefat, phosphate,
  overwrite = TRUE, compress = "xz"
)
