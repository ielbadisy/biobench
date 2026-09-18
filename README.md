
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
#>         dataset           task source_package n_row n_col
#> 1  breastcancer classification        mlbench   699    11
#> 2         pima2 classification        mlbench   768     9
#> 3           dna classification        mlbench  3186   181
#> 4  bloodstorage       survival    medicaldata   316    20
#> 5     covidtest classification    medicaldata 15524    17
#> 6           cmv       survival    medicaldata    64    26
#> 7       esophca classification    medicaldata    88     5
#> 8       indorct classification    medicaldata   602    33
#> 9      indometh     regression    medicaldata    66     3
#> 10 laryngoscope     regression    medicaldata    99    22
#> 11     licorice classification    medicaldata   235    19
#> 12          opt classification    medicaldata   823   171
#> 13       polyps     regression    medicaldata    22     7
#> 14       scurvy classification    medicaldata    12     8
#> 15    smartpill     regression    medicaldata    95    22
#> 16      streptb classification    medicaldata   107    13
#> 17    supraclav       survival    medicaldata   103    17
#> 18       theoph     regression    medicaldata   132     5
#> 19         lung       survival       survival   228    10
#> 20      veteran       survival       survival   137     8
#> 21          pbc       survival       survival   418    20
#> 22        colon       survival       survival  1858    16
#> 23      flchain       survival       survival  7874    11
#> 24    rotterdam       survival       survival  2982    15
#> 25        gbsg2       survival        TH.data   686    10
```
