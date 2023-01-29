Daily Fishing Effort and Vessel Presence at 100th Degree Resolution by Flag State and Gear Type, version 2.0, 2012-2020

Fishing effort and vessel presence data is available in the following formats:
 - BigQuery Tables (global-fishing-watch.gfw_public_data.fishing_effort_v2)
 - CSVs

Description:
Fishing effort and vessel presence is binned into grid cells 0.01 degrees on a side, and measured in units of hours. The time is calculated by assigning an amount of time to each AIS detection (which is the time to the previous AIS position), and then summing all positions in each grid cell. Data is based on fishing detections of >114,000 unique AIS devices on fishing vessels, of which ~70,000 are active each year. Fishing vessels are identified via a neural network classifier and vessel registry databases. Fishing effort for squid jiggers is not calculated through the neural network, but instead through this heuristic (https://github.com/GlobalFishingWatch/global-footprint-of-fisheries/blob/master/data_production/updated-algorithm-for-squid-jiggers.md).

The current version of the GFW vessel classification neural net classifies fishing vessels into sixteen categories. Geartypes with nested categories are higher order classes that are assigned when the neural net and/or vessel registries are not confident enough in one of the lower level atomic classes. For example, the model may not score a vessel high enough to label it “pots_and_traps”, “set_longlines”, or “set_gillnets”, but collectively these classes score high enough to label the vessel as “fixed_gear”. The "fishing" class is assigned to vessels for which the neural net is unsure about the type of fishing vessel or when the neural net and registry information conflict.

Geartypes:
- fishing: a combination of vessels of unknown fishing gear
 - drifting_longlines: drifting longlines
 - seiners: vessels using seine nets, including potential purse seine vessels
   targeting tuna and other species, as well as danish and other seines
     - purse_seines: purse seines, both pelagic and demersal
        - tuna_purse_seines: large purse seines primarily fishing for tuna.
        - other_purse_seines: purse seiners fishing for mackerel, anchovies, etc, often smaller and operating nearer the coast than tuna purse seines.
    - other_seines: danish seines and other seiners not using purse seines.
 - trawlers: trawlers, all types
 - pole_and_line: vessel from which people fish with pole and line.
 - trollers: vessel that tows multiple fishing lines.
 - fixed_gear: a category that includes potential set longlines, set gillnets,  and pots and traps
     - pots_and_traps: vessel that deploys pots (small, portable traps) or traps to
       catch fish
     - set_longlines: vessel that fishes by setting longlines anchored to the
       seafloor. These lines have shorter hooked, typically baited, lines hanging
       from them
     - set_gillnets: vessel that fishes by setting gillnets anchored to the seafloor.
 - dredge_fishing: vessel that tows a dredge the scrapes up edible bottom
   dwellers such as scallops or oysters.
 - squid_jigger: squid jiggers, mostly large industrial pelagic operating vessels

Vessel information for each MMSI included in this dataset is provided in a separate file (fishing-vessels-v2.csv).

Table Schema
 - date: Date in YYYY-MM-DD format
 - cell_ll_lat: the latitude of the lower left corner of the grid cell, in decimal degrees
 - cell_ll_lon: the longitude of the lower left corner of the grid cell, in decimal degrees
 - flag: flag state, in iso3 format
 - geartype: geartype, see above description of gear types
 - hours: hours that vessels of this gear type and flag were present in this gridcell on this day
 - fishing_hours: hours that vessels of this geartype and flag were fishing in this grid cell on this day
 - mmsi_present: number of MMSI of this flag state and geartype that visited this grid cell on this day

For additional information about the initial release of this dataset, see the associated journal article: D.A. Kroodsma, J. Mayorga, T. Hochberg, N.A. Miller, K. Boerder, F. Ferretti, A. Wilson, B. Bergman, T.D. White, B.A. Block, P. Woods, B. Sullivan, C. Costello, and B. Worm. "Tracking the global footprint of fisheries." Science 361.6378 (2018). (http://science.sciencemag.org/content/359/6378/904)

 Unless otherwise stated, Global Fishing Watch data is licensed under a Creative Commons Attribution-ShareAlike 4.0 International license(https://creativecommons.org/licenses/by-sa/4.0/) and code under an Apache 2.0 license(http://www.apache.org/licenses/LICENSE-2.0).
