#!/usr/bin/env bash

function dotnet_build_sql() {
  dotnet build "$1" /nowarn:SQL71502
}

function dotnet_pack_sql() {
  dotnet pack "$1" /nowarn:SQL71502
}

# Nuget
export NUGET_SRC=${HOME}/.nuget/packages
function nuget_add_local() {
  # Test incoming arguments
  if [[ $# -ne 1 ]]; then
    echo "Incorrect arguments detected!" >&2
    echo "Usage: nuget_add_local <nupkg_path>" >&2
    return 1
  fi
  nupkg_path="$1"

  if [[ $nupkg_path = *-SNAPSHOT*.nupkg ]]; then
    pkg_spec=$(basename "$nupkg_path" .nupkg)
    pkg_name=$(echo "$pkg_spec" | cut -d "." -f1)
    pkg_version=${pkg_spec##${pkg_name}.}
    nuget_target="${NUGET_SRC}/${pkg_name}/${pkg_version}"

    if [[ -d "$nuget_target" ]]; then
      echo "Removing existing files..."
      rm -rf "${NUGET_SRC}/${pkg_name}/${pkg_version}"
    fi
  fi
  nuget push "$1" -Source ${NUGET_SRC}
}
alias nal='nuget_add_local'