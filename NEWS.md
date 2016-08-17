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
