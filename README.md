
# biobench

A curated collection of **real (non-synthetic) biomedical datasets** for
benchmarking classification, regression, and survival machine learning
methods. Every dataset is documented with its canonical literature
reference (`?dataset_name`).

Sourced from published, openly licensed releases, so every dataset
carries clear reuse terms. Most come from CRAN packages:
[mlbench](https://cran.r-project.org/package=mlbench),
[medicaldata](https://higgi13425.github.io/medicaldata/),
[survival](https://cran.r-project.org/package=survival),
[TH.data](https://cran.r-project.org/package=TH.data),
[KMsurv](https://cran.r-project.org/package=KMsurv),
[timereg](https://cran.r-project.org/package=timereg),
[HSAUR3](https://cran.r-project.org/package=HSAUR3),
[pec](https://cran.r-project.org/package=pec),
[riskRegression](https://cran.r-project.org/package=riskRegression),
[MASS](https://cran.r-project.org/package=MASS),
[boot](https://cran.r-project.org/package=boot),
[aplore3](https://cran.r-project.org/package=aplore3),
[casebase](https://cran.r-project.org/package=casebase),
[addhazard](https://cran.r-project.org/package=addhazard), and
[frailtypack](https://cran.r-project.org/package=frailtypack). Eleven
datasets with no upstream R package are curated in biobench itself from
their original publications (source label `"biobench"`): cohorts and
surveys such as `crcfes`, `framingham`, `metabric` and `arthritis`
(NHANES 2007-2008), plus two trials transcribed from Peace and Chen
(2010), *Clinical Trial Data Analysis Using R* (`dpb`, `duodenal`).
Three melanoma immunotherapy cohorts (`melgide`, `melmsk`, `melliu`) and
the TCGA lung adenocarcinoma panel (`tcgaluad`) come from
[cBioPortal](https://www.cbioportal.org) and are under the [ODC Open
Database License](https://opendatacommons.org/licenses/odbl/1-0/) (ODbL)
1.0. `miceprotein` comes from the [UCI Machine Learning
Repository](https://archive.ics.uci.edu/dataset/342) (CC BY 4.0) and
`geolung` from the [Gene Expression
Omnibus](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE10072)
(GSE10072).

## Installation

``` r
# install.packages("remotes")
remotes::install_github("ielbadisy/biobench")
```

## Usage

Datasets load directly via `biobench::<name>`, no `data()` call needed.

``` r
library(biobench)

head(breastcancer)
#>        Id Cl.thickness Cell.size Cell.shape Marg.adhesion Epith.c.size
#> 1 1000025            5         1          1             1            2
#> 2 1002945            5         4          4             5            7
#> 3 1015425            3         1          1             1            2
#> 4 1016277            6         8          8             1            3
#> 5 1017023            4         1          1             3            2
#> 6 1017122            8        10         10             8            7
#>   Bare.nuclei Bl.cromatin Normal.nucleoli Mitoses     Class
#> 1           1           3               1       1    benign
#> 2          10           3               2       1    benign
#> 3           2           3               1       1    benign
#> 4           4           3               7       1    benign
#> 5           1           3               1       1    benign
#> 6          10           9               7       1 malignant

str(gbsg2)
#> 'data.frame':    686 obs. of  10 variables:
#>  $ horTh   : Factor w/ 2 levels "no","yes": 1 2 2 2 1 1 2 1 1 1 ...
#>  $ age     : int  70 56 58 59 73 32 59 65 80 66 ...
#>  $ menostat: Factor w/ 2 levels "Pre","Post": 2 2 2 2 2 1 2 2 2 2 ...
#>  $ tsize   : int  21 12 35 17 35 57 8 16 39 18 ...
#>  $ tgrade  : Ord.factor w/ 3 levels "I"<"II"<"III": 2 2 2 2 2 3 2 2 2 2 ...
#>  $ pnodes  : int  3 7 9 4 1 24 2 1 30 7 ...
#>  $ progrec : int  48 61 52 60 26 0 181 192 0 0 ...
#>  $ estrec  : int  66 77 271 29 65 13 0 25 59 3 ...
#>  $ time    : int  1814 2018 712 1807 772 448 2172 2161 471 2014 ...
#>  $ cens    : int  1 1 1 1 1 1 0 0 1 0 ...
```

## Dataset index

``` r
biobenchindex()
#>           dataset           task                               outcome_var
#> 1    breastcancer classification                                     Class
#> 2           pima2 classification                                  diabetes
#> 3             dna classification                                     Class
#> 4    bloodstorage       survival              TimeToRecurrence, Recurrence
#> 5       covidtest classification                                    result
#> 6             cmv       survival                          time.to.cmv, cmv
#> 7         esophca classification                         ncases, ncontrols
#> 8         indorct classification                                   outcome
#> 9        indometh     regression                                      conc
#> 10   laryngoscope     regression                                      <NA>
#> 11       licorice classification                                      <NA>
#> 12            opt classification                        Preg.ended...37.wk
#> 13         polyps     regression                                      <NA>
#> 14         scurvy classification                                      <NA>
#> 15      smartpill     regression                                      <NA>
#> 16        streptb classification                                      <NA>
#> 17      supraclav       survival                                      <NA>
#> 18         theoph     regression                                      conc
#> 19           lung       survival                              time, status
#> 20        veteran       survival                              time, status
#> 21            pbc       survival                              time, status
#> 22          colon       survival                              time, status
#> 23        flchain       survival                             futime, death
#> 24      rotterdam       survival                              dtime, death
#> 25          gbsg2       survival                                time, cens
#> 26         crcfes       survival                               time, event
#> 27     crcmondaca       survival                              time, status
#> 28     framingham       survival                              time, status
#> 29       haberman classification                           survival_status
#> 30   heartfailure       survival                         time, DEATH_EVENT
#> 31   highriskpreg classification                                risk_level
#> 32       metabric       survival overall_survival_months, overall_survival
#> 33 tobaccomorocco classification                                 cigar_use
#> 34            bmt       survival                                    t2, d3
#> 35        drug6mp       survival                                      <NA>
#> 36         larynx       survival                               time, delta
#> 37         kidney       survival                               time, delta
#> 38            std       survival                              time, rinfct
#> 39       channing       survival                               time, death
#> 40        mitrace       survival                              time, status
#> 41    respiratory classification                                    status
#> 42        toenail classification                                   outcome
#> 43         stroke       survival                              time, status
#> 44           pbc3       survival                              days, status
#> 45       melanoma       survival                              time, status
#> 46         paquid       survival                              time, status
#> 47        birthwt     regression                                       bwt
#> 48       anorexia     regression                                    Postwt
#> 49      aidsdelay     regression                                         y
#> 50         agefat     regression                                       fat
#> 51      phosphate     regression                                      <NA>
#> 52            icu classification                                       sta
#> 53        glow500 classification                                  fracture
#> 54         myopia classification                                    myopic
#> 55         nhanes classification                                     obese
#> 56      polypharm classification                              polypharmacy
#> 57         chdage classification                                       chd
#> 58       burn1000 classification                                     death
#> 59        support       survival                             d.time, death
#> 60          erspc       survival                Follow.Up.Time, DeadOfPrCa
#> 61         bmtcrr       survival                             ftime, Status
#> 62         eprchd       survival                              time, status
#> 63         nwtsco       survival                                tsur, dead
#> 64            dpb     regression                                      DBP5
#> 65       duodenal classification                              Healed_Week4
#> 66       epilepsy     regression                              seizure.rate
#> 67        melgide       survival                              time, status
#> 68         melmsk       survival                              time, status
#> 69    readmission       survival                    t_start, t_stop, event
#> 70         melliu       survival                              time, status
#> 71      arthritis classification                                    status
#> 72    miceprotein classification                                     class
#> 73       tcgaluad       survival                              time, status
#> 74        geolung classification                                    tissue
#>    source_package  n_row n_col has_missing highdim
#> 1         mlbench    699    11        TRUE   FALSE
#> 2         mlbench    768     9        TRUE   FALSE
#> 3         mlbench   3186   181       FALSE    TRUE
#> 4     medicaldata    316    20        TRUE   FALSE
#> 5     medicaldata  15524    17        TRUE   FALSE
#> 6     medicaldata     64    26        TRUE   FALSE
#> 7     medicaldata     88     5       FALSE   FALSE
#> 8     medicaldata    602    33        TRUE   FALSE
#> 9     medicaldata     66     3       FALSE   FALSE
#> 10    medicaldata     99    22        TRUE   FALSE
#> 11    medicaldata    235    19        TRUE   FALSE
#> 12    medicaldata    823   171        TRUE    TRUE
#> 13    medicaldata     22     7        TRUE   FALSE
#> 14    medicaldata     12     8       FALSE   FALSE
#> 15    medicaldata     95    22        TRUE   FALSE
#> 16    medicaldata    107    13        TRUE   FALSE
#> 17    medicaldata    103    17        TRUE   FALSE
#> 18    medicaldata    132     5       FALSE   FALSE
#> 19       survival    228    10        TRUE   FALSE
#> 20       survival    137     8       FALSE   FALSE
#> 21       survival    418    20        TRUE   FALSE
#> 22       survival   1858    16        TRUE   FALSE
#> 23       survival   7874    11        TRUE   FALSE
#> 24       survival   2982    15       FALSE   FALSE
#> 25        TH.data    686    10       FALSE   FALSE
#> 26       biobench    346    19        TRUE   FALSE
#> 27       biobench    471    19        TRUE   FALSE
#> 28       biobench   5209    18        TRUE   FALSE
#> 29       biobench    306     4       FALSE   FALSE
#> 30       biobench    299    13       FALSE   FALSE
#> 31       biobench   1205    13        TRUE   FALSE
#> 32       biobench   1904   693        TRUE    TRUE
#> 33       biobench   3915    27        TRUE   FALSE
#> 34         KMsurv    137    22       FALSE   FALSE
#> 35         KMsurv     21     5       FALSE   FALSE
#> 36         KMsurv     90     5       FALSE   FALSE
#> 37         KMsurv    119     3       FALSE   FALSE
#> 38         KMsurv    877    24       FALSE   FALSE
#> 39         KMsurv    462     6       FALSE   FALSE
#> 40        timereg   1878     9       FALSE   FALSE
#> 41         HSAUR3    555     7       FALSE   FALSE
#> 42         HSAUR3   1908     5       FALSE   FALSE
#> 43            pec    518    15       FALSE   FALSE
#> 44            pec    349    15        TRUE   FALSE
#> 45 riskRegression    205    11       FALSE   FALSE
#> 46 riskRegression   2561     4       FALSE   FALSE
#> 47           MASS    189    10       FALSE   FALSE
#> 48           MASS     72     3       FALSE   FALSE
#> 49           boot    570     6       FALSE   FALSE
#> 50         HSAUR3     25     3       FALSE   FALSE
#> 51         HSAUR3     33     9       FALSE   FALSE
#> 52        aplore3    200    21       FALSE   FALSE
#> 53        aplore3    500    15       FALSE   FALSE
#> 54        aplore3    618    18       FALSE   FALSE
#> 55        aplore3   6482    21        TRUE   FALSE
#> 56        aplore3   3500    14        TRUE   FALSE
#> 57        aplore3    100     4       FALSE   FALSE
#> 58        aplore3   1000     9       FALSE   FALSE
#> 59       casebase   9104    34        TRUE   FALSE
#> 60       casebase 159893     3       FALSE   FALSE
#> 61       casebase    177     7       FALSE   FALSE
#> 62       casebase  16608     3       FALSE   FALSE
#> 63      addhazard   3915    12       FALSE   FALSE
#> 64       biobench     40     9       FALSE   FALSE
#> 65       biobench    703     7       FALSE   FALSE
#> 66         HSAUR3    236     6       FALSE   FALSE
#> 67     cbioportal     75    11        TRUE   FALSE
#> 68     cbioportal    320    10        TRUE   FALSE
#> 69    frailtypack    861    11       FALSE   FALSE
#> 70     cbioportal    144    25        TRUE   FALSE
#> 71       biobench   4856    12       FALSE   FALSE
#> 72            uci   1080    82        TRUE   FALSE
#> 73     cbioportal    566    11        TRUE   FALSE
#> 74            geo    107   107       FALSE    TRUE
```

Filter by task, dimensionality, source, size, or missingness:

``` r
biobenchindex(outcome = "survival", missing = FALSE)
#>         dataset     task                outcome_var source_package  n_row n_col
#> 1       veteran survival               time, status       survival    137     8
#> 2     rotterdam survival               dtime, death       survival   2982    15
#> 3         gbsg2 survival                 time, cens        TH.data    686    10
#> 4  heartfailure survival          time, DEATH_EVENT       biobench    299    13
#> 5           bmt survival                     t2, d3         KMsurv    137    22
#> 6       drug6mp survival                       <NA>         KMsurv     21     5
#> 7        larynx survival                time, delta         KMsurv     90     5
#> 8        kidney survival                time, delta         KMsurv    119     3
#> 9           std survival               time, rinfct         KMsurv    877    24
#> 10     channing survival                time, death         KMsurv    462     6
#> 11      mitrace survival               time, status        timereg   1878     9
#> 12       stroke survival               time, status            pec    518    15
#> 13     melanoma survival               time, status riskRegression    205    11
#> 14       paquid survival               time, status riskRegression   2561     4
#> 15        erspc survival Follow.Up.Time, DeadOfPrCa       casebase 159893     3
#> 16       bmtcrr survival              ftime, Status       casebase    177     7
#> 17       eprchd survival               time, status       casebase  16608     3
#> 18       nwtsco survival                 tsur, dead      addhazard   3915    12
#> 19  readmission survival     t_start, t_stop, event    frailtypack    861    11
#>    has_missing highdim
#> 1        FALSE   FALSE
#> 2        FALSE   FALSE
#> 3        FALSE   FALSE
#> 4        FALSE   FALSE
#> 5        FALSE   FALSE
#> 6        FALSE   FALSE
#> 7        FALSE   FALSE
#> 8        FALSE   FALSE
#> 9        FALSE   FALSE
#> 10       FALSE   FALSE
#> 11       FALSE   FALSE
#> 12       FALSE   FALSE
#> 13       FALSE   FALSE
#> 14       FALSE   FALSE
#> 15       FALSE   FALSE
#> 16       FALSE   FALSE
#> 17       FALSE   FALSE
#> 18       FALSE   FALSE
#> 19       FALSE   FALSE
```

## Using biobench in a benchmark study

biobench’s job is to supply the datasets; any modeling package can
consume them. The example below uses
[funcml](https://cran.r-project.org/package=funcml), a formula-first ML
framework with a `fit()` / `evaluate()` / `compare()` / `tune()` /
`interpret()` interface, to benchmark several learners on one dataset:

``` r
library(funcml)

d <- na.omit(breastcancer)
d$Id <- NULL # identifier column, not a predictor

compare(
  data = d,
  formula = Class ~ .,
  models = c("glm", "ranger", "xgboost"),
  resampling = cv(5),
  metrics = c("accuracy", "auc"),
  seed = 1
)
#> <funcml_compare> task: classification | tuned: FALSE
#>     model   metric   mean     sd n std_error conf_level conf_low conf_high
#> 1     glm accuracy 0.9298 0.0108 5    0.0049       0.95   0.9163    0.9432
#> 2     glm      auc 0.9466 0.0065 5    0.0029       0.95   0.9385    0.9546
#> 3  ranger accuracy 0.9620 0.0119 5    0.0053       0.95   0.9472    0.9768
#> 4  ranger      auc 0.9916 0.0033 5    0.0015       0.95   0.9876    0.9956
#> 5 xgboost accuracy 0.9576 0.0188 5    0.0084       0.95   0.9342    0.9809
#> 6 xgboost      auc 0.9853 0.0118 5    0.0053       0.95   0.9706    1.0000
#>   tuned rank
#> 1 FALSE    3
#> 2 FALSE    3
#> 3 FALSE    1
#> 4 FALSE    1
#> 5 FALSE    2
#> 6 FALSE    2
```

The same recipe scales to a multi-dataset benchmark study: pick datasets
from `biobenchindex()`, pair each with its outcome formula, and loop
`compare()` over them to get one long-format results table.

``` r
benchmark_sets <- list(
  breastcancer = list(formula = Class ~ ., data = d),
  pima2        = list(formula = diabetes ~ ., data = na.omit(pima2)),
  dna          = list(formula = Class ~ ., data = dna)
)

results <- lapply(names(benchmark_sets), function(nm) {
  spec <- benchmark_sets[[nm]]
  res <- compare(
    data = spec$data,
    formula = spec$formula,
    models = c("ranger", "xgboost"),
    resampling = cv(5),
    metrics = "accuracy",
    seed = 1
  )
  cbind(dataset = nm, res$results)
})

do.call(rbind, results)[, c("dataset", "model", "mean", "sd", "rank")]
#>        dataset   model      mean          sd rank
#> 1 breastcancer  ranger 0.9604974 0.014152343    1
#> 2 breastcancer xgboost 0.9575777 0.018819337    2
#> 3        pima2  ranger 0.7779617 0.049728946    1
#> 4        pima2 xgboost 0.7524505 0.028908051    2
#> 5          dna  ranger 0.9526035 0.003243635    2
#> 6          dna xgboost 0.9610783 0.007729777    1
```

`biobenchindex(outcome = "classification", missing = FALSE)` (or
`"regression"` / `"survival"`) is the natural way to select which
datasets go into `benchmark_sets` for a larger study.

## Datasets by task

### Classification (n = 26)

| Dataset          | Description                                                    |     n |   p | Source      |
|------------------|----------------------------------------------------------------|------:|----:|-------------|
| `arthritis`      | Arthritis in NHANES 2007-2008                                  |  4856 |  12 | biobench    |
| `breastcancer`   | Wisconsin breast cancer cytology                               |   699 |  11 | mlbench     |
| `burn1000`       | National Burn Repository mortality                             |  1000 |   9 | aplore3     |
| `chdage`         | Coronary heart disease and age                                 |   100 |   4 | aplore3     |
| `covidtest`      | COVID-19 PCR testing cohort                                    | 15524 |  17 | medicaldata |
| `dna`            | Splice-junction gene sequences                                 |  3186 | 181 | mlbench     |
| `duodenal`       | Duodenal ulcer healing trial                                   |   703 |   7 | biobench    |
| `esophca`        | Esophageal cancer case-control study                           |    88 |   5 | medicaldata |
| `geolung`        | Lung adenocarcinoma and normal lung gene expression (GSE10072) |   107 | 107 | geo         |
| `glow500`        | GLOW osteoporosis fracture risk                                |   500 |  15 | aplore3     |
| `haberman`       | Haberman breast cancer survival                                |   306 |   4 | biobench    |
| `highriskpreg`   | Maternal health risk assessment                                |  1205 |  13 | biobench    |
| `icu`            | ICU mortality                                                  |   200 |  21 | aplore3     |
| `indorct`        | Rectal indomethacin RCT for post-ERCP pancreatitis             |   602 |  33 | medicaldata |
| `licorice`       | Licorice gargle RCT for post-extubation cough                  |   235 |  19 | medicaldata |
| `miceprotein`    | Mouse cortex protein expression (Down syndrome model)          |  1080 |  82 | uci         |
| `myopia`         | Orinda myopia study                                            |   618 |  18 | aplore3     |
| `nhanes`         | NHANES obesity survey extract                                  |  6482 |  21 | aplore3     |
| `opt`            | Periodontal therapy and preterm birth                          |   823 | 171 | medicaldata |
| `pima2`          | Pima Indians diabetes (corrected)                              |   768 |   9 | mlbench     |
| `polypharm`      | Polypharmacy in mental health services                         |  3500 |  14 | aplore3     |
| `respiratory`    | Respiratory illness clinical trial                             |   555 |   7 | HSAUR3      |
| `scurvy`         | James Lind’s scurvy trial (1757)                               |    12 |   8 | medicaldata |
| `streptb`        | Streptomycin RCT for pulmonary tuberculosis (1948)             |   107 |  13 | medicaldata |
| `tobaccomorocco` | Morocco youth tobacco survey                                   |  3915 |  27 | biobench    |
| `toenail`        | Toenail infection clinical trial                               |  1908 |   5 | HSAUR3      |

### Regression (n = 12)

| Dataset        | Description                                     |   n |   p | Source      |
|----------------|-------------------------------------------------|----:|----:|-------------|
| `agefat`       | Age and body fat percentage                     |  25 |   3 | HSAUR3      |
| `aidsdelay`    | AIDS reporting delay in England and Wales       | 570 |   6 | boot        |
| `anorexia`     | Anorexia treatment weight change                |  72 |   3 | MASS        |
| `birthwt`      | Risk factors for low infant birth weight        | 189 |  10 | MASS        |
| `dpb`          | Diastolic blood pressure trial                  |  40 |   9 | biobench    |
| `epilepsy`     | Epilepsy progabide trial                        | 236 |   6 | HSAUR3      |
| `indometh`     | Indomethacin pharmacokinetics                   |  66 |   3 | medicaldata |
| `laryngoscope` | Video vs standard laryngoscope RCT              |  99 |  22 | medicaldata |
| `phosphate`    | Postprandial phosphate levels                   |  33 |   9 | HSAUR3      |
| `polyps`       | Sulindac RCT for familial adenomatous polyposis |  22 |   7 | medicaldata |
| `smartpill`    | SmartPill gastric transit cohort                |  95 |  22 | medicaldata |
| `theoph`       | Theophylline pharmacokinetics                   | 132 |   5 | medicaldata |

### Survival (n = 36)

| Dataset        | Description                                              |      n |   p | Source         |
|----------------|----------------------------------------------------------|-------:|----:|----------------|
| `bloodstorage` | Blood storage duration and prostate cancer recurrence    |    316 |  20 | medicaldata    |
| `bmt`          | Bone marrow transplant for leukemia                      |    137 |  22 | KMsurv         |
| `bmtcrr`       | Bone marrow transplant competing risks                   |    177 |   7 | casebase       |
| `channing`     | Channing House retirement community mortality            |    462 |   6 | KMsurv         |
| `cmv`          | Donor KIR genotype and CMV reactivation                  |     64 |  26 | medicaldata    |
| `colon`        | Colon cancer adjuvant chemotherapy trial                 |   1858 |  16 | survival       |
| `crcfes`       | Fez colorectal cancer cohort                             |    346 |  19 | biobench       |
| `crcmondaca`   | Colorectal cancer genomic cohort (Mondaca et al. 2020)   |    471 |  19 | biobench       |
| `drug6mp`      | 6-MP leukemia remission trial                            |     21 |   5 | KMsurv         |
| `eprchd`       | Estrogen plus progestin and coronary heart disease risk  |  16608 |   3 | casebase       |
| `erspc`        | European Randomized Study of Prostate Cancer Screening   | 159893 |   3 | casebase       |
| `flchain`      | Serum free light chain assay cohort                      |   7874 |  11 | survival       |
| `framingham`   | Framingham Heart Study survival extract                  |   5209 |  18 | biobench       |
| `gbsg2`        | German Breast Cancer Study Group 2                       |    686 |  10 | TH.data        |
| `heartfailure` | Heart failure clinical records                           |    299 |  13 | biobench       |
| `kidney`       | Kidney dialysis catheter infection                       |    119 |   3 | KMsurv         |
| `larynx`       | Larynx cancer survival                                   |     90 |   5 | KMsurv         |
| `lung`         | NCCTG lung cancer survival                               |    228 |  10 | survival       |
| `melanoma`     | Malignant melanoma cohort                                |    205 |  11 | riskRegression |
| `melgide`      | Metastatic melanoma on immune checkpoint blockade (Gide) |     75 |  11 | cbioportal     |
| `melliu`       | Metastatic melanoma on anti-PD-1 therapy (Liu)           |    144 |  25 | cbioportal     |
| `melmsk`       | Melanoma on immune checkpoint blockade at MSK (Samstein) |    320 |  10 | cbioportal     |
| `metabric`     | METABRIC breast cancer cohort                            |   1904 | 693 | biobench       |
| `mitrace`      | TRACE myocardial infarction study                        |   1878 |   9 | timereg        |
| `nwtsco`       | National Wilms Tumor Study                               |   3915 |  12 | addhazard      |
| `paquid`       | Paquid dementia cohort                                   |   2561 |   4 | riskRegression |
| `pbc`          | Mayo Clinic primary biliary cholangitis trial            |    418 |  20 | survival       |
| `pbc3`         | PBC3 multi-center cirrhosis trial                        |    349 |  15 | pec            |
| `readmission`  | Rehospitalizations after colorectal cancer surgery       |    861 |  11 | frailtypack    |
| `rotterdam`    | Rotterdam breast cancer cohort                           |   2982 |  15 | survival       |
| `std`          | STD recurrence cohort                                    |    877 |  24 | KMsurv         |
| `stroke`       | Copenhagen Stroke Study                                  |    518 |  15 | pec            |
| `support`      | SUPPORT critically ill patients                          |   9104 |  34 | casebase       |
| `supraclav`    | Supraclavicular nerve block anesthesia study             |    103 |  17 | medicaldata    |
| `tcgaluad`     | Lung adenocarcinoma (TCGA PanCancer Atlas)               |    566 |  11 | cbioportal     |
| `veteran`      | Veterans’ Administration lung cancer trial               |    137 |   8 | survival       |
