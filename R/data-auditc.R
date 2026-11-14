#' AUDIT-C screening for unhealthy alcohol use: 14 accuracy studies
#'
#' True positives, false negatives, false positives and true negatives of
#' the three-item AUDIT-C questionnaire against a reference standard for
#' unhealthy alcohol use, one row per 2x2 table extracted in the
#' meta-analysis of Kriston et al. (2008). The standard example for
#' bivariate (Reitsma) meta-analysis of diagnostic accuracy and the
#' summary ROC curve. Task: other (diagnostic test accuracy meta-analysis).
#'
#' Study labels, thresholds and settings are not included in the source;
#' see Kriston et al. (2008) for them.
#'
#' @format A data frame with 14 rows (2x2 tables) and 4 integer variables:
#' \describe{
#'   \item{TP}{True positives: screen positive, unhealthy alcohol use.}
#'   \item{FN}{False negatives: screen negative, unhealthy alcohol use.}
#'   \item{FP}{False positives: screen positive, no unhealthy alcohol
#'     use.}
#'   \item{TN}{True negatives: screen negative, no unhealthy alcohol use.}
#' }
#' @references Kriston, L., Hoelzel, L., Weiser, A.-K., Berner, M. M., &
#'   Haerter, M. (2008). Meta-analysis: are 3 questions enough to detect
#'   unhealthy alcohol use? \emph{Annals of Internal Medicine}, 149(12),
#'   879-888. \doi{10.7326/0003-4819-149-12-200812160-00007}
#'
#'   Doebler, P., & Holling, H. (2015). Meta-analysis of diagnostic
#'   accuracy with mada. R package vignette.
#' @source R package \pkg{mada} (`AuditC`, GPL-2); counts stored as
#'   integers, values unchanged. Original data: Kriston et al. (2008).
"auditc"
