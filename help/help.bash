#!/bin/bash
if [ $# -eq 0 ]; then
  for f in ~/dev/pascal-brand38/pascal-brand38/help/help/*.help; do
    export filenodir="${f##*/}"
    export fileext="${filenodir%.*}"
    printf 'help %s\n' "${fileext}"
  done
else
  cat ~/dev/pascal-brand38/pascal-brand38/help/help/"$1".help
fi
