#' Deaths from lung diseases in the UK, 1974 to 1979
#'
#' Monthly deaths from bronchitis, emphysema and asthma in the United
#' Kingdom, January 1974 to December 1979, in total and by sex. A short
#' seasonal health series with a strong winter peak, used to teach
#' decomposition, exponential smoothing, seasonal ARIMA and outbreak
#' detection. Regression (time series).
#'
#' These are the `ldeaths`, `mdeaths` and `fdeaths` series of the R
#' `datasets` package, stored as a data frame. Rebuild the monthly series
#' with `ts(respdeaths$deaths, start = c(1974, 1), frequency = 12)`.
#'
#' @format A data frame with 72 rows (months) and 5 variables:
#' \describe{
#'   \item{year, month}{Calendar year (1974 to 1979) and month (1 to 12).}
#'   \item{deaths}{Deaths, both sexes (`ldeaths`).}
#'   \item{male}{Deaths in men (`mdeaths`).}
#'   \item{female}{Deaths in women (`fdeaths`).}
#' }
#' @references Diggle, P. J. (1990). \emph{Time Series: A Biostatistical
#'   Introduction}. Oxford University Press, table A.3.
#' @source R package \pkg{datasets} (`ldeaths`, `mdeaths`, `fdeaths`),
#'   part of R (GPL-2 | GPL-3). Original data: Diggle (1990).
"respdeaths"
