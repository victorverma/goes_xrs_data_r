# goes_xrs_data_r

## Overview

R code for downloading and collating science-quality long-channel GOES XRS data.
Some references are listed below. (1) is a readme for science-quality GOES 13-15 data. (2) and (3) have
information about GOES 16-18 data; they also have information specifically
about the minutely data.

1. https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/GOES_1-15_XRS_Science-Quality_Data_Readme.pdf
2. https://data.ngdc.noaa.gov/platforms/solar-space-observing-satellites/goes/goes16/l2/docs/GOES-R_XRS_L2_Data_Users_Guide.pdf
3. https://data.ngdc.noaa.gov/platforms/solar-space-observing-satellites/goes/goes16/l2/docs/GOES-R_XRS_L2_Data_Readme.pdf

## Usage

### `code/download_raw_data.sh`

This script saves raw data files in `raw/`; it should be run from `code/`. The URLs for the raw data files were found by following links from [this page](https://www.ngdc.noaa.gov/stp/satellite/goes-r.html), which links to
repositories of science-quality data. The links to follow are those for the
"1-minute Averages" product for the XRS instrument. [This Readme](https://data.ngdc.noaa.gov/platforms/solar-space-observing-satellites/goes/goes16/l1b/docs/GOES-R_EXIS_XRS_L1b_Data_ReadMe.pdf) recommends using science-quality L2 data instead of science-quality L1b data.
