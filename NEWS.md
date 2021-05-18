# okcupiddata 0.1.0.9000

## 2021 revision of paper

The original 2015 Journal of Statistics Education publication of
"OkCupid Profile Data for Introductory Statistics and Data Science
Courses" was revised in 2021. The following changes were made:

* The essay data was
    + Randomly row shuffled, thereby uncoupling individual user profile data from individual essay
    + URL's to the following websites were removed: Facebook, Instagram, Twitter, Pinterest, Flickr
* Random noise was added to the `age` variable: uniformly selected between {-1, 0, +1}
* The `location` and `last_online` variables were removed
* The date the data were collected was recast as "a period in the 2010s"

As such

* the main `profiles` data frame has been renamed `profiles_revised` 
* the `essay0` variable in the original `profiles` data frame is now in a separate data frame `essay0_revised_and_shuffled`



# okcupiddata 0.1.0 

## Initial version of package

Modified original OkCupid profile data as follows:

* Essay responses: Due to file size restrictions, only the first 140 characters
of each user's first essay response (`essay0`: my self summary) aree included
* Missing `income` values: Previously coded as `-1`, they are now coded as `NA`
* All other missing values: Previously coded as `""`, they are now coded as `NA`
* `offspring` and `sign`: String instances of `"?&rsquo;"` are replaced with
apostrophes
* `last_online`: Date/time strings are converted to `USA/Pacific` timezone
POSIXct date-time objects
