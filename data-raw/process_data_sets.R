library(dplyr)
library(readr)
library(stringr)
library(lubridate)


if(!file.exists("profiles.csv")){
  url <- "https://github.com/rudeboybert/JSE_OkCupid/blob/master/profiles.csv.zip?raw=true"
  temp_file <- tempfile()
  download.file(url, temp_file, mode="wb")
  unzip(temp_file, "profiles.csv")
}

all_data <- read_csv(file="profiles.csv") %>%
  mutate(ID = 1:n()) %>%
  select(ID, age:status)


# Raw Profiles ----------------------------------------------------------------
profiles_raw <- all_data %>%
  select(-starts_with("essay"))
devtools::use_data(profiles_raw, overwrite = TRUE, compress = "bzip2")

# Cleaned Profiles --------------------------------------------------------
profiles <- profiles_raw %>%
  mutate_each(funs(replace(., . == "", NA))) %>%
  mutate(
    income = ifelse(income == -1, NA, income),
    offspring = str_replace_all(offspring, "&rsquo;", "'"),
    sign = str_replace_all(sign, "&rsquo;", "'"),
    last_online = parse_date_time(last_online, "Y-m-d-h-m", tz="US/Pacific")
  )



# Essays ----------------------------------------------------------------
essays_raw <- all_data %>%
  select(ID, starts_with("essay"))
devtools::use_data(essays_raw, overwrite = TRUE, compress = "xz")

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

essays <- essays_raw %>%
  mutate(
    essay0 = clean_html(essay0),
    essay1 = clean_html(essay1),
    essay2 = clean_html(essay2),
    essay3 = clean_html(essay3),
    essay4 = clean_html(essay4),
    essay5 = clean_html(essay5),
    essay6 = clean_html(essay6),
    essay7 = clean_html(essay7),
    essay8 = clean_html(essay8),
    essay9 = clean_html(essay9)
  )








