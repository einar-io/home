#!/usr/bin/env bash

set -euo pipefail

install_dir=$HOME

function install_file() (
  file=${1}
  dest_path="$(readlink -f "${install_dir}/${file}")"
  orig_path="$(readlink -f "${file}")"

  if [ -f "${dest_path}" ]; then
    if [ "${dest_path}" != "${orig_path}" ]; then
      echo "${install_dir} already has a file ${file}."
      exit 1
    fi
  fi
  ln -s "$orig_path" "$dest_path"
)

install_file .vimrc
