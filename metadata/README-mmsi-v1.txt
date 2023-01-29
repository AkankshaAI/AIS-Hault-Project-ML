Daily Fishing Effort at 10th Degree Resolution by MMSI, version 1.0 (2012-2016)

Description

This dataset contains the original release of the Global Fishing Watch fishing effort data and includes fishing effort by MMSI binned into grid cells 0.1 degrees on a side, and measured in units of hours. The time is calculated by assigning an amount of time to each AIS detection (which is half the time to the previous plus half the time to the next AIS position). To get information on each MMSI, see Global Fishing Watch data on fishing vessels.

For additional information about these results, see the associated journal article: [D.A. Kroodsma, J. Mayorga, T. Hochberg, N.A. Miller, K. Boerder, F. Ferretti, A. Wilson, B. Bergman, T.D. White, B.A. Block, P. Woods, B. Sullivan, C. Costello, and B. Worm. "Tracking the global footprint of fisheries." Science 361.6378 (2018)](https://science.sciencemag.org/content/359/6378/904).

 - GitHub repository for Tracking the global footprint of fisheries: [https://github.com/GlobalFishingWatch/paper-global-footprint-of-fisheries](https://github.com/GlobalFishingWatch/paper-global-footprint-of-fisheries)

Unless otherwise stated, Global Fishing Watch data is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International license](https://creativecommons.org/licenses/by-sa/4.0/) and code under an [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0).

Files

 Fishing effort data are available for download in the following formats:
  - mmsi-daily-csvs-10-v1-YYYY.zip: Zip file containing a folder of daily csv files for the specified year in the format YYYY-MM-DD.csv.

BigQuery

The data are also available via the following public Google BigQuery table:

- global-fishing-watch.global_footprint_of_fisheries.fishing_effort_byvessel

Table Schema
 - date: a string in format “YYYY-MM-DD” indicating the date for daily csvs
 - year: year of data for annual csvs
 - mmsi: unique AIS identifier
 - lat_bin: the southern edge of the grid cell, in 10ths of a degree -- 101 is the grid cell with a southern edge at 10.1 degrees north. Divide by 10 to convert to decimal degrees.
 - lon_bin: the western edge of the grid cell, in 10ths of a degree -- 101 is the grid cell with a western edge at 10.1 degrees east. Divide by 10 to convert to decimal degrees.
 - fishing_hours: hours that vessels of this geartype and flag were fishing in this gridcell on this day
