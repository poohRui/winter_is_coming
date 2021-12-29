#!/usr/bin/env bash

WIC_TMUX_VERSION=0.1.0
WIC_TMUX_COLOR_THEME_FILE=src/wic_color_theme.conf
WIC_TMUX_CONFIG_FILE=src/wic.conf
WIC_TMUX_AUTO_CONFIG_FILE=src/wic_auto.conf
_current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

__cleanup() {
  unset -v WIC_TMUX_VERSION
  unset -v WIC_TMUX_COLOR_THEME_FILE WIC_TMUX_CONFIG_FILE WIC_TMUX_AUTO_CONFIG_FILE
  unset -v _current_dir
  unset -f __load __cleanup __create_after_remove_wic_auto_config_file
}

__load() {
  __create_after_remove_wic_auto_config_file
  printf "# Don't delete! This line is generated automatically.\n_wic_shell_dir=\
$_current_dir/src/tools\n" >> $_current_dir/$WIC_TMUX_AUTO_CONFIG_FILE

  tmux source-file "$_current_dir/$WIC_TMUX_AUTO_CONFIG_FILE"
  tmux source-file "$_current_dir/$WIC_TMUX_COLOR_THEME_FILE"
  tmux source-file "$_current_dir/$WIC_TMUX_CONFIG_FILE"
}

__create_after_remove_wic_auto_config_file() {
  if [[ -f $_current_dir/$WIC_TMUX_AUTO_CONFIG_FILE ]]; then
    rm $_current_dir/$WIC_TMUX_AUTO_CONFIG_FILE
  fi
  touch $_current_dir/$WIC_TMUX_AUTO_CONFIG_FILE
}

__load
__cleanup
