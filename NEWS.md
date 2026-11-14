# biobench 0.4.0

## New datasets

* `diagnoses`: nominal psychiatric diagnoses of 30 patients by six raters (Fleiss 1971), for multi-rater kappa, copied from irr with harmonised factor levels.
* `medexp`: annual medical expenditure in the RAND Health Insurance Experiment (5,574 observations, 23 percent zeros; Deb and Trivedi 2002), for two-part and GLM cost models, copied from Ecdat.
* `auditc`: 14 diagnostic accuracy 2x2 tables of the AUDIT-C alcohol screening questionnaire (Kriston et al. 2008), for bivariate meta-analysis of sensitivity and specificity, copied from mada.
* `bcg`: 13 BCG vaccine trials against tuberculosis (Colditz et al. 1994), for meta-analysis and meta-regression, copied from metadat. `biobenchindex()` gains the task `"other"` for datasets made for analyses other than prediction.
* `trialcea`: patient-level trial-based cost-effectiveness teaching dataset (500 patients, cost and QALY; Glick et al., Economic Evaluation in Clinical Trials), copied from CEACT.
* `medicaid`: US state-year panel of health insurance coverage and the staggered ACA Medicaid expansion (51 states, 2009-2019; ACS, public domain; KFF expansion dates), copied from panglm.
* `healthspend`: country-year panel of health expenditure, income and population health (193 countries, 2000-2022; World Bank WDI, CC BY 4.0), copied from panglm.
* `respdeaths` (Diggle 1990): monthly deaths from bronchitis, emphysema
  and asthma in the UK, 1974 to 1979, total and by sex, from the R
  `datasets` package (`ldeaths`, `mdeaths`, `fdeaths`).
* `seatbelts` (Harvey and Durbin 1986): monthly road casualties in Great
  Britain, 1969 to 1984, with the January 1983 seat-belt law, from the R
  `datasets` package (`Seatbelts`), as a data frame with `year` and
  `month`. Source label `"datasets"`.

## Data fixes

* `chdage`: the first level of `agegrp` is now `"20-29"`, as in Hosmer,
  Lemeshow and Sturdivant (2013, Table 1.2). aplore3 labels it `"20-39"`
  although it holds ages 20 to 29.
* `highriskpreg`: two impossible values are recoded to `NA`, an age of
  325 years (`study_id` 480) and a BMI of 0 (`study_id` 953). The
  released values remain in `inst/extdata/highriskpreg_raw.csv`.
  Implausible ages (10 to 13, and 55 to 65 with heaping at 60) are kept
  and documented.

## Documentation

* `framingham`: `time` is the last biennial exam attended (2 to 16), not
  years; approximate follow-up in years is `2 * (time - 1)`. `chd`,
  `cva`, `ca` and `oth` flag the cause of death, not incident disease.
  All 18 variables are now documented, with units, from the source code
  sheet.
* `miceprotein`: documents that `ARC_N` and `pS6_N` are identical in the
  released file (kept as released), so the protein correlation matrix
  has rank 76.

# biobench 0.3.2

* `biobenchindex(outcome = "binary")` is accepted as an alias for
  `"classification"`; the allowed values are now documented.
* `biobenchindex()` gains an `outcome_var` column naming each dataset's
  outcome column(s) as given in its help page (`NA` where the help page
  does not identify a single outcome).
* Datasets with no upstream R package (the eleven formerly labelled
  `"biostatlab"`) now have `source_package = "biobench"`;
  `source_package = "biostatlab"` still works, with a warning. The README
  no longer lists biostatlab as a source.

# biobench 0.3.1

* `biobench_index()` is renamed to `biobenchindex()` (glued lowercase). The old name remains as a deprecated wrapper for one release.

| Old | New |
|---|---|
| `biobench_index` | `biobenchindex` |

# biobench 0.3.0

## New

* `melgide` (Gide et al. 2019, 75 patients) and `melmsk` (Samstein et al. 2019,
  320 melanoma patients): overall survival under immune checkpoint blockade,
  from cBioPortal (ODbL 1.0). `biobench_index()` lists their source as
  `"cbioportal"`.
* `melliu` (Liu et al. 2019, 144 patients): overall survival (72 deaths) and
  progression-free survival under anti-PD-1 therapy, with baseline clinical
  variables and whole-exome tumour features (TMB, heterogeneity, purity,
  ploidy), from cBioPortal (ODbL 1.0). Missing ECOG and LDH are left as `NA`.
* `readmission` (Gonzalez et al. 2005, 403 colorectal cancer patients):
  rehospitalizations after surgery with death as a terminal event, in long
  counting-process format, from frailtypack.
* `arthritis` (NHANES 2007-2008, 4856 adults): self-reported arthritis with
  demographic, lifestyle and comorbidity indicators, from biostatlab.
* `miceprotein` (Higuera et al. 2015, 1080 measurements): 77 cortex protein
  levels in a mouse model of Down syndrome, with the released missing values,
  from the UCI Machine Learning Repository (CC BY 4.0).
* `tcgaluad` (TCGA PanCancer Atlas, 566 lung adenocarcinoma samples):
  clinical and genomic summary variables with overall survival, from
  cBioPortal (ODbL 1.0).
* `geolung` (Landi et al. 2008, GEO GSE10072, 107 samples): the 100 most
  variable expression probes in lung adenocarcinoma and paired normal lung.
* `biobench_index()` gains the source labels `"uci"` and `"geo"`.

## Changes

* `biobench_index()`: a dataset is now high-dimensional when it has more
  than `highdim_threshold` columns (default raised from 20 to 100) or at
  least as many columns as rows. Clinical datasets with a few dozen
  covariates (e.g. `nhanes`, `support`, `icu`, `melliu`) are no longer
  flagged.

# biobench 0.2.0

## Breaking changes

* `highriskpreg`: column names are snake_case (`systolic_bp`, `risk_level`, ...)
  instead of the source names with spaces; `risk_level` is a factor (`Low`, `High`).
* `metabric`: `pam50_+_claudin-low_subtype`, `3-gene_classifier_subtype` and
  `hla-g` are renamed `pam50_claudin_low_subtype`, `three_gene_classifier_subtype`
  and `hla_g`.
* `bloodstorage`: `BN+` is renamed `BN_pos`. `cmv`: `C1/C2` is renamed `C1_C2`.

## Data cleaning

* Blank strings are coded `NA` in `highriskpreg`, `tobaccomorocco`, `opt`,
  `metabric`, `crcfes` and `support`.
* `opt`: factor levels that differed only by trailing whitespace are merged.
* `framingham`: missing values coded `-1` in the source are `NA`.
* `crcfes`: `Ras.mutated` is coded `No`/`Yes` like the other indicators.
* A test checks that every dataset has syntactic names and no blank strings.

## New

* Untouched source copies of `highriskpreg`, `framingham` and `tobaccomorocco`
  are installed in `inst/extdata` for teaching data import and cleaning.

# biobench 0.1.0

* First version: 66 curated biomedical datasets and `biobench_index()`.
