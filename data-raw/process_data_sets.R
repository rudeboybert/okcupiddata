library(dplyr)
library(readr)
library(stringr)
library(lubridate)

# Load CSV file from GitHub repo for JSE paper.
if(!file.exists("profiles.csv")){
  url <- "https://github.com/rudeboybert/JSE_OkCupid/blob/master/profiles.csv.zip?raw=true"
  temp_file <- tempfile()
  download.file(url, temp_file, mode="wb")
  unzip(temp_file, "profiles.csv")
}

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

# Cleaned Profiles --------------------------------------------------------
profiles <- read.csv(file="profiles.csv", header = TRUE, stringsAsFactors = FALSE) %>%
  # Remove all but first essay response and reorder
  select(-(essay1:essay9)) %>%
  select(age:education, ethnicity:status, essay0) %>%
  # Clean missing values
  mutate_each(funs(replace(., . == "", NA))) %>%
  # Clean other values and convert last_online variable to POXIXct object
  mutate(
    income = ifelse(income == -1, NA, income),
    offspring = str_replace_all(offspring, "&rsquo;", "'"),
    sign = str_replace_all(sign, "&rsquo;", "'"),
    last_online = parse_date_time(last_online, "Y-m-d-h-m", tz="US/Pacific")
  ) %>%
  # Clean remaining essay question and trim to 140 characters
  mutate(
    essay0 = clean_html(essay0),
    essay0 = str_sub(essay0, 1, 140)
  )
devtools::use_data(profiles, overwrite = TRUE, compress = "bzip2")
