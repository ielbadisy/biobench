#' Psychiatric diagnoses of 30 patients by six raters
#'
#' Nominal psychiatric diagnoses of 30 patients, each diagnosed by six
#' psychiatrists, from Fleiss (1971), where they illustrate kappa for many
#' raters. In the source, each patient was rated by a different set of six
#' psychiatrists drawn from a larger pool, so the columns are rating slots,
#' not the same six people: Fleiss' kappa (which allows this) fits, kappas
#' that assume fixed raters do not. Task: other (rater agreement).
#'
#' @format A data frame with 30 rows (patients) and 6 variables,
#'   `rater1` to `rater6`, each a factor with the same five levels:
#'   `"1. Depression"`, `"2. Personality Disorder"`, `"3. Schizophrenia"`,
#'   `"4. Neurosis"`, `"5. Other"`.
#' @references Fleiss, J. L. (1971). Measuring nominal scale agreement
#'   among many raters. \emph{Psychological Bulletin}, 76(5), 378-382.
#'   \doi{10.1037/h0031619}
#' @source R package \pkg{irr} (`diagnoses`, GPL >= 2). Change: the six
#'   columns share the same five levels (`rater6` lacked level 1, which no
#'   patient received from that slot); values unchanged. Original data:
#'   Fleiss (1971).
"diagnoses"
