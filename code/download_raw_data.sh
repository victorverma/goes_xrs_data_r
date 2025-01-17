#!/bin/bash

urls=(
  "https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/goes08/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g08_s19950103_e20030616_v1-0-0.nc"
  "https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/goes09/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g09_s19960401_e19980728_v1-0-0.nc"
  "https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/goes10/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g10_s19980701_e20091201_v1-0-0.nc"
  "https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/goes11/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g11_s20060601_e20080210_v1-0-0.nc"
  "https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/goes12/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g12_s20030110_e20070412_v1-0-0.nc"
  "https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/goes13/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g13_s20130601_e20171214_v1-0-0.nc"
  "https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/goes14/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g14_s20090901_e20200304_v1-0-0.nc"
  "https://www.ncei.noaa.gov/data/goes-space-environment-monitor/access/science/xrs/goes15/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g15_s20100331_e20200304_v1-0-0.nc"
  "https://data.ngdc.noaa.gov/platforms/solar-space-observing-satellites/goes/goes16/l2/data/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g16_s20170207_e20240717_v2-2-0.nc"
  "https://data.ngdc.noaa.gov/platforms/solar-space-observing-satellites/goes/goes17/l2/data/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g17_s20180601_e20230110_v2-2-0.nc"
  "https://data.ngdc.noaa.gov/platforms/solar-space-observing-satellites/goes/goes18/l2/data/xrsf-l2-avg1m_science/sci_xrsf-l2-avg1m_g18_s20220902_e20240717_v2-2-0.nc"
)

files=(
  "../data/raw/goes08.nc"
  "../data/raw/goes09.nc"
  "../data/raw/goes10.nc"
  "../data/raw/goes11.nc"
  "../data/raw/goes12.nc"
  "../data/raw/goes13.nc"
  "../data/raw/goes14.nc"
  "../data/raw/goes15.nc"
  "../data/raw/goes16.nc"
  "../data/raw/goes17.nc"
  "../data/raw/goes18.nc"
)

download_file() {
  local index=$1
  echo "Creating ${files[index]}"
  curl --fail -o "${files[index]}" "${urls[index]}"
  local err_code=$?
  if [ $err_code -eq 0 ]; then
    if [ -s "${files[index]}" ]; then
      echo "File created successfully"
      return 0
    else
      echo "File doesn't exist or is empty"
      return 1
    fi
  else
    return 1
  fi
}

if [ $# -eq 0 ]; then
  for i in "${!files[@]}"; do
    download_file $i || exit $?
  done
else
  target="$1"
  index=-1
  for i in "${!files[@]}"; do
    if [[ "${files[i]}" == *"$target.nc" ]]; then
      index=$i
      break
    fi
  done
  if [ $index -ne -1 ]; then
    download_file $index || exit $?
  else
    echo "Satellite not found"
    exit 1
  fi
fi
