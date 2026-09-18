
# biobench

A curated collection of **real (non-synthetic) biomedical datasets** for
benchmarking classification, regression, and survival machine learning
methods. Every dataset is documented with its canonical literature
reference (`?dataset_name`).

Sources: [mlbench](https://cran.r-project.org/package=mlbench),
[medicaldata](https://higgi13425.github.io/medicaldata/),
[survival](https://cran.r-project.org/package=survival), and
[TH.data](https://cran.r-project.org/package=TH.data).

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
