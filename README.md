# Curriculum Mapping
_Repository for the Competency-based Curriculum Mapping Manuscript_

## Overview
This repository contains the data and code used to generate figures in the manuscript, "Competency-based Curriculum Mapping for Doctoral Program Evaluation" by Xiuqi Li, Jelena Patrnogić, and David Van Vactor.
* Preprint of the manuscript can be accessed on **_OSF Preprints_**. doi:[10.31219/osf.io/eq32b](https://doi.org/10.31219/osf.io/eq32b).
* Related OSF repository can be accessed [here](https://osf.io/8qexb/)

## Repo Organization
This repository is organized into three folders
* __code__ contains code used to wrangle data and generate visuals. Specifically, it contains
  + __ConceptDiagram.R__: code used to generated Figure 1. Concept diagram of our competency framework
  + __CurriculumMap.R__: code used to generate Figure 2. Partial curriculum map and Figure S1. Full curriculum map of the HMS BBS graduate program (AY 2022-2023)
* __data__ contains data used for analysis. Specifically, it contains
  + __CompetencyList.csv__: data frame containing all competencies
  + __CurriculumMapping.csv__: curriculum mapping dataset post semi-structured interviews (course identifiers and Curriculum Fellow contact info have been removed)
* __figures__ contains figures generated through coding
  + Microsoft Powerpoint was used for subsequent annotations. See [OSF](https://osf.io/x8cj5/) for relevant files 

## Session info
Obtained using `utils:::print.sessionInfo(sessionInfo()[-8])`

```
R version 4.4.1 (2024-06-14)
Platform: aarch64-apple-darwin20
Running under: macOS Sonoma 14.4.1

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
LAPACK: /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.0

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

time zone: America/New_York
tzcode source: internal

attached base packages:
NULL

other attached packages:
 [1] here_1.0.1      lubridate_1.9.3 forcats_1.0.0   stringr_1.5.1   dplyr_1.1.4     purrr_1.0.2    
 [7] readr_2.1.5     tidyr_1.3.1     tibble_3.2.1    ggplot2_3.5.1   tidyverse_2.0.0

loaded via a namespace (and not attached):
 [1] utf8_1.2.4        generics_0.1.3    stringi_1.8.4     hms_1.1.3         digest_0.6.36    
 [6] magrittr_2.0.3    evaluate_0.24.0   grid_4.4.1        timechange_0.3.0  fastmap_1.2.0    
[11] rprojroot_2.0.4   fansi_1.0.6       scales_1.3.0      textshaping_0.4.0 cli_3.6.3        
[16] rlang_1.1.4       crayon_1.5.3      bit64_4.0.5       munsell_0.5.1     withr_3.0.0      
[21] tools_4.4.1       parallel_4.4.1    tzdb_0.4.0        colorspace_2.1-0  vctrs_0.6.5      
[26] R6_2.5.1          lifecycle_1.0.4   bit_4.0.5         vroom_1.6.5       ragg_1.3.2       
[31] pkgconfig_2.0.3   pillar_1.9.0      gtable_0.3.5      rsconnect_1.3.1   glue_1.7.0       
[36] systemfonts_1.1.0 xfun_0.45         tidyselect_1.2.1  rstudioapi_0.16.0 knitr_1.47       
[41] farver_2.1.2      htmltools_0.5.8.1 labeling_0.4.3    rmarkdown_2.27    compiler_4.4.1   
```
