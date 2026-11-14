#' Road casualties in Great Britain and the 1983 seat-belt law
#'
#' Monthly totals of car drivers killed or seriously injured in Great
#' Britain, January 1969 to December 1984. Wearing front seat belts became
#' compulsory on 31 January 1983 (`law` is 1 from February 1983). The
#' classic interrupted time series of a public-health intervention, with
#' traffic volume and petrol price as covariates. Regression (time series).
#'
#' This is the `Seatbelts` series of the R `datasets` package, stored as a
#' data frame with explicit `year` and `month`. Rebuild the monthly series
#' with `ts(seatbelts[, -(1:2)], start = c(1969, 1), frequency = 12)`.
#'
#' @format A data frame with 192 rows (months) and 10 variables:
#' \describe{
#'   \item{year, month}{Calendar year (1969 to 1984) and month (1 to 12).}
#'   \item{DriversKilled}{Car drivers killed.}
#'   \item{drivers}{Car drivers killed or seriously injured.}
#'   \item{front}{Front-seat passengers killed or seriously injured.}
#'   \item{rear}{Rear-seat passengers killed or seriously injured.}
#'   \item{kms}{Distance driven (unit not stated by the source; an index of
#'     traffic volume).}
#'   \item{PetrolPrice}{Petrol price (real terms, source units).}
#'   \item{VanKilled}{Drivers of light goods vehicles killed.}
#'   \item{law}{Seat-belt law in force, 0/1.}
#' }
#' @references Harvey, A. C., & Durbin, J. (1986). The effects of seat
#'   belt legislation on British road casualties: a case study in
#'   structural time series modelling. \emph{Journal of the Royal
#'   Statistical Society, Series A}, 149(3), 187-227.
#'   \doi{10.2307/2981553}
#' @source R package \pkg{datasets} (`Seatbelts`), part of R (GPL-2 |
#'   GPL-3). Original data: Harvey and Durbin (1986).
"seatbelts"
