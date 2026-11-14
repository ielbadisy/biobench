# bcg: 13 trials of the BCG vaccine against tuberculosis (Colditz et al.
# 1994), copied unchanged from the R package metadat (`dat.bcg`, GPL >= 2).
# Original source: Colditz, G. A. et al. (1994). Efficacy of BCG vaccine in
# the prevention of tuberculosis: meta-analysis of the published
# literature. JAMA, 271(9), 698-702. The counts are published aggregate
# trial results.
# Run: source("data-raw/bcg.R")

bcg <- metadat::dat.bcg
stopifnot(nrow(bcg) == 13, ncol(bcg) == 9)
usethis::use_data(bcg, overwrite = TRUE, compress = "xz")
