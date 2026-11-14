# seatbelts: monthly road casualties in Great Britain, January 1969 to
# December 1984, from the R `datasets` package (Seatbelts, a monthly ts
# with 8 columns). Stored here as a data frame with explicit year and
# month columns; the original column names are kept.
#
# Original source: Harvey, A. C. and Durbin, J. (1986). The effects of
# seat belt legislation on British road casualties: a case study in
# structural time series modelling. Journal of the Royal Statistical
# Society, Series A, 149(3), 187-227. Licence: part of R (GPL-2 | GPL-3).
# Run: source("data-raw/seatbelts.R")

sb <- datasets::Seatbelts
seatbelts <- data.frame(
  year = as.integer(floor(time(sb) + 1e-8)),
  month = as.integer(cycle(sb)),
  as.data.frame(unclass(sb))
)
seatbelts$law <- as.integer(seatbelts$law)
for (v in c("DriversKilled", "drivers", "front", "rear", "kms", "VanKilled")) {
  seatbelts[[v]] <- as.integer(seatbelts[[v]])
}
stopifnot(nrow(seatbelts) == 192,
          all.equal(unname(as.matrix(seatbelts[, -(1:2)])), unname(unclass(sb)),
                    check.attributes = FALSE))
usethis::use_data(seatbelts, overwrite = TRUE, compress = "xz")
