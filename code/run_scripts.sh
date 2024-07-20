#!/bin/bash

if [ $# -eq 0 ]; then
  ./download_raw_data.sh
else
  ./download_raw_data.sh "$1"
fi
if [ $? -eq 0 ]; then
  Rscript --vanilla process_raw_data.R
else
  echo "Processing skipped because a download failed"
  exit 1
fi
