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
