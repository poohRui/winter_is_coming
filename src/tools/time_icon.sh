#!/usr/bin/env bash
# Copyright (C) 2021-present Li Yurui <liyuruijx@pku.edu.cn>
#
# License:     GPL-2.0-only 
# Inspired by: nord-tmux
# Reference: 
#   https://github.com/arcticicestudio/nord-tmux

_hour=$(date +%T | awk -F: '{print $1}')
_hour=${_hour#0}
if [[ $_hour -ge 19 ]] && [[ $_hour -le 23 ]]; then
  _time_icon="♫" 
elif [[ $_hour -ge 14 ]] && [[ $_hour -lt 19 ]]; then
  _time_icon="♨"
elif [[ $_hour -ge 8 ]] && [[ $_hour -lt 14 ]]; then
  _time_icon="☼"
else
  _time_icon="☾"
fi 
echo $_time_icon

