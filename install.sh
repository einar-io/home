#!/usr/bin/env bash

set -euo pipefail

install_dir=$HOME

# Install by symlinking the files here. The files may already exist, and may
# already point to here. install_file() attempts to account for these cases.

# install_file is run as a subprocess to report all errors (i.e., installations
# are deemed independent). Hence, install_file is wrapped in (), not mere {}.

function install_file() (
  file=${1}
  dest_path="$(readlink -f "${install_dir}/${file}")"
  orig_path="$(readlink -f "${file}")"

  if [ -f "${dest_path}" ]; then
    if [ "${dest_path}" != "${orig_path}" ]; then
      echo "${install_dir} already has a file ${file}."
      exit 1
    else
      # Already installed
      exit 0
    fi
  fi
  ln -s "${orig_path}" "${dest_path}"
)

function install_files {
  while [ $# -gt 0 ]; do
    install_file $1
    shift
  done
}

install_files \
  .vimrc \
