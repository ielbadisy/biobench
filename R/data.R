#' Wisconsin breast cancer cytology
#'
#' Fine-needle aspirate cytology features for benign vs malignant breast
#' tumors. Binary classification.
#'
#' @format A data frame with 699 rows and 11 variables.
#' @references Wolberg, W. H., & Mangasarian, O. L. (1990). Multisurface
#'   method of pattern separation for medical diagnosis applied to breast
#'   cytology. \emph{Proceedings of the National Academy of Sciences},
#'   87, 9193-9196.
#' @source UCI Machine Learning Repository, via the \pkg{mlbench} package.
"breastcancer"

#' Pima Indians diabetes (corrected)
#'
#' Diagnostic measurements used to predict diabetes onset in women of Pima
#' Indian heritage. Corrected version with physiologically impossible zero
#' values (glucose, blood pressure, triceps, insulin, BMI) recoded as
#' missing. Binary classification.
#'
#' @format A data frame with 768 rows and 9 variables.
#' @references Smith, J. W., Everhart, J. E., Dickson, W. C., Knowler,
#'   W. C., & Johannes, R. S. (1988). Using the ADAP learning algorithm to
#'   forecast the onset of diabetes mellitus. \emph{Proceedings of the
#'   Symposium on Computer Applications in Medical Care}, 261-265.
#' @source National Institute of Diabetes and Digestive and Kidney
#'   Diseases, via the \pkg{mlbench} package.
"pima2"

#' Splice-junction gene sequences
#'
#' Primate DNA sequences classified by splice-junction type (exon/intron
#' boundary, intron/exon boundary, or neither). Multiclass classification.
#'
#' @format A data frame with 3186 rows and 181 variables.
#' @references Noordewier, M. O., Towell, G. G., & Shavlik, J. W. (1991).
#'   Training knowledge-based neural networks to recognize genes in DNA
#'   sequences. \emph{Advances in Neural Information Processing Systems},
#'   3.
#' @source Genbank 64.1 / UCI Machine Learning Repository, via the
#'   \pkg{mlbench} package.
"dna"

#' Blood storage duration and prostate cancer recurrence
#'
#' Retrospective cohort on red blood cell storage duration and biochemical
#' recurrence of cancer after radical prostatectomy.
#'
#' @format A data frame with 316 rows and 20 variables.
#' @references Cata, J. P. et al. (2011). Blood storage duration and
#'   biochemical recurrence of cancer after radical prostatectomy.
#'   \emph{Mayo Clinic Proceedings}, 86(2), 120-127.
#' @source \pkg{medicaldata} package.
"bloodstorage"

#' COVID-19 PCR testing cohort
#'
#' De-identified SARS-CoV-2 PCR testing results and metadata from the
#' Children's Hospital of Pennsylvania, 2020.
#'
#' @format A data frame with 15524 rows and 17 variables.
#' @references Obstfeld, A. E. (2020). Deidentified results of COVID-19
#'   testing at the Children's Hospital of Pennsylvania (CHOP).
#' @source \pkg{medicaldata} package.
"covidtest"

#' Donor KIR genotype and CMV reactivation
#'
#' Retrospective cohort on donor killer immunoglobulin-like receptor (KIR)
#' genotype and cytomegalovirus reactivation after allogeneic stem cell
#' transplant.
#'
#' @format A data frame with 64 rows and 26 variables.
#' @references Sobecks, R. et al. (2011). Cytomegalovirus reactivation
#'   after matched sibling donor reduced-intensity conditioning allogeneic
#'   hematopoietic stem cell transplant correlates with donor killer
#'   immunoglobulin-like receptor genotype. \emph{Experimental and
#'   Clinical Transplantation}, 1, 7-13.
#' @source \pkg{medicaldata} package.
"cmv"

#' Esophageal cancer case-control study
#'
#' Case-control data on alcohol and tobacco use and esophageal cancer.
#'
#' @format A data frame with 88 rows and 5 variables.
#' @references Breslow, N. E., & Day, N. E. (1980). \emph{Statistical
#'   Methods in Cancer Research. Volume 1: The Analysis of Case-Control
#'   Studies}. IARC Lyon / Oxford University Press.
#' @source \pkg{medicaldata} package.
"esophca"

#' Rectal indomethacin RCT for post-ERCP pancreatitis
#'
#' Randomized controlled trial of rectal indomethacin to prevent
#' pancreatitis after endoscopic retrograde
#' cholangiopancreatography (ERCP).
#'
#' @format A data frame with 602 rows and 33 variables.
#' @references Elmunzer, B. J., Higgins, P. D. R., et al. (2012). A
#'   randomized trial of rectal indomethacin to prevent post-ERCP
#'   pancreatitis. \emph{New England Journal of Medicine}, 366, 1414-1422.
#' @source \pkg{medicaldata} package.
"indorct"

