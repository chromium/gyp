#!/bin/sh
set -ex

get_depot_tools() {
  cd
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
  PATH="$HOME/depot_tools:$PATH"
}

gclient_sync() {
  cd "${TRAVIS_BUILD_DIR}"
  gclient config --unmanaged https://github.com/chromium/gyp.git
  gclient sync
}

main() {
  get_depot_tools
  gclient_sync
}
main "$@"
