#!/usr/bin/env bash

if [ "${BASH_SOURCE[0]}" != "" ]; then
  current_script_path="${BASH_SOURCE[0]}"
else
  current_script_path="$0"
fi

# shellcheck source=init.sh
source "$(dirname "$current_script_path")/init.sh"

# Add asdf to PATH
#
# if in $PATH, remove, regardless of if it is in the right place (at the front) or not.
# replace all occurrences - ${parameter//pattern/string}
# shellcheck disable=SC2153
ASDF_BIN="${ASDF_DIR}/bin"
ASDF_SHIMS="${ASDF_DATA_DIR}/shims"
[[ ":$PATH:" == *":${ASDF_BIN}:"* ]] && PATH="${PATH//$ASDF_BIN:/}"
[[ ":$PATH:" == *":${ASDF_SHIMS}:"* ]] && PATH="${PATH//$ASDF_SHIMS:/}"
# add to front of $PATH
PATH="${ASDF_BIN}:$PATH"
PATH="${ASDF_SHIMS}:$PATH"

if [ -n "$ZSH_VERSION" ]; then
  autoload -U bashcompinit
  bashcompinit
fi
