
<!-- README.md is generated from README.Rmd. Please edit that file -->

# okcupiddata (revised in 2021)

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/okcupiddata)](http://cran.r-project.org/package=okcupiddata)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/okcupiddata)](http://www.r-pkg.org/pkg/okcupiddata)

R package of cleaned profile data from **the 2021 revision** of [OkCupid
Profile Data for Introductory Statistics and Data Science
Courses](https://doi.org/10.1080/10691898.2015.11889737) (Journal of
Statistics Education 2015): 59,946 OkCupid users who were living within
25 miles of San Francisco, had active profiles during a period in the
2010s, and had at least one picture in their profile.

The data in this package are a “cleaned” version of the 2021 revised
data from the above paper, in that the following variables are modified
for easier use by novices:

  - In `profiles_revised`:
      - **Missing `income` values**: Previously coded as `-1`, they are
        now coded as `NA`
      - **All other missing values**: Previously coded as `""`, they are
        now coded as `NA`
      - **`offspring` and `sign`**: String instances of `"?&rsquo;"` are
        replaced with apostrophes
  - In `essay0_revised_and_shuffled`
      - **Essay responses**: Randomly row-shuffled essay data, thereby
        uncoupling individual essays from individual user profile
        information. Due to file size restrictions, only the first 140
        characters of each user’s first essay response (`essay0`: my
        self summary) are included.

**Note**:

  - The original data, publication, code, and codebook can be found
    [here](https://github.com/rudeboybert/JSE_OkCupid).
  - The original data, and hence also this cleaned data, did not include
    usernames.
  - Permission to use this data was explicitly granted by OkCupid.
  - **Revisions in 2021**:
      - Removed the exact date the data was collected.
      - Shuffled/randomized the order of the rows of the essay data,
        thereby decoupling the essay data from the profiles data.
      - Removed URL’s in the essay data that involved the following
        domains: facebook.com, instagram.com, twitter.com,
        pinterest.com, and flickr.com.
      - Added random noise to age variable in the profiles data:
        uniformly selected between {-1, 0, +1}.
      - Removed the following variables from the profiles data:
        `location`, `last_online`

## Installation

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

## Load Data

To load the revised profile data, run:

``` r
library(okcupiddata)
profiles_revised
```

To load the **row-shuffled** essay data, run:

``` r
essay0_revised_and_shuffled
```