#' Indomethacin pharmacokinetics
#'
#' Cohort study of intravenous indomethacin plasma concentration over
#' time. Pharmacokinetic regression.
#'
#' @format A data frame with 66 rows and 3 variables.
#' @references Kwan, K. C., Breault, G. O., Umbenhauer, E. R., McMahon,
#'   F. G., & Duggan, D. E. (1976). Kinetics of indomethacin absorption,
#'   elimination, and enterohepatic circulation in man. \emph{Journal of
#'   Pharmacokinetics and Biopharmaceutics}, 4(3), 255-280.
#' @source \pkg{medicaldata} package.
"indometh"

#' Video vs standard laryngoscope RCT
#'
#' Randomized comparison of the Pentax AWS video laryngoscope versus the
#' Macintosh laryngoscope in morbidly obese patients.
#'
#' @format A data frame with 99 rows and 22 variables.
#' @references Abdallah, F. W. et al. (2011). A randomized comparison
#'   between the Pentax AWS video laryngoscope and the Macintosh
#'   laryngoscope in morbidly obese patients. \emph{Anesthesia &
#'   Analgesia}, 113, 1082-1087.
#' @source \pkg{medicaldata} package.
"laryngoscope"

#' Licorice gargle RCT for post-extubation cough
#'
#' Randomized, double-blind trial of licorice versus sugar-water gargle
#' before intubation for elective thoracic surgery.
#'
#' @format A data frame with 235 rows and 19 variables.
#' @references Ruetzler, K. et al. (2013). A randomized, double-blind
#'   comparison of licorice versus sugar-water gargle for prevention of
#'   postoperative sore throat and postextubation coughing. \emph{Anesthesia
#'   & Analgesia}, 117, 614-621.
#' @source \pkg{medicaldata} package.
"licorice"

#' Periodontal therapy and preterm birth
#'
#' Obstetrics and Periodontal Therapy (OPT) trial data on maternal
#' periodontal treatment and risk of preterm birth.
#'
#' @format A data frame with 823 rows and 171 variables.
#' @references Michalowicz, B. S. et al. (2006). Treatment of periodontal
#'   disease and the risk of preterm birth. \emph{New England Journal of
#'   Medicine}, 355, 1885-1894.
#' @source \pkg{medicaldata} package.
"opt"

#' Sulindac RCT for familial adenomatous polyposis
#'
#' Randomized trial of sulindac for polyp prevention in familial
#' adenomatous polyposis.
#'
#' @format A data frame with 22 rows and 7 variables.
#' @references Giardiello, F. M. et al. (1993). Treatment of colonic and
#'   rectal adenomas with sulindac in familial adenomatous polyposis.
#'   \emph{New England Journal of Medicine}, 328(18), 1313-1316.
#' @source \pkg{medicaldata} package.
"polyps"

#' James Lind's scurvy trial (1757)
#'
#' Reconstruction of the six-arm treatment comparison from James Lind's
#' original scurvy trial, one of the first controlled clinical trials.
#'
#' @format A data frame with 12 rows and 8 variables.
#' @references Lind, J. (1757). \emph{A Treatise on the Scurvy}, in 3
#'   parts, pp. 149-153.
#' @source \pkg{medicaldata} package.
"scurvy"

#' SmartPill gastric transit cohort
#'
#' Prospective cohort comparing intestinal transit times (via wireless
#' SmartPill capsule) between trauma patients and healthy volunteers.
#'
#' @format A data frame with 95 rows and 22 variables.
#' @references Rauch, S. et al. (2012). Use of wireless utility capsule to
#'   determine gastric emptying and small intestinal transit times in
#'   critically ill trauma patients. \emph{Journal of Critical Care},
#'   27(5), 534.e7-534.e12.
#' @source \pkg{medicaldata} package.
"smartpill"

#' Streptomycin RCT for pulmonary tuberculosis (1948)
#'
#' Reconstruction of the Medical Research Council's streptomycin trial for
#' pulmonary tuberculosis, widely regarded as the first modern randomized
#' controlled trial.
#'
#' @format A data frame with 107 rows and 13 variables.
#' @references Streptomycin in Tuberculosis Trials Committee (1948).
#'   Streptomycin treatment of pulmonary tuberculosis. \emph{British
#'   Medical Journal}, 769-782.
#' @source \pkg{medicaldata} package.
"streptb"

