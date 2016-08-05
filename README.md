
<!-- README.md is generated from README.Rmd. Please edit that file -->
okcupiddata
===========

[![Build Status](https://travis-ci.org/rudeboybert/okcupiddata.png?branch=master)](https://travis-ci.org/rudeboybert/okcupiddata) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/okcupiddata)](http://cran.r-project.org/package=okcupiddata) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/okcupiddata)](http://www.r-pkg.org/pkg/okcupiddata)

R package of OkCupid profile data from [OkCupid Profile Data for Introductory Statistics and Data Science Courses](http://www.amstat.org/publications/jse/v23n2/kim.pdf): 59,946 OkCupid users who were living within 25 miles of San Francisco, had active profiles on June 26, 2012, were online in the previous year, and had at least one picture in their profile.

Note:

-   The original code and data for the paper can be found [here](https://github.com/rudeboybert/JSE_OkCupid).
-   Due to file size restrictions, all essay responses are omitted from the package.
-   Permission to use this data set was explicitly granted by OkCupid.
-   Usernames are not included.

Installation
------------

COMING SOON: Get the released version from CRAN:

``` r
install.packages("okcupiddata")
```

Or the development version from GitHub:

``` r
# If you haven't installed devtools yet, do so:
# install.packages("devtools")
devtools::install_github("rudeboybert/okcupiddata")
```

Data Sets
---------

To see a list of all data sets, type:

``` r
data(package = "okcupiddata")
```

-   `profiles` consists of a cleaned-up version of the non-essay response data more appropriate for use by novices.
-   `profiles_raw` consists of the raw version of the non-essay response data as presented in the original paper.
