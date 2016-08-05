#' (Cleaned) OkCupid profile data
#'
#' Cleaned version of \code{\link{profiles_raw}} meant for novices. Differences
#' between \code{profiles} and \code{profiles_raw} are described in Details.
#'
#' @details Differences between cleaned and raw version of profiles data.
#' \describe{
#' \item{Missing \code{income} values}{Previously stored as \code{-1} is now stored as \code{NA}'s}
#' \item{All other missing values}{Previously stored as \code{""} is now stored as \code{NA}'s}
#' \item{\code{offspring} and \code{sign}}{String instances \code{"?&rsquo;"} are replaced with apostrophes.}
#' \item{\code{last_online}}{Converted to USA/Pacific timezone POSIXct date-time objects using \link[lubridate]{parse_date_time}}
#' }
#' @format A tibble (\code{tbl_df} class data frame in \link[dplyr]{dplyr} style) with 59946 rows and 22 variables:
#' @source \url{https://github.com/rudeboybert/JSE_OkCupid}
#' @examples
#' library(okcupiddata)
#' data(profiles)
#' # If using RStudio:
#' # View(profiles)
#' summary(profiles$income)
"profiles"

#' (Cleaned) OkCupid profile data
#'
#' Raw profile data of 59,946 OkCupid users who were living within 25 miles of San
#' Francisco, had active profiles on June 26, 2012, were online in the previous
#' year, and had at least one picture in their profile. Essay response data were
#' not included. Full codebook can be found
#' at \url{https://github.com/rudeboybert/JSE_OkCupid}
#'
#' @format A tibble (\code{tbl_df} class data frame in \link[dplyr]{dplyr} style) with 59946 rows and 22 variables:
#' \describe{
#'   \item{ID}{Anonymized ID number of user. Used to join with essay data}
#'   \item{age}{Age}
#'   \item{body_type}{Body type}
#'   \item{diet}{Dietary habits}
#'   \item{drinks}{Drinking habits}
#'   \item{drugs}{Drug usage habits}
#'   \item{education}{Education level}
#'   \item{ethnicity}{Ethnicity}
#'   \item{height}{Height in inches}
#'   \item{income}{Income}
#'   \item{job}{Job}
#'   \item{last_online}{Date/time of last login to OkCupid}
#'   \item{location}{Location}
#'   \item{offspring}{Number of offspring}
#'   \item{orientation}{Sexual orientation}
#'   \item{pets}{Number of pets}
#'   \item{religion}{Religious affiliation}
#'   \item{sex}{Sex. Note at the time OkCupid only allowed for male/female binary. This has since been relaxed.}
#'   \item{sign}{Astrological sign}
#'   \item{smokes}{Smoking habits}
#'   \item{speaks}{Languages spoken}
#'   \item{status}{Relationship status}
#' }
#' @source \url{https://github.com/rudeboybert/JSE_OkCupid}
#' @examples
#' library(okcupiddata)
#' data(profiles_raw)
#' # If using RStudio:
#' # View(profiles_raw)
#' summary(profiles_raw$income)
"profiles_raw"
