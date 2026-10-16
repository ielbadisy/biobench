# Shared cleaning helpers for the data-raw build scripts.

# Trim surrounding whitespace in character and factor columns and turn
# empty strings into NA, so a blank answer is a missing value and not a
# category of its own.
tidy_strings <- function(d) {
  for (v in names(d)) {
    x <- d[[v]]
    if (is.factor(x)) {
      lv <- trimws(levels(x))
      lv[lv == ""] <- NA
      x <- factor(lv[as.integer(x)], levels = unique(lv[!is.na(lv)]))
    } else if (is.character(x)) {
      x <- trimws(x)
      x[x == ""] <- NA
    }
    d[[v]] <- x
  }
  d
}

# Rename columns from a named vector c(new = "old"), failing loudly if an
# old name is absent so an upstream rename cannot slip through.
rename_cols <- function(d, map) {
  stopifnot(all(map %in% names(d)))
  names(d)[match(map, names(d))] <- names(map)
  d
}
