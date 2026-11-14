# respdeaths: monthly deaths from bronchitis, emphysema and asthma in the
# UK, January 1974 to December 1979, total and by sex, from the R
# `datasets` package (ldeaths = mdeaths + fdeaths, monthly ts).
#
# Original source: Diggle, P. J. (1990). Time Series: A Biostatistical
# Introduction. Oxford University Press, table A.3. Licence: part of R
# (GPL-2 | GPL-3).
# Run: source("data-raw/respdeaths.R")

ld <- datasets::ldeaths
respdeaths <- data.frame(
  year = as.integer(floor(time(ld) + 1e-8)),
  month = as.integer(cycle(ld)),
  deaths = as.integer(ld),
  male = as.integer(datasets::mdeaths),
  female = as.integer(datasets::fdeaths)
)
stopifnot(nrow(respdeaths) == 72,
          all(respdeaths$deaths == respdeaths$male + respdeaths$female))
usethis::use_data(respdeaths, overwrite = TRUE, compress = "xz")
