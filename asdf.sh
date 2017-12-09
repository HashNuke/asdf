#!/usr/bin/env bash

if [ "${BASH_SOURCE[0]}" != "" ]; then
  current_script_path="${BASH_SOURCE[0]}"
else
  current_script_path="$0"
fi

export ASDF_DIR
ASDF_DIR="$(dirname "$(readlink -m "$current_script_path")")"

[[ ":$PATH:" != *":${ASDF_DIR}/bin:"* ]] && PATH="${ASDF_DIR}/bin:$PATH"
[[ ":$PATH:" != *":${ASDF_DIR}/shims:"* ]] && PATH="${ASDF_DIR}/shims:$PATH"

if [ -n "$ZSH_VERSION" ]; then
  autoload -U bashcompinit
  bashcompinit
fi
