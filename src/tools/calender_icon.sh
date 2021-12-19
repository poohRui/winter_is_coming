#!/usr/bin/env bash

_month=$(date +%m)
_month=${_month#0}
if [[ $_month -ge 11 ]] || [[ $_month -lt 03 ]]; then
  _cal_icon="☃" 
elif [[ $_month -ge 3 ]] && [[ $_month -lt 06 ]]; then
  _cal_icon="❀" 
elif [[ $_month -ge 6 ]] && [[ $_month -lt 09 ]]; then
  _cal_icon="☂"
elif [[ $_month -ge 9 ]] && [[ $_month -lt 11 ]]; then
  _cal_icon="☙"
fi
echo $_cal_icon
