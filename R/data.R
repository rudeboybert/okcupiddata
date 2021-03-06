#' Cleaned OkCupid profile data
#'
#' Cleaned profile data of 59,946 OkCupid users who were living within 25
#' miles of San Francisco, had active profiles during a period in the
#' 2010s, and had at least one picture in their profile. The original
#' data and codebook can be found at
#' \url{https://github.com/rudeboybert/JSE_OkCupid}.
#'
#' @details The differences between the cleaned and original version of profiles data are:
#' \describe{
#' \item{Essay Responses}{Due to file size restrictions, only the first 140
#' characters of each user's first essay response (my self summary) is included}
#' \item{Missing \code{income} values}{Previously coded as \code{-1}, they are now
#' coded as \code{NA}}
#' \item{All other missing values}{Previously coded as \code{""}, they are now coded
#' as \code{NA}}
#' \item{\code{offspring} and \code{sign}}{String instances of \code{"?&rsquo;"} are
#' replaced with apostrophes}
#' }
#' @format A \code{data.frame} with 59946 rows and 22 variables:
#' \describe{
#'   \item{age}{Age}
#'   \item{body_type}{Body type}
#'   \item{diet}{Dietary habits}
#'   \item{drinks}{Drinking habits}
#'   \item{drugs}{Drug usage habits}
#'   \item{education}{Education level}
#'   \item{ethnicity}{Ethnicity}
#'   \item{height}{Height in inches with random noise added (random uniform from {-1, 0, 1})}
#'   \item{income}{Income}
#'   \item{job}{Job}
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
#' library(tibble)
#' profiles_revised
#'
#' # If using RStudio:
#' # View(profiles)
"profiles_revised"


#' Cleaned (shuffled) OkCupid essay data
#'
#' Cleaned randomly row-shuffled essay data of 59,946 OkCupid users. To
#' unpair essays from users, the rows of the essay data were randomly
#' scrambled. Furthermore, due to R package size restrictions, only the
#' first 140 characters of each user's first essay response (my self
#' summary) is included. The original data and codebook can be found at
#' \url{https://github.com/rudeboybert/JSE_OkCupid}.
#'
#' @format A \code{data.frame} with 59946 rows and 1 variable:
#' \describe{
#'   \item{essay0}{First 140 characters of first essay response (my self summary)}
#' }
#' @source \url{https://github.com/rudeboybert/JSE_OkCupid}
#' @examples
#' library(tibble)
#' essay0_revised_and_shuffled
#'
#' # If using RStudio:
#' # View(essay0_revised_and_shuffled)
"essay0_revised_and_shuffled"
