library(dplyr)
library(readr)
library(stringr)
library(lubridate)
library(here)
library(fs)

# Function to clean essay data
clean_html <- function(string){
  string <- string %>%
    # Remove HTML tags
    str_replace_all("<i>|</i>|<b>|</b>|<u>|</u>|<small>|</small>|<sup>|</sup>", " ") %>%
    str_replace_all("<em>|</em>|<strong>|</strong>|<li>|</li>|<s>|</s>", " ") %>%
    str_replace_all("<p>|</p>|<del>|</del>|<ul>|</ul>|<span>|</span>", " ") %>%
    str_replace_all("<pre>|</pre>|<ol>|</ol><ins>|</ins>|<sub>|</sub>", " ") %>%
    str_replace_all("<br />|\n", " ") %>%
    # Remove hyperlink HTML code
    gsub("<a href=.*?>", "", .) %>%
    gsub("<a class=.*?>", "", .) %>%
    str_replace_all("</a>", "") %>%
    gsub("<b class=.*?>", "", .) %>%
    # Remove URL's
    gsub("http\\S+\\s*", "", .) %>%
    # Recode miscoded symbols
    str_replace_all("&amp;", "&") %>%
    str_replace_all("&nbsp;", " ")
  return(string)
}



# Cleaned Profiles -----------------------------------------------------
# Load CSV file from GitHub repo for JSE paper.
if(!file.exists("profiles_revised.csv")){
  url <- "https://github.com/rudeboybert/JSE_OkCupid/blob/master/profiles_revised.csv.zip?raw=true"
  temp_file <- tempfile()
  download.file(url, temp_file, mode="wb")
  unzip(temp_file, "profiles_revised.csv")
  file_move("profiles_revised.csv", "data-raw/profiles_revised.csv")
}

profiles_revised <-
  here("data-raw/profiles_revised.csv") %>%
  read_csv() %>%
  # # Clean missing values
  mutate(across(everything(), ~replace(., . == "", NA))) %>%
  # Clean other values
  mutate(
    income = ifelse(income == -1, NA, income),
    offspring = str_replace_all(offspring, "&rsquo;", "'"),
    sign = str_replace_all(sign, "&rsquo;", "'")
  )
usethis::use_data(profiles_revised, overwrite = TRUE, compress = "bzip2")



# Cleaned Shuffled Essays ----------------------------------------------
# Load CSV file from GitHub repo for JSE paper.
if(!file.exists("essays_revised_and_shuffled.csv")){
  url <- "https://github.com/rudeboybert/JSE_OkCupid/blob/master/essays_revised_and_shuffled.csv.zip?raw=true"
  temp_file <- tempfile()
  download.file(url, temp_file, mode="wb")
  unzip(temp_file, "essays_revised_and_shuffled.csv")
  file_move("essays_revised_and_shuffled.csv", "data-raw/essays_revised_and_shuffled.csv")
}

essay0_revised_and_shuffled <-
  here("data-raw/essays_revised_and_shuffled.csv") %>%
  read_csv() %>%
  select(essay0) %>%
  mutate(
    essay0 = clean_html(essay0),
    essay0 = str_sub(essay0, 1, 140)
  )
usethis::use_data(essay0_revised_and_shuffled, overwrite = TRUE, compress = "bzip2")


