# biobench (development version)

## New

* `melgide` (Gide et al. 2019, 75 patients) and `melmsk` (Samstein et al. 2019,
  320 melanoma patients): overall survival under immune checkpoint blockade,
  from cBioPortal (ODbL 1.0). `biobench_index()` lists their source as
  `"cbioportal"`.

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
