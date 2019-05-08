Design of Experiments in R
================

# Introduction

This repository is designed to be a refrence for myself and others for
using R in the design of experiments. It is a living document to store
code snippets and reminders of how to achieve outcomes given inputs and
constraints.

This repository is heavily influenced by [“Statistical Methods for
Mineral
Engineers”](https://jktech.com.au/statistical-methods-mineral-engineers)
by the incredibly influential Prof. TJ Napier-Munn and the CRAN Task
View [“Design of Experiments (DoE) & Analysis of Experimental
Data”](https://cran.r-project.org/web/views/ExperimentalDesign.html)
by Ulrike Groemping.

## High Level Notes

  - Use blocking to account for factors that probably have an effect but
    aren’t interesting.
  - Date
  - Batch of materials
  - Person performing experiments
  - Equipment the test is performed on
  - Pay attention to the
    [resolution](https://en.wikipedia.org/wiki/Fractional_factorial_design#Resolution)
    of the study. Stay within III-V most of the time.
  - I : Not Useful
  - II : Not useful, can’t distinguish main effects
  - III: Useful, estimate main effects but can’t distinguish two-factor
    interactions
  - IV : Useful, can estimate main and two-factor effects but two factor
    interactions can be confounded
  - V : Useful, can estimate main, two-factor, two-factor interactions
    and three factor interactions
  - VI : Rarely useful, overkill, estimate all above factors unless
    there is other three-factor interactions

## Fractional Factorial Designs with 2-Level Factors

  - Used When you have On-Off style interactions or High-Low effects.

Below is an example of a flotation test to measure bubble size given
three parameters and three replications. The experiment is of a
resolution “III” and will not be able to identify two-factor
interactions.

``` r
pacman::p_load(tidyverse, FrF2)

example1 = FrF2(factor.names = c("frother","collector","salinity"),
                resolution = 3,
                replications = 3)
example1_runorder = attr(example1,"run.order")

example1 %>% bind_cols(example1_runorder) %>% knitr::kable(format = "markdown")
```

| frother | collector | salinity | run.no.in.std.order | run.no | run.no.std.rp |
| :------ | :-------- | :------- | :------------------ | -----: | :------------ |
| 1       | 1         | 1        | 4                   |      1 | 4.1           |
| \-1     | 1         | \-1      | 3                   |      2 | 3.1           |
| \-1     | \-1       | 1        | 1                   |      3 | 1.1           |
| 1       | \-1       | \-1      | 2                   |      4 | 2.1           |
| \-1     | \-1       | 1        | 1                   |      5 | 1.2           |
| \-1     | 1         | \-1      | 3                   |      6 | 3.2           |
| 1       | \-1       | \-1      | 2                   |      7 | 2.2           |
| 1       | 1         | 1        | 4                   |      8 | 4.2           |
| \-1     | \-1       | 1        | 1                   |      9 | 1.3           |
| 1       | \-1       | \-1      | 2                   |     10 | 2.3           |
| \-1     | 1         | \-1      | 3                   |     11 | 3.3           |
| 1       | 1         | 1        | 4                   |     12 | 4.3           |
