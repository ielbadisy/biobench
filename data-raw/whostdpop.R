# whostdpop: WHO World Standard Population (2000-2025), 5-year age groups
# 0-4 to 100+, as percentages and as a standard million.
#
# Original source: Ahmad, O. B., Boschi-Pinto, C., Lopez, A. D., Murray,
# C. J. L., Lozano, R. and Inoue, M. (2001). Age standardization of rates:
# a new WHO standard. GPE Discussion Paper Series No. 31, World Health
# Organization, Geneva. Values transcribed from the US National Cancer
# Institute SEER page "World (WHO 2000-2025) Standard"
# (https://seer.cancer.gov/stdpopulations/world.who.html, read
# 2026-11-14), which notes that the 90-94 count of the standard million
# was increased by 1 so that the counts sum to 1,000,000. Factual
# reference values published by WHO and by SEER (US federal government,
# public domain).
# Run: source("data-raw/whostdpop.R")

lower <- seq(0L, 100L, by = 5L)
whostdpop <- data.frame(
  agegroup = factor(c(paste0(lower[-21], "-", lower[-21] + 4L), "100+"),
                    levels = c(paste0(lower[-21], "-", lower[-21] + 4L), "100+")),
  agelow = lower,
  agehigh = c(lower[-21] + 4L, NA_integer_),
  percent = c(8.86, 8.69, 8.60, 8.47, 8.22, 7.93, 7.61, 7.15, 6.59, 6.04,
              5.37, 4.55, 3.72, 2.96, 2.21, 1.52, 0.91, 0.44, 0.15, 0.04,
              0.005),
  pop = c(88569L, 86870L, 85970L, 84670L, 82171L, 79272L, 76073L, 71475L,
          65877L, 60379L, 53681L, 45484L, 37187L, 29590L, 22092L, 15195L,
          9097L, 4398L, 1500L, 400L, 50L)
)
stopifnot(nrow(whostdpop) == 21, sum(whostdpop$pop) == 1e6,
          abs(sum(whostdpop$percent) - 100.035) < 1e-8,  # rounded, as published
          all(abs(whostdpop$pop / 1e4 - whostdpop$percent) < 0.006))
usethis::use_data(whostdpop, overwrite = TRUE, compress = "xz")
