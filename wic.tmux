#!/usr/bin/env bash

WIC_TMUX_COLOR_THEME_FILE=src/wic.conf
WIC_TMUX_VERSION=0.1.0
WIC_TMUX_STATUS_CONTENT_FILE="src/wic-status-content.conf"
WIC_TMUX_COMMON_FILE="src/wic-common.conf"
_current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

__cleanup() {
  unset -v WIC_TMUX_COLOR_THEME_FILE WIC_TMUX_VERSION
  unset -v WIC_TMUX_STATUS_CONTENT_FILE WIC_TMUX_COMMON_FILE
  unset -v _current_dir
  unset -f __load __cleanup __remove_wic_shell_dir
}

__load() {
  __remove_wic_shell_dir
  printf "# Don't delete! This line is generated automatically.\n_wic_shell_dir=\
$_current_dir/src/tools\n" >> $_current_dir/$WIC_TMUX_COMMON_FILE

  tmux source-file "$_current_dir/$WIC_TMUX_COMMON_FILE"
  tmux source-file "$_current_dir/$WIC_TMUX_COLOR_THEME_FILE"
  tmux source-file "$_current_dir/$WIC_TMUX_STATUS_CONTENT_FILE"
}

__remove_wic_shell_dir() {
  val=$(grep -c "_wic_shell_dir" $_current_dir/$WIC_TMUX_COMMON_FILE)
  if [[ $val -ne '0' ]]; then
    line=$(grep -n "_wic_shell_dir" $_current_dir/$WIC_TMUX_COMMON_FILE | awk -F: '{printf $1}')
    prev_line=$(expr ${line} - 1) 
    sed -i "${prev_line},${line}d" $_current_dir/$WIC_TMUX_COMMON_FILE
  fi
}

__load
__cleanup
