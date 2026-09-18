
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
#>         dataset           task source_package n_row n_col has_missing highdim
#> 1  breastcancer classification        mlbench   699    11        TRUE   FALSE
#> 2         pima2 classification        mlbench   768     9        TRUE   FALSE
#> 3           dna classification        mlbench  3186   181       FALSE    TRUE
#> 4  bloodstorage       survival    medicaldata   316    20        TRUE   FALSE
#> 5     covidtest classification    medicaldata 15524    17        TRUE   FALSE
#> 6           cmv       survival    medicaldata    64    26        TRUE    TRUE
#> 7       esophca classification    medicaldata    88     5       FALSE   FALSE
#> 8       indorct classification    medicaldata   602    33        TRUE    TRUE
#> 9      indometh     regression    medicaldata    66     3       FALSE   FALSE
#> 10 laryngoscope     regression    medicaldata    99    22        TRUE    TRUE
#> 11     licorice classification    medicaldata   235    19        TRUE   FALSE
#> 12          opt classification    medicaldata   823   171        TRUE    TRUE
#> 13       polyps     regression    medicaldata    22     7        TRUE   FALSE
#> 14       scurvy classification    medicaldata    12     8       FALSE   FALSE
#> 15    smartpill     regression    medicaldata    95    22        TRUE    TRUE
#> 16      streptb classification    medicaldata   107    13        TRUE   FALSE
#> 17    supraclav       survival    medicaldata   103    17        TRUE   FALSE
#> 18       theoph     regression    medicaldata   132     5       FALSE   FALSE
#> 19         lung       survival       survival   228    10        TRUE   FALSE
#> 20      veteran       survival       survival   137     8       FALSE   FALSE
#> 21          pbc       survival       survival   418    20        TRUE   FALSE
#> 22        colon       survival       survival  1858    16        TRUE   FALSE
#> 23      flchain       survival       survival  7874    11        TRUE   FALSE
#> 24    rotterdam       survival       survival  2982    15       FALSE   FALSE
#> 25        gbsg2       survival        TH.data   686    10       FALSE   FALSE
```
