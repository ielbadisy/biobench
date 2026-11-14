#' Health expenditure, income and population health: a country-year panel
#'
#' A real public panel of 193 countries observed every year from 2000 to
#' 2022 (23 years), assembled from the World Bank World Development
#' Indicators (WDI). It links current health expenditure (from the WHO
#' Global Health Expenditure Database, as redistributed in WDI), its
#' financing mix (out-of-pocket and domestic government shares), real
#' income, population ageing, life expectancy and under-5 mortality. The
#' panel is balanced in its rows (every country has all 23 years) but
#' unbalanced in its values: some country-years are missing (`NA`) for
#' some indicators, so fitted models use an unbalanced panel. Countries
#' with no health expenditure data in any year (mostly small territories)
#' and all regional and income aggregates are excluded. The build script,
#' with the download calls and the validation checks, is
#' `data-raw/healthspend.R` in the GitHub repository of the R package
#' \pkg{panglm} (<https://github.com/ielbadisy/panglm>).
#' Regression (panel data).
#'
#' @format A data frame with 4,439 rows (193 countries x 23 years) and 15
#'   columns. The panel index pair is (`iso3c`, `year`).
#' \describe{
#'   \item{iso3c}{factor, ISO 3166-1 alpha-3 country code (193 levels);
#'     the panel individual index}
#'   \item{year}{integer calendar year, 2000-2022; the panel time index}
#'   \item{country}{character, World Bank country name}
#'   \item{region}{factor, World Bank region (7 levels: East Asia &
#'     Pacific; Europe & Central Asia; Latin America & Caribbean; Middle
#'     East, North Africa, Afghanistan & Pakistan; North America; South
#'     Asia; Sub-Saharan Africa); time invariant}
#'   \item{income}{factor, World Bank income group with levels `low`,
#'     `lowermiddle`, `uppermiddle`, `high`; the classification current at
#'     download (2026-11-01), so it is time invariant here and does
#'     not track past reclassifications}
#'   \item{chepc}{numeric, current health expenditure (CHE) per capita, PPP,
#'     current international dollars (WDI `SH.XPD.CHEX.PP.CD`), 2 decimals}
#'   \item{chereal}{numeric, real CHE per capita in constant 2021
#'     international dollars, derived as `chegdp / 100 * gdppc`; use this
#'     (not `chepc`, which is in current prices) together with `gdppc` for
#'     income elasticities}
#'   \item{chegdp}{numeric, CHE as a percentage of GDP (`SH.XPD.CHEX.GD.ZS`)}
#'   \item{oop}{numeric, out-of-pocket expenditure as a percentage of CHE
#'     (`SH.XPD.OOPC.CH.ZS`), 0-100; divide by 100 for a proportion}
#'   \item{gghe}{numeric, domestic general government health expenditure as
#'     a percentage of CHE (`SH.XPD.GHED.CH.ZS`), 0-100}
#'   \item{gdppc}{numeric, GDP per capita, PPP, constant 2021 international
#'     dollars (`NY.GDP.PCAP.PP.KD`), 1 decimal}
#'   \item{lifeexp}{numeric, life expectancy at birth, total, years
#'     (`SP.DYN.LE00.IN`); period estimates include crisis years, e.g.
#'     14.7 for the Central African Republic in 2009}
#'   \item{u5mr}{numeric, under-5 mortality rate per 1,000 live births
#'     (`SH.DYN.MORT`)}
#'   \item{pop}{integer, total population (`SP.POP.TOTL`)}
#'   \item{pop65}{numeric, population aged 65 and above, percentage of
#'     total (`SP.POP.65UP.TO.ZS`)}
#' }
#' Missing values: `chepc` 92, `chereal` 217, `chegdp`, `oop` and `gghe` 91,
#' `gdppc` 174, `u5mr` 23; `lifeexp`, `pop` and `pop65` are complete.
#'
#' @source World Bank, World Development Indicators, API v2
#'   (<https://api.worldbank.org/v2/country/all/indicator/SH.XPD.CHEX.PP.CD?date=2000:2023&format=json&per_page=20000>
#'   and the same call for the other indicator codes; country metadata from
#'   <https://api.worldbank.org/v2/country?format=json&per_page=400>), WDI
#'   release last updated 2026-10-08, downloaded 2026-11-01. Health
#'   expenditure series: World Health Organization, Global Health
#'   Expenditure Database (update of 12 December 2025), via WDI.
#'   Life expectancy and population: UN World Population Prospects;
#'   under-5 mortality: UN Inter-agency Group for Child Mortality
#'   Estimation; GDP: World Bank International Comparison Program; all via
#'   WDI.
#'
#'   Licence: Creative Commons Attribution 4.0 (CC BY 4.0). The WDI catalog
#'   entry
#'   (<https://datatopics.worldbank.org/world-development-indicators/>)
#'   states "This dataset is licensed under Creative Commons Attribution
#'   4.0", and the metadata of each of the nine series used carries
#'   `License_Type` "CC BY-4.0". Attribution: "World Bank, World
#'   Development Indicators (CC BY 4.0)". Changes from the source: country
#'   subset, renamed columns, rounding, and the derived column `chereal`.
#'
#'   Copied unchanged from the R package \pkg{panglm} (MIT licence), which
#'   built it from the sources above.
#'
#' @references
#' World Bank (2026). World Development Indicators. Washington, DC: The
#' World Bank. <https://datatopics.worldbank.org/world-development-indicators/>
#'
#' World Health Organization (2025). Global Health Expenditure Database.
#' <https://apps.who.int/nha/database>
#'
#' Getzen, T. E. (2000). Health care is an individual necessity and a
#' national luxury: applying multilevel decision models to the analysis of
#' health care expenditures. Journal of Health Economics, 19(2), 259-270.
#'
#' Baltagi, B. H. and Moscone, F. (2010). Health care expenditure and
#' income in the OECD reconsidered: evidence from panel data. Economic
#' Modelling, 27(4), 804-811.
#'
#' Hausman, J. A. and Taylor, W. E. (1981). Panel data and unobservable
#' individual effects. Econometrica, 49(6), 1377-1398.
#'
"healthspend"
