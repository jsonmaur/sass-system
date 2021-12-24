#! /bin/sh

suite() {
  . ./integration/dark-mode.test.sh
  . ./integration/generators.test.sh
  . ./integration/index.test.sh
}

# Load shUnit2.
. ../shunit2/shunit2