#' Supraclavicular nerve block anesthesia study
#'
#' Comparison of combined versus sequential injection of mepivacaine and
#' ropivacaine for supraclavicular nerve blocks.
#'
#' @format A data frame with 103 rows and 17 variables.
#' @references Roberman, D. et al. (2011). Combined versus sequential
#'   injection of mepivacaine and ropivacaine for supraclavicular nerve
#'   blocks. \emph{Regional Anesthesia and Pain Medicine}, 36, 145-150.
#' @source \pkg{medicaldata} package.
"supraclav"

#' Theophylline pharmacokinetics
#'
#' Cohort study of oral theophylline plasma concentration over time.
#' Pharmacokinetic regression.
#'
#' @format A data frame with 132 rows and 5 variables.
#' @references Boeckmann, A. J., Sheiner, L. B., & Beal, S. L. (1994).
#'   \emph{NONMEM Users Guide: Part V}. NONMEM Project Group, University
#'   of California, San Francisco.
#' @source \pkg{medicaldata} package.
"theoph"

#' NCCTG lung cancer survival
#'
#' Survival of patients with advanced lung cancer, with performance scores
#' rated by physician and patient. Right-censored survival.
#'
#' @format A data frame with 228 rows and 10 variables.
#' @references Loprinzi, C. L. et al. (1994). Prospective evaluation of
#'   prognostic variables from patient-completed questionnaires. North
#'   Central Cancer Treatment Group. \emph{Journal of Clinical Oncology},
#'   12(3), 601-607.
#' @source \pkg{survival} package.
"lung"

#' Veterans' Administration lung cancer trial
#'
#' Randomized trial comparing two treatment regimens for lung cancer.
#' Right-censored survival.
#'
#' @format A data frame with 137 rows and 8 variables.
#' @references Kalbfleisch, D., & Prentice, R. L. (1980). \emph{The
#'   Statistical Analysis of Failure Time Data}. Wiley, New York.
#' @source \pkg{survival} package.
"veteran"

#' Mayo Clinic primary biliary cholangitis trial
#'
#' Randomized trial of D-penicillamine for primary biliary cholangitis
#' (formerly cirrhosis), with follow-up survival data.
#'
#' @format A data frame with 418 rows and 20 variables.
#' @references Therneau, T., & Grambsch, P. (2000). \emph{Modeling
#'   Survival Data: Extending the Cox Model}. Springer-Verlag, New York.
#' @source \pkg{survival} package.
"pbc"

#' Colon cancer adjuvant chemotherapy trial
#'
#' One of the first successful trials of adjuvant chemotherapy for colon
#' cancer, comparing levamisole and levamisole+fluorouracil. Right-censored
#' survival (recurrence and death).
#'
#' @format A data frame with 1858 rows and 16 variables.
#' @references Moertel, C. G. et al. (1990). Levamisole and fluorouracil
#'   for adjuvant therapy of resected colon carcinoma. \emph{New England
#'   Journal of Medicine}, 332, 352-358.
#' @source \pkg{survival} package.
"colon"

#' Serum free light chain assay cohort
#'
#' Population-based cohort assaying serum free light chain and its
#' association with overall survival. Right-censored survival.
#'
#' @format A data frame with 7874 rows and 11 variables.
#' @references Dispenzieri, A. et al. (2012). Use of monoclonal serum
#'   immunoglobulin free light chains to predict overall survival in the
#'   general population. \emph{Mayo Clinic Proceedings}, 87, 512-523.
#' @source \pkg{survival} package.
"flchain"

#' Rotterdam breast cancer cohort
#'
#' Primary breast cancer patients from the Rotterdam tumor bank, used to
#' validate the Cox prognostic model. Right-censored survival.
#'
#' @format A data frame with 2982 rows and 15 variables.
#' @references Royston, P., & Altman, D. (2013). External validation of a
#'   Cox prognostic model: principles and methods. \emph{BMC Medical
#'   Research Methodology}, 13, 33.
#' @source \pkg{survival} package.
"rotterdam"

#' German Breast Cancer Study Group 2
#'
#' Randomized 2x2 trial evaluating hormonal treatment and duration of
#' chemotherapy in node-positive breast cancer patients. Right-censored
#' survival.
#'
#' @format A data frame with 686 rows and 10 variables.
#' @references Schumacher, M. et al. (1994). Randomized 2x2 trial
#'   evaluating hormonal treatment and the duration of chemotherapy in
#'   node-positive breast cancer patients. \emph{Journal of Clinical
#'   Oncology}, 12, 2086-2093.
#' @source \pkg{TH.data} package.
"gbsg2"

