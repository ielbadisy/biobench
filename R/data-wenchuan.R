#' PTSD symptoms of Wenchuan earthquake survivors (PCL-C, 17 items)
#'
#' Answers of 362 adult survivors of the 2008 Wenchuan earthquake in China
#' to the 17 items of the PTSD Checklist, civilian version (PCL-C), each
#' scored on a 5-point Likert scale. Used by McNally et al. (2015) for a
#' network analysis of PTSD symptoms; also suited to reliability,
#' factor analysis and item response models for ordinal items.
#' Task: other (psychometrics). 22 item answers are missing (`NA`); 344
#' respondents have complete answers.
#'
#' @format A data frame with 362 rows (respondents) and 17 integer
#'   variables, each scored 1 (not at all), 2 (a little bit), 3
#'   (moderately), 4 (quite a bit) or 5 (extremely). In the past month,
#'   how much were you bothered by:
#' \describe{
#'   \item{intrusion}{repeated, disturbing memories, thoughts or images of
#'     a stressful experience}
#'   \item{dreams}{repeated, disturbing dreams of it}
#'   \item{flash}{suddenly acting or feeling as if it were happening again}
#'   \item{upset}{feeling very upset when something reminded you of it}
#'   \item{physior}{physical reactions (heart pounding, trouble breathing,
#'     sweating) when something reminded you of it}
#'   \item{avoidth}{avoiding thinking or talking about it, or having
#'     feelings related to it}
#'   \item{avoidact}{avoiding activities or situations that reminded you of
#'     it}
#'   \item{amnesia}{trouble remembering important parts of it}
#'   \item{lossint}{loss of interest in activities you used to enjoy}
#'   \item{distant}{feeling distant or cut off from other people}
#'   \item{numb}{feeling emotionally numb}
#'   \item{future}{feeling as if your future will somehow be cut short}
#'   \item{sleep}{trouble falling or staying asleep}
#'   \item{anger}{feeling irritable or having angry outbursts}
#'   \item{concen}{difficulty concentrating}
#'   \item{hyper}{being "super-alert", watchful or on guard}
#'   \item{startle}{feeling jumpy or easily startled}
#' }
#' @references McNally, R. J., Robinaugh, D. J., Wu, G. W. Y., Wang, L.,
#'   Deserno, M. K., & Borsboom, D. (2015). Mental disorders as causal
#'   systems: a network approach to posttraumatic stress disorder.
#'   \emph{Clinical Psychological Science}, 3(6), 836-849.
#'   \doi{10.1177/2167702614553230}
#'
#'   Mair, P. (2018). \emph{Modern Psychometrics with R}. Springer.
#' @source R package \pkg{MPsychoR} (`Wenchuan`, GPL-2), copied unchanged.
#'   Original data: McNally et al. (2015).
"wenchuan"
