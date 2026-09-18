
# biobench

A curated collection of **real (non-synthetic) biomedical datasets** for
benchmarking classification, regression, and survival machine learning
methods. Every dataset is documented with its canonical literature
reference (`?dataset_name`).

Sourced from CRAN packages only, so every dataset carries clear reuse
terms: [mlbench](https://cran.r-project.org/package=mlbench),
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
[biostatlab](https://github.com/ielbadisy/biostatlab).

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
biobench_index()
#>           dataset           task source_package  n_row n_col has_missing
#> 1    breastcancer classification        mlbench    699    11        TRUE
#> 2           pima2 classification        mlbench    768     9        TRUE
#> 3             dna classification        mlbench   3186   181       FALSE
#> 4    bloodstorage       survival    medicaldata    316    20        TRUE
#> 5       covidtest classification    medicaldata  15524    17        TRUE
#> 6             cmv       survival    medicaldata     64    26        TRUE
#> 7         esophca classification    medicaldata     88     5       FALSE
#> 8         indorct classification    medicaldata    602    33        TRUE
#> 9        indometh     regression    medicaldata     66     3       FALSE
#> 10   laryngoscope     regression    medicaldata     99    22        TRUE
#> 11       licorice classification    medicaldata    235    19        TRUE
#> 12            opt classification    medicaldata    823   171        TRUE
#> 13         polyps     regression    medicaldata     22     7        TRUE
#> 14         scurvy classification    medicaldata     12     8       FALSE
#> 15      smartpill     regression    medicaldata     95    22        TRUE
#> 16        streptb classification    medicaldata    107    13        TRUE
#> 17      supraclav       survival    medicaldata    103    17        TRUE
#> 18         theoph     regression    medicaldata    132     5       FALSE
#> 19           lung       survival       survival    228    10        TRUE
#> 20        veteran       survival       survival    137     8       FALSE
#> 21            pbc       survival       survival    418    20        TRUE
#> 22          colon       survival       survival   1858    16        TRUE
#> 23        flchain       survival       survival   7874    11        TRUE
#> 24      rotterdam       survival       survival   2982    15       FALSE
#> 25          gbsg2       survival        TH.data    686    10       FALSE
#> 26         crcfes       survival     biostatlab    346    19        TRUE
#> 27     crcmondaca       survival     biostatlab    471    19        TRUE
#> 28     framingham       survival     biostatlab   5209    18       FALSE
#> 29       haberman classification     biostatlab    306     4       FALSE
#> 30   heartfailure       survival     biostatlab    299    13       FALSE
#> 31   highriskpreg classification     biostatlab   1205    13        TRUE
#> 32       metabric       survival     biostatlab   1904   693        TRUE
#> 33 tobaccomorocco classification     biostatlab   3915    27       FALSE
#> 34            bmt       survival         KMsurv    137    22       FALSE
#> 35        drug6mp       survival         KMsurv     21     5       FALSE
#> 36         larynx       survival         KMsurv     90     5       FALSE
#> 37         kidney       survival         KMsurv    119     3       FALSE
#> 38            std       survival         KMsurv    877    24       FALSE
#> 39       channing       survival         KMsurv    462     6       FALSE
#> 40        mitrace       survival        timereg   1878     9       FALSE
#> 41    respiratory classification         HSAUR3    555     7       FALSE
#> 42        toenail classification         HSAUR3   1908     5       FALSE
#> 43         stroke       survival            pec    518    15       FALSE
#> 44           pbc3       survival            pec    349    15        TRUE
#> 45       melanoma       survival riskRegression    205    11       FALSE
#> 46         paquid       survival riskRegression   2561     4       FALSE
#> 47        birthwt     regression           MASS    189    10       FALSE
#> 48       anorexia     regression           MASS     72     3       FALSE
#> 49      aidsdelay     regression           boot    570     6       FALSE
#> 50         agefat     regression         HSAUR3     25     3       FALSE
#> 51      phosphate     regression         HSAUR3     33     9       FALSE
#> 52            icu classification        aplore3    200    21       FALSE
#> 53        glow500 classification        aplore3    500    15       FALSE
#> 54         myopia classification        aplore3    618    18       FALSE
#> 55         nhanes classification        aplore3   6482    21        TRUE
#> 56      polypharm classification        aplore3   3500    14        TRUE
#> 57         chdage classification        aplore3    100     4       FALSE
#> 58       burn1000 classification        aplore3   1000     9       FALSE
#> 59        support       survival       casebase   9104    34       FALSE
#> 60          erspc       survival       casebase 159893     3       FALSE
#> 61         bmtcrr       survival       casebase    177     7       FALSE
#> 62         eprchd       survival       casebase  16608     3       FALSE
#> 63         nwtsco       survival      addhazard   3915    12       FALSE
#>    highdim
#> 1    FALSE
#> 2    FALSE
#> 3     TRUE
#> 4    FALSE
#> 5    FALSE
#> 6     TRUE
#> 7    FALSE
#> 8     TRUE
#> 9    FALSE
#> 10    TRUE
#> 11   FALSE
#> 12    TRUE
#> 13   FALSE
#> 14   FALSE
#> 15    TRUE
#> 16   FALSE
#> 17   FALSE
#> 18   FALSE
#> 19   FALSE
#> 20   FALSE
#> 21   FALSE
#> 22   FALSE
#> 23   FALSE
#> 24   FALSE
#> 25   FALSE
#> 26   FALSE
#> 27   FALSE
#> 28   FALSE
#> 29   FALSE
#> 30   FALSE
#> 31   FALSE
#> 32    TRUE
#> 33    TRUE
#> 34    TRUE
#> 35   FALSE
#> 36   FALSE
#> 37   FALSE
#> 38    TRUE
#> 39   FALSE
#> 40   FALSE
#> 41   FALSE
#> 42   FALSE
#> 43   FALSE
#> 44   FALSE
#> 45   FALSE
#> 46   FALSE
#> 47   FALSE
#> 48   FALSE
#> 49   FALSE
#> 50   FALSE
#> 51   FALSE
#> 52    TRUE
#> 53   FALSE
#> 54   FALSE
#> 55    TRUE
#> 56   FALSE
#> 57   FALSE
#> 58   FALSE
#> 59    TRUE
#> 60   FALSE
#> 61   FALSE
#> 62   FALSE
#> 63   FALSE
```

Filter by task, dimensionality, source, size, or missingness:

``` r
biobench_index(outcome = "survival", missing = FALSE)
#>         dataset     task source_package  n_row n_col has_missing highdim
#> 1       veteran survival       survival    137     8       FALSE   FALSE
#> 2     rotterdam survival       survival   2982    15       FALSE   FALSE
#> 3         gbsg2 survival        TH.data    686    10       FALSE   FALSE
#> 4    framingham survival     biostatlab   5209    18       FALSE   FALSE
#> 5  heartfailure survival     biostatlab    299    13       FALSE   FALSE
#> 6           bmt survival         KMsurv    137    22       FALSE    TRUE
#> 7       drug6mp survival         KMsurv     21     5       FALSE   FALSE
#> 8        larynx survival         KMsurv     90     5       FALSE   FALSE
#> 9        kidney survival         KMsurv    119     3       FALSE   FALSE
#> 10          std survival         KMsurv    877    24       FALSE    TRUE
#> 11     channing survival         KMsurv    462     6       FALSE   FALSE
#> 12      mitrace survival        timereg   1878     9       FALSE   FALSE
#> 13       stroke survival            pec    518    15       FALSE   FALSE
#> 14     melanoma survival riskRegression    205    11       FALSE   FALSE
#> 15       paquid survival riskRegression   2561     4       FALSE   FALSE
#> 16      support survival       casebase   9104    34       FALSE    TRUE
#> 17        erspc survival       casebase 159893     3       FALSE   FALSE
#> 18       bmtcrr survival       casebase    177     7       FALSE   FALSE
#> 19       eprchd survival       casebase  16608     3       FALSE   FALSE
#> 20       nwtsco survival      addhazard   3915    12       FALSE   FALSE
```

## Datasets by task

### Classification (n = 22)

| Dataset          | Description                                        |     n |   p | Source      |
|------------------|----------------------------------------------------|------:|----:|-------------|
| `breastcancer`   | Wisconsin breast cancer cytology                   |   699 |  11 | mlbench     |
| `burn1000`       | National Burn Repository mortality                 |  1000 |   9 | aplore3     |
| `chdage`         | Coronary heart disease and age                     |   100 |   4 | aplore3     |
| `covidtest`      | COVID-19 PCR testing cohort                        | 15524 |  17 | medicaldata |
| `dna`            | Splice-junction gene sequences                     |  3186 | 181 | mlbench     |
| `esophca`        | Esophageal cancer case-control study               |    88 |   5 | medicaldata |
| `glow500`        | GLOW osteoporosis fracture risk                    |   500 |  15 | aplore3     |
| `haberman`       | Haberman breast cancer survival                    |   306 |   4 | biostatlab  |
| `highriskpreg`   | Maternal health risk assessment                    |  1205 |  13 | biostatlab  |
| `icu`            | ICU mortality                                      |   200 |  21 | aplore3     |
| `indorct`        | Rectal indomethacin RCT for post-ERCP pancreatitis |   602 |  33 | medicaldata |
| `licorice`       | Licorice gargle RCT for post-extubation cough      |   235 |  19 | medicaldata |
| `myopia`         | Orinda myopia study                                |   618 |  18 | aplore3     |
| `nhanes`         | NHANES obesity survey extract                      |  6482 |  21 | aplore3     |
| `opt`            | Periodontal therapy and preterm birth              |   823 | 171 | medicaldata |
| `pima2`          | Pima Indians diabetes (corrected)                  |   768 |   9 | mlbench     |
| `polypharm`      | Polypharmacy in mental health services             |  3500 |  14 | aplore3     |
| `respiratory`    | Respiratory illness clinical trial                 |   555 |   7 | HSAUR3      |
| `scurvy`         | James Lind’s scurvy trial (1757)                   |    12 |   8 | medicaldata |
| `streptb`        | Streptomycin RCT for pulmonary tuberculosis (1948) |   107 |  13 | medicaldata |
| `tobaccomorocco` | Morocco youth tobacco survey                       |  3915 |  27 | biostatlab  |
| `toenail`        | Toenail infection clinical trial                   |  1908 |   5 | HSAUR3      |

### Regression (n = 10)

| Dataset        | Description                                     |   n |   p | Source      |
|----------------|-------------------------------------------------|----:|----:|-------------|
| `agefat`       | Age and body fat percentage                     |  25 |   3 | HSAUR3      |
| `aidsdelay`    | AIDS reporting delay in England and Wales       | 570 |   6 | boot        |
| `anorexia`     | Anorexia treatment weight change                |  72 |   3 | MASS        |
| `birthwt`      | Risk factors for low infant birth weight        | 189 |  10 | MASS        |
| `indometh`     | Indomethacin pharmacokinetics                   |  66 |   3 | medicaldata |
| `laryngoscope` | Video vs standard laryngoscope RCT              |  99 |  22 | medicaldata |
| `phosphate`    | Postprandial phosphate levels                   |  33 |   9 | HSAUR3      |
| `polyps`       | Sulindac RCT for familial adenomatous polyposis |  22 |   7 | medicaldata |
| `smartpill`    | SmartPill gastric transit cohort                |  95 |  22 | medicaldata |
| `theoph`       | Theophylline pharmacokinetics                   | 132 |   5 | medicaldata |

### Survival (n = 31)

| Dataset        | Description                                             |      n |   p | Source         |
|----------------|---------------------------------------------------------|-------:|----:|----------------|
| `bloodstorage` | Blood storage duration and prostate cancer recurrence   |    316 |  20 | medicaldata    |
| `bmt`          | Bone marrow transplant for leukemia                     |    137 |  22 | KMsurv         |
| `bmtcrr`       | Bone marrow transplant competing risks                  |    177 |   7 | casebase       |
| `channing`     | Channing House retirement community mortality           |    462 |   6 | KMsurv         |
| `cmv`          | Donor KIR genotype and CMV reactivation                 |     64 |  26 | medicaldata    |
| `colon`        | Colon cancer adjuvant chemotherapy trial                |   1858 |  16 | survival       |
| `crcfes`       | Fez colorectal cancer cohort                            |    346 |  19 | biostatlab     |
| `crcmondaca`   | Colorectal cancer genomic cohort (Mondaca et al. 2020)  |    471 |  19 | biostatlab     |
| `drug6mp`      | 6-MP leukemia remission trial                           |     21 |   5 | KMsurv         |
| `eprchd`       | Estrogen plus progestin and coronary heart disease risk |  16608 |   3 | casebase       |
| `erspc`        | European Randomized Study of Prostate Cancer Screening  | 159893 |   3 | casebase       |
| `flchain`      | Serum free light chain assay cohort                     |   7874 |  11 | survival       |
| `framingham`   | Framingham Heart Study survival extract                 |   5209 |  18 | biostatlab     |
| `gbsg2`        | German Breast Cancer Study Group 2                      |    686 |  10 | TH.data        |
| `heartfailure` | Heart failure clinical records                          |    299 |  13 | biostatlab     |
| `kidney`       | Kidney dialysis catheter infection                      |    119 |   3 | KMsurv         |
| `larynx`       | Larynx cancer survival                                  |     90 |   5 | KMsurv         |
| `lung`         | NCCTG lung cancer survival                              |    228 |  10 | survival       |
| `melanoma`     | Malignant melanoma cohort                               |    205 |  11 | riskRegression |
| `metabric`     | METABRIC breast cancer cohort                           |   1904 | 693 | biostatlab     |
| `mitrace`      | TRACE myocardial infarction study                       |   1878 |   9 | timereg        |
| `nwtsco`       | National Wilms Tumor Study                              |   3915 |  12 | addhazard      |
| `paquid`       | Paquid dementia cohort                                  |   2561 |   4 | riskRegression |
| `pbc`          | Mayo Clinic primary biliary cholangitis trial           |    418 |  20 | survival       |
| `pbc3`         | PBC3 multi-center cirrhosis trial                       |    349 |  15 | pec            |
| `rotterdam`    | Rotterdam breast cancer cohort                          |   2982 |  15 | survival       |
| `std`          | STD recurrence cohort                                   |    877 |  24 | KMsurv         |
| `stroke`       | Copenhagen Stroke Study                                 |    518 |  15 | pec            |
| `support`      | SUPPORT critically ill patients                         |   9104 |  34 | casebase       |
| `supraclav`    | Supraclavicular nerve block anesthesia study            |    103 |  17 | medicaldata    |
| `veteran`      | Veterans’ Administration lung cancer trial              |    137 |   8 | survival       |
