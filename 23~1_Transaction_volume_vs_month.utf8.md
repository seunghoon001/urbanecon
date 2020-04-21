---
title: "Transaction volume vs Month"
author: "Sanghoon Lee"
date: "3/25/2020"
output: html_document
---




```r
library(tidyverse)
```

```
## -- Attaching packages ----------------------------------------------------------------------------- tidyverse 1.3.0 --
```

```
## v ggplot2 3.3.0     v purrr   0.3.3
## v tibble  2.1.3     v dplyr   0.8.5
## v tidyr   1.0.0     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.4.0
```

```
## -- Conflicts -------------------------------------------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

Introduction

We study the relationship between sale volume and month.

Data

We use BC Assessment housing transaction data. 


```r
bca <- read_rds("data/bca_sm.rds")
```

Analysis

We drop observations from 2018, since we have data only until September 2018.

```r
library(lubridate)
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following object is masked from 'package:base':
## 
##     date
```

```r
bca <- bca %>% filter(year(sale_date) != 2018)
```

Our quick data analysis shows that sale volume is highest in May.

```r
bca <- bca %>% 
	mutate(Month = month(sale_date, label = TRUE))

bca %>% count(Month)
```

```
## # A tibble: 12 x 2
##    Month     n
##    <ord> <int>
##  1 Jan   63215
##  2 Feb   69903
##  3 Mar   85413
##  4 Apr   87428
##  5 May   90049
##  6 Jun   85856
##  7 Jul   78696
##  8 Aug   69368
##  9 Sep   63645
## 10 Oct   61426
## 11 Nov   56761
## 12 Dec   40894
```


```r
bca %>% ggplot() + geom_bar(aes(Month))
```

<img src="23~1_Transaction_volume_vs_month_files/figure-html/unnamed-chunk-5-1.png" width="672" />


```r
bca %>% ggplot() + geom_bar(aes(Month, fill=act_use_cat), position = "fill")
```

<img src="23~1_Transaction_volume_vs_month_files/figure-html/unnamed-chunk-6-1.png" width="672" />

Conclusion

The analysis shows that housing transaction volumes are higher from March to August. This is true for both single family detached houses and condos. The percentage of condos among housing transactions are higher from October to December.

