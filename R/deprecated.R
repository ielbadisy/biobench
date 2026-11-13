#' Deprecated functions
#'
#' `biobench_index()` was renamed to [biobenchindex()] in biobench 0.3.1 and
#' will be removed in a future release.
#'
#' @param ... Arguments passed to [biobenchindex()].
#' @name biobench-deprecated
#' @keywords internal
NULL

#' @rdname biobench-deprecated
#' @export
biobench_index <- function(...) {
  .Deprecated("biobenchindex")
  biobenchindex(...)
}
