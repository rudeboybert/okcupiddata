
<!-- README.md is generated from README.Rmd. Please edit that file -->
okcupiddata
===========

[![Build Status](https://travis-ci.org/rudeboybert/okcupiddata.png?branch=master)](https://travis-ci.org/rudeboybert/okcupiddata) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/okcupiddata)](http://cran.r-project.org/package=okcupiddata) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/okcupiddata)](http://www.r-pkg.org/pkg/okcupiddata)

R package of cleaned profile data from [OkCupid Profile Data for Introductory Statistics and Data Science Courses](http://www.amstat.org/publications/jse/v23n2/kim.pdf) (Journal of Statistics Education 2015): 59,946 OkCupid users who were living within 25 miles of San Francisco, had active profiles on June 26, 2012, were online in the previous year, and had at least one picture in their profile.

The profile data in this package are a modified version of the original data, suitable for use by novices:

-   **Essay responses**: Due to file size restrictions, only the first 140 characters of each user's first essay response (`essay0`: my self summary) are included
-   **Missing `income` values**: Previously coded as `-1`, they are now coded as `NA`
-   **All other missing values**: Previously coded as `""`, they are now coded as `NA`
-   **`offspring` and `sign`**: String instances of `"?&rsquo;"` are replaced with apostrophes
-   **`last_online`**: Date/time strings are converted to `USA/Pacific` timezone POSIXct date-time objects

Note:

-   The original data, publication, code, and codebook can be found [here](https://github.com/rudeboybert/JSE_OkCupid).
-   Usernames are not included.
-   Permission to use this data set was explicitly granted by OkCupid.

Installation
------------

Get the released version from CRAN:

``` r
install.packages("okcupiddata")
```

Or the development version from GitHub:

``` r
# If you haven't installed devtools yet, do so:
# install.packages("devtools")
devtools::install_github("rudeboybert/okcupiddata")
```

Load Data
---------

To load the profile data, run:

``` r
data(profiles)
```

If you prefer having the original uncleaned profile data along with the complete essay data, then do not use this package; simply run the following code:

``` r
# Download the data (run only once):
url <- "https://github.com/rudeboybert/JSE_OkCupid/blob/master/profiles.csv.zip?raw=true"
temp_zip_file <- tempfile()
download.file(url, temp_zip_file)
unzip(temp_zip_file, "profiles.csv")
# Load CSV into R:
profiles <- read.csv(file="profiles.csv", header=TRUE, stringsAsFactors = FALSE)
```
