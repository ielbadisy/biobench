#' WHO World Standard Population (2000-2025)
#'
#' The age distribution of the WHO World Standard Population, used to
#' compute directly age-standardised rates that are comparable across
#' countries and over time. Twenty-one 5-year age groups from 0-4 to 100+,
#' as published percentages and as a standard million. Task: other
#' (reference table for direct standardisation).
#'
#' @format A data frame with 21 rows (age groups) and 5 variables:
#' \describe{
#'   \item{agegroup}{Factor, age group in years, `"0-4"` to `"95-99"` and
#'     `"100+"`, in increasing order.}
#'   \item{agelow, agehigh}{Integer lower and upper age of the group
#'     (`agehigh` is `NA` for 100+).}
#'   \item{percent}{Share of the standard population, percent, as published
#'     (rounded; the 21 values sum to 100.035).}
#'   \item{pop}{Standard million: the group size in a population of
#'     1,000,000 (sums to exactly 1,000,000). Use these as weights.}
#' }
#' @references Ahmad, O. B., Boschi-Pinto, C., Lopez, A. D., Murray, C. J.
#'   L., Lozano, R., & Inoue, M. (2001). \emph{Age Standardization of
#'   Rates: A New WHO Standard}. GPE Discussion Paper Series No. 31. World
#'   Health Organization, Geneva.
#' @source National Cancer Institute, SEER, "World (WHO 2000-2025)
#'   Standard", <https://seer.cancer.gov/stdpopulations/world.who.html>
#'   (read 2026-11-14); SEER adds 1 to the 90-94 count so that the
#'   standard million sums to 1,000,000. Published reference values (US
#'   federal government work, public domain); original: Ahmad et al.
#'   (2001). Curated directly in biobench.
"whostdpop"
