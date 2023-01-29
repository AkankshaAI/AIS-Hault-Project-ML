(PROVISIONAL) Daily Fishing Effort at 10th Degree Resolution by MMSI, version 1.5 (2012-2018)

You are accessing provisional data for the Global Fishing Watch fishing effort by MMSI dataset. If you find errors or irregularities in this dataset, please report them to research@globalfishingwatch.org.

Description: Fishing effort is binned into grid cells 0.1 degrees on a side, and measured in units of hours. The time is calculated by assigning an amount of time to each AIS detection (which is half the time to the previous plus half the time to the next AIS position).

Note that due to a rerun of the fishing activity classifier, fishing activity for 2012 to 2016 may not exactly match the version 1.0 of this dataset released in February of 2018. More importantly, the vessel classes are different from the original dataset.

Table Schema
 - date: a string in format “YYYY-MM-DD”
 - lat_bin: the southern edge of the grid cell, in 10ths of a degree -- 10.1 is the grid cell with a southern edge at 1.01 degrees north
 - lon_bin: the western edge of the grid cell, in 10ths of a degree -- 10.1 is the grid cell with a western edge at 1.01 degrees east
 - mmsi: unique AIS identifier
 - fishing_hours: hours that this MMSI was fishing in this gridcell on this day

For additional information about these results, see the associated journal article: D.A. Kroodsma, J. Mayorga, T. Hochberg, N.A. Miller, K. Boerder, F. Ferretti, A. Wilson, B. Bergman, T.D. White, B.A. Block, P. Woods, B. Sullivan, C. Costello, and B. Worm. "Tracking the global footprint of fisheries." Science 361.6378 (2018). http://science.sciencemag.org/content/359/6378/904
