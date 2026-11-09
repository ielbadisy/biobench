# Build biobench data/*.rda for three omics panels used in the missknn
# imputation benchmark:
#   - miceprotein: UCI Mice Protein Expression (Higuera et al. 2015),
#                  CC BY 4.0
#   - tcgaluad:    TCGA lung adenocarcinoma PanCancer Atlas clinical and
#                  genomic summary panel (study luad_tcga_pan_can_atlas_2018),
#                  from cBioPortal (ODbL 1.0)
#   - geolung:     GEO GSE10072 (Landi et al. 2008), Affymetrix HG-U133A
#                  expression of lung adenocarcinoma and paired normal lung,
#                  restricted to the 100 probes with the largest variance
# Values are kept as released; only column names and types are tidied.
# Run interactively: source("data-raw/build_data_omics.R")

library(jsonlite)
library(readxl)
source("data-raw/tidy_helpers.R")

# ---- miceprotein ----
zip <- tempfile(fileext = ".zip")
download.file("https://archive.ics.uci.edu/static/public/342/mice+protein+expression.zip",
              zip, mode = "wb", quiet = TRUE)
dir <- tempfile()
unzip(zip, exdir = dir)
xls <- list.files(dir, pattern = "\\.xls$", full.names = TRUE, recursive = TRUE)[1]
miceprotein <- as.data.frame(read_excel(xls))
names(miceprotein)[names(miceprotein) == "MouseID"] <- "mouse_id"
for (v in c("Genotype", "Treatment", "Behavior", "class")) {
  miceprotein[[v]] <- factor(miceprotein[[v]])
}
names(miceprotein)[names(miceprotein) %in% c("Genotype", "Treatment", "Behavior")] <-
  c("genotype", "treatment", "behavior")

# ---- tcgaluad ----
fetch_clinical <- function(study) {
  get_type <- function(type) {
    url <- sprintf(paste0("https://www.cbioportal.org/api/studies/%s/clinical-data",
                          "?clinicalDataType=%s&projection=SUMMARY&pageSize=100000"),
                   study, type)
    d <- fromJSON(url)[, c("sampleId", "patientId", "clinicalAttributeId", "value")[
      c(type == "SAMPLE", TRUE, TRUE, TRUE)]]
    key <- if (type == "SAMPLE") "sampleId" else "patientId"
    d <- d[!duplicated(d[, c(key, "clinicalAttributeId")]), ]
    if (type == "SAMPLE") {
      ids <- unique(d[, c("sampleId", "patientId")])
      d$patientId <- NULL
    }
    w <- reshape(d, idvar = key, timevar = "clinicalAttributeId", direction = "wide")
    names(w) <- sub("^value\\.", "", names(w))
    if (type == "SAMPLE") w <- merge(ids, w, by = "sampleId")
    w
  }
  s <- get_type("SAMPLE")
  p <- get_type("PATIENT")
  p <- p[, c("patientId", setdiff(names(p), names(s)))]
  merge(s, p, by = "patientId")
}

num <- function(x) suppressWarnings(as.numeric(x))
t0 <- fetch_clinical("luad_tcga_pan_can_atlas_2018")
t0 <- t0[order(t0$sampleId), ]
tcgaluad <- data.frame(
  sample_id = t0$sampleId,
  age = num(t0$AGE),
  sex = factor(t0$SEX),
  race = factor(t0$RACE),
  stage = factor(t0$AJCC_PATHOLOGIC_TUMOR_STAGE),
  mutation_count = num(t0$MUTATION_COUNT),
  fraction_genome_altered = num(t0$FRACTION_GENOME_ALTERED),
  aneuploidy_score = num(t0$ANEUPLOIDY_SCORE),
  tmb_nonsynonymous = num(t0$TMB_NONSYNONYMOUS),
  time = num(t0$OS_MONTHS),
  status = as.integer(sub(":.*", "", t0$OS_STATUS))
)
rownames(tcgaluad) <- NULL

# ---- geolung ----
gz <- tempfile(fileext = ".txt.gz")
download.file(paste0("https://ftp.ncbi.nlm.nih.gov/geo/series/GSE10nnn/GSE10072/",
                     "matrix/GSE10072_series_matrix.txt.gz"),
              gz, mode = "wb", quiet = TRUE, method = "curl", extra = '-A "Mozilla/5.0"')
lines <- readLines(gzfile(gz))
field <- function(tag) {
  x <- strsplit(lines[grep(paste0("^!Sample_", tag), lines)], "\t")
  lapply(x, function(r) gsub('^"|"$', "", r[-1]))
}
chars <- field("characteristics_ch1")
value <- function(i) trimws(sub("^[^:]*:", "", chars[[i]]))
title <- field("title")[[1]]
geolung <- data.frame(
  sample_id = field("geo_accession")[[1]],
  patient_id = sub(".*_", "", title),
  tissue = factor(ifelse(grepl("^Normal", title), "Normal", "Tumor"),
                  levels = c("Normal", "Tumor")),
  sex = factor(value(1)),
  age = as.numeric(value(2)),
  smoking = factor(value(3)),
  stage = factor(value(4))
)
b <- grep("^!series_matrix_table_begin", lines)
e <- grep("^!series_matrix_table_end", lines)
expr <- read.delim(text = lines[(b + 1):(e - 1)], check.names = FALSE, quote = "\"")
v <- apply(expr[, -1], 1, stats::var, na.rm = TRUE)
top <- expr[order(v, decreasing = TRUE)[1:100], ]
x <- t(as.matrix(top[, geolung$sample_id]))
colnames(x) <- make.names(top[[1]])
geolung <- data.frame(geolung, x, row.names = NULL)

usethis::use_data(miceprotein, tcgaluad, geolung, overwrite = TRUE, compress = "xz")
