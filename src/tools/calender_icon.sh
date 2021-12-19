#!/usr/bin/env bash

_month=$(date +%m)
if [[ $_month -ge 11 ]] || [[ $_month -lt 3 ]]; then
  _cal_icon="☃" 
elif [[ $_month -ge 3 ]] && [[ $_month -lt 6 ]]; then
  _cal_icon="❀" 
elif [[ $_month -ge 6 ]] && [[ $_month -lt 9 ]]; then
  _cal_icon="☂"
elif [[ $_month -ge 9 ]] && [[ $_month -lt 11 ]]; then
  _cal_icon="☙"
fi
echo $_cal_icon
