# Build biobench data/*.rda for two anti-PD-1 era melanoma cohorts
# released on cBioPortal (https://www.cbioportal.org), whose data are
# under the ODC Open Database License (ODbL) 1.0:
#   - melgide: Gide et al. 2019, Cancer Cell (study mel_iatlas_gide_2019)
#   - melmsk:  Samstein et al. 2019, Nat Genet (study tmb_mskcc_2018),
#              melanoma patients only
# Gide's released PFS status equals "progressive disease" as best response
# (24 of 24), so it is not a time-to-progression outcome and is left out.
# Run interactively: source("data-raw/build_data_cbioportal.R")

library(jsonlite)

fetch_clinical <- function(study) {
  get_type <- function(type) {
    url <- sprintf(paste0("https://www.cbioportal.org/api/studies/%s/clinical-data",
                          "?clinicalDataType=%s&projection=SUMMARY&pageSize=100000"),
                   study, type)
    d <- fromJSON(url)[, c("patientId", "clinicalAttributeId", "value")]
    d <- d[!duplicated(d[, 1:2]), ]
    w <- reshape(d, idvar = "patientId", timevar = "clinicalAttributeId",
                 direction = "wide")
    names(w) <- sub("^value\\.", "", names(w))
    w
  }
  merge(get_type("PATIENT"), get_type("SAMPLE"), by = "patientId", all = TRUE)
}

num <- function(x) suppressWarnings(as.numeric(x))
status01 <- function(x) as.integer(sub(":.*", "", x))

# ---- melgide ----
g <- fetch_clinical("mel_iatlas_gide_2019")
g <- g[order(num(sub("\\D+", "", g$patientId))), ]
melgide <- data.frame(
  time = num(g$OS_MONTHS),
  status = status01(g$OS_STATUS),
  age = num(g$AGE_AT_DIAGNOSIS),
  sex = factor(g$SEX),
  treatment = factor(ifelse(g$ICI_TARGET == "PD1", "anti-PD-1", "ipilimumab + anti-PD-1"),
                     levels = c("anti-PD-1", "ipilimumab + anti-PD-1")),
  drug = factor(g$ICI_RX),
  response = factor(g$RESPONSE, levels = c("Complete Response", "Partial Response",
                                            "Stable Disease", "Progressive Disease")),
  cta_self_neoantigen = num(g$CTA_SELF_NEOANTIGEN),
  splice_neoantigen = num(g$SPLICE_NEOANTIGEN),
  fusion_neoantigen = num(g$FUSION_NEOANTIGEN),
  erv_neoantigen = num(g$ERV_NEOANTIGEN)
)
melgide$drug <- factor(sub("^Pembro$", "Pembrolizumab", as.character(melgide$drug)))

# ---- melmsk ----
s <- fetch_clinical("tmb_mskcc_2018")
s <- s[s$CANCER_TYPE == "Melanoma", ]
s <- s[order(s$patientId), ]
melmsk <- data.frame(
  time = num(s$OS_MONTHS),
  status = status01(s$OS_STATUS),
  age = num(s$AGE_AT_SEQ_REPORT),
  sex = factor(s$SEX),
  subtype = factor(s$CANCER_TYPE_DETAILED),
  treatment = factor(c("PD-1/PDL-1" = "anti-PD-(L)1", CTLA4 = "anti-CTLA-4",
                       Combo = "combination")[s$DRUG_TYPE],
                     levels = c("anti-PD-(L)1", "anti-CTLA-4", "combination")),
  sample_type = factor(s$SAMPLE_TYPE),
  tmb = num(s$TMB_NONSYNONYMOUS),
  tumor_purity = num(s$TUMOR_PURITY),
  gene_panel = factor(s$GENE_PANEL)
)

rownames(melgide) <- rownames(melmsk) <- NULL
usethis::use_data(melgide, melmsk, overwrite = TRUE, compress = "xz")
