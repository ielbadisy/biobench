#' BCG vaccine against tuberculosis: 13 trials for meta-analysis
#'
#' Results of 13 controlled trials of the Bacillus Calmette-Guerin (BCG)
#' vaccine against tuberculosis, as 2x2 tables of TB cases by arm, with the
#' absolute latitude of the study site and the allocation method. The
#' classic dataset for random-effects meta-analysis of risk ratios and for
#' meta-regression (the effect grows with distance from the equator).
#' Task: other (meta-analysis).
#'
#' @format A data frame with 13 rows (trials) and 9 variables:
#' \describe{
#'   \item{trial}{Trial number, 1 to 13.}
#'   \item{author}{Author(s) of the trial report.}
#'   \item{year}{Publication year (1948 to 1980).}
#'   \item{tpos, tneg}{Vaccinated group: number with and without
#'     tuberculosis.}
#'   \item{cpos, cneg}{Control (unvaccinated) group: number with and
#'     without tuberculosis.}
#'   \item{ablat}{Absolute latitude of the study location, degrees.}
#'   \item{alloc}{Allocation method: `"random"`, `"alternate"` or
#'     `"systematic"`.}
#' }
#' @references Colditz, G. A., Brewer, T. F., Berkey, C. S., Wilson, M.
#'   E., Burdick, E., Fineberg, H. V., & Mosteller, F. (1994). Efficacy of
#'   BCG vaccine in the prevention of tuberculosis: meta-analysis of the
#'   published literature. \emph{JAMA}, 271(9), 698-702.
#'   \doi{10.1001/jama.1994.03510330076038}
#'
#'   Berkey, C. S., Hoaglin, D. C., Mosteller, F., & Colditz, G. A. (1995).
#'   A random-effects regression model for meta-analysis. \emph{Statistics
#'   in Medicine}, 14(4), 395-411. \doi{10.1002/sim.4780140406}
#' @source R package \pkg{metadat} (`dat.bcg`, GPL >= 2), copied
#'   unchanged. Original data: Colditz et al. (1994).
"bcg"