#' Fez colorectal cancer cohort
#'
#' Clinical colorectal cancer cohort from Fez, Morocco, with tumour,
#' treatment, and diagnostic-delay covariates. Primary endpoint is
#' right-censored survival (`time`/`event`); the `Delay` column (time to
#' diagnosis or treatment) also supports a regression framing on the same
#' data.
#'
#' @format A data frame with 346 rows and 19 variables.
#' @references Colorectal cancer cohort from Fez. \emph{Scientific
#'   Reports}, article 51304 (2024).
#' @source \pkg{biostatlab} package.
"crcfes"

#' Colorectal cancer genomic cohort (Mondaca et al. 2020)
#'
#' Clinical and tumour-genomic variables (mutation burden, fraction genome
#' altered, microsatellite status) with right-censored survival outcome.
#'
#' @format A data frame with 471 rows and 19 variables.
#' @references Mondaca, S. et al. (2020). Colorectal cancer genomic
#'   cohort. Cohort manuscript included with the biostatlab
#'   raw-selected-datasets sources.
#' @source \pkg{biostatlab} package.
"crcmondaca"

#' Framingham Heart Study survival extract
#'
#' Cardiovascular follow-up cohort with event time and cause-of-event
#' fields. Right-censored survival. Missing values in `scl1`, `scl2`, and
#' `smok` are coded `-1` in the original extract rather than `NA`.
#'
#' @format A data frame with 5209 rows and 18 variables.
#' @references Dawber, T. R. (1980). \emph{The Framingham Study: The
#'   Epidemiology of Atherosclerotic Disease}. Harvard University Press.
#' @source \pkg{biostatlab} package.
"framingham"

#' Haberman breast cancer survival
#'
#' Survival of patients who underwent surgery for breast cancer, by age,
#' year of operation, and number of positive axillary nodes. Binary
#' classification (5-year survival status).
#'
#' @format A data frame with 306 rows and 4 variables.
#' @references Haberman, S. J. (1976). Generalized residuals for log-linear
#'   models. \emph{Proceedings of the 9th International Biometrics
#'   Conference}, 104-122. UCI Machine Learning Repository.
#' @source \pkg{biostatlab} package.
"haberman"

#' Heart failure clinical records
#'
#' Clinical records of patients with heart failure, with follow-up time
#' and death event. Right-censored survival.
#'
#' @format A data frame with 299 rows and 13 variables.
#' @references Chicco, D., & Jurman, G. (2020). Machine learning can
#'   predict survival of patients with heart failure from serum
#'   creatinine and ejection fraction alone. \emph{BMC Medical Informatics
#'   and Decision Making}, 20, 16.
#' @source \pkg{biostatlab} package.
"heartfailure"

#' Maternal health risk assessment
#'
#' Maternal vital-sign measurements (blood pressure, blood sugar, body
#' temperature, heart rate) with a categorical pregnancy risk level.
#' Multiclass classification.
#'
#' @format A data frame with 1205 rows and 13 variables.
#' @references Maternal health risk assessment dataset. Mendeley Data.
#' @source \pkg{biostatlab} package.
"highriskpreg"

#' METABRIC breast cancer cohort
#'
#' Molecular Taxonomy of Breast Cancer International Consortium cohort:
#' clinical, gene-expression, and mutation variables with right-censored
#' overall survival. High-dimensional (n < p).
#'
#' @format A data frame with 1904 rows and 693 variables.
#' @references Curtis, C. et al. (2012). The genomic and transcriptomic
#'   architecture of 2,000 breast tumours reveals novel subgroups.
#'   \emph{Nature}, 486, 346-352. Pereira, B. et al. (2016). The somatic
#'   mutation profiles of 2,433 breast cancers refine their genomic and
#'   transcriptomic landscapes. \emph{Nature Communications}, 7, 11479.
#' @source \pkg{biostatlab} package.
"metabric"

#' Morocco youth tobacco survey
#'
#' Global Youth Tobacco Survey extract for Morocco: demographic and
#' household exposure variables. Primary outcome `cigar_use` (binary
#' classification); the `age_first_cig` column also supports a regression
#' framing on the same data.
#'
#' @format A data frame with 3915 rows and 27 variables.
#' @references Global Youth Tobacco Survey, Morocco. World Health
#'   Organization / CDC.
#' @source \pkg{biostatlab} package.
"tobaccomorocco"
