Fishing Vessels, version 2.0 (2012-2020)

Fishing vessel data is available in the following formats:
 - BigQuery Tables (global-fishing-watch.gfw_public_data.fishing_vessels_v2)
 - CSV

Description:

This dataset includes all MMSI that are included in version 2.0 of the Global Fishing Watch fishing effort data. It includes all vessels that were identified as fishing vessels by the neural network and which were not identified as non-fishing vessels by registries and manual review. If an MMSI was matched to a fishing vessel on a registry, but the neural net did not classify it as a fishing vessel, it is not included on this list.

Geartypes:

The current version of the GFW vessel classification neural net classifies fishing vessels into sixteen categories. Geartypes with nested categories are higher order classes that are assigned when the neural net and/or vessel registries are not confident enough in one of the lower level atomic classes. For example, the model may not score a vessel high enough to label it “pots_and_traps”, “set_longlines”, or “set_gillnets”, but collectively these classes score high enough to label the vessel as “fixed_gear”. The "fishing" class is assigned to vessels for which the neural net is unsure about the type of fishing vessel or when the neural net and registry information conflict.

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

Table Schema:

- mmsi: Maritime Mobile Service Identity, the identifier for AIS
- flag_ais: Flag state (ISO3 value) for the vessel as determined by the first three digits (MID) of the MMSI number
- flag_registry: Flag state (ISO3 value) for the vessel as listed on vessel registries (when applicable)
- flag_gfw: Flag state (ISO3 value) assigned to the vessel by GFW after considering all available information
- vessel_class_inferred: Vessel class (geartype) inferred by the GFW vessel classification neural net model
- vessel_class_inferred_score: Neural net score (0-1) for the top scoring vessel class inferred by the GFW vessel classification neural net model. Values closer to 1 indicate higher confidence by the neural net
- vessel_class_registry: Vessel class (geartype) for the vessel as listed on vessel registries (if applicable)
- vessel_class_gfw: Vessel class (geartype) assigned to the vessel by GFW after considering all available information
- self_reported_fishing_vessel: Whether the vessel broadcasts the 'Fishing' ship type in > 98% of AIS identity messages
- length_m_inferred: Vessel length (meters) inferred by the GFW vessel classification neural net model
- length_m_registry: Vessel length (meters) for the vessel as listed on vessel registries (if applicable)
- length_m_gfw: Vessel length (meters) assigned to the vessel by GFW after considering all available information
- engine_power_kw_inferred: Engine power (kilowatts) inferred by the GFW vessel classification neural net model
- engine_power_kw_registry: Engine power (kilowatts) for the vessel as listed on vessel registries (if applicable)"
- engine_power_kw_gfw: Engine power (kilowatts) assigned to the vessel by GFW after considering all available information
- tonnage_gt_inferred: Tonnage (gross tons) inferred by the GFW vessel classification neural net model
- tonnage_gt_registry: Tonnage (gross tons) for the vessel as listed on vessel registries
- tonnage_gt_gfw: Tonnage (gross tons) assigned to the vessel by GFW after considering all available information
- registries_listed: Registries where the vessel is listed and used to inform the _registry fields (if applicable)
- fishing_hours_2012: Fishing hours for the vessel in 2012
- fishing_hours_2013: Fishing hours for the vessel in 2013
- fishing_hours_2014: Fishing hours for the vessel in 2014
- fishing_hours_2015: Fishing hours for the vessel in 2015
- fishing_hours_2016: Fishing hours for the vessel in 2016
- fishing_hours_2017: Fishing hours for the vessel in 2017
- fishing_hours_2018: Fishing hours for the vessel in 2018
- fishing_hours_2019: Fishing hours for the vessel in 2019
- fishing_hours_2020: Fishing hours for the vessel in 2020

For additional information about these results, see the associated journal article: [D.A. Kroodsma, J. Mayorga, T. Hochberg, N.A. Miller, K. Boerder, F. Ferretti, A. Wilson, B. Bergman, T.D. White, B.A. Block, P. Woods, B. Sullivan, C. Costello, and B. Worm. "Tracking the global footprint of fisheries." Science 361.6378 (2018)](https://science.sciencemag.org/content/359/6378/904).

Unless otherwise stated, Global Fishing Watch data is licensed under a Creative Commons Attribution-ShareAlike 4.0 International license(https://creativecommons.org/licenses/by-sa/4.0/) and code under an Apache 2.0 license (http://www.apache.org/licenses/LICENSE-2.0).
