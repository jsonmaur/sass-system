#! /bin/sh

suite_addTest testIndexBuild

testIndexBuild() {
  INPUT=$(cat index.scss);

  echo $INPUT | sass --stdin 2>/dev/null
  assertEquals 0 $?
}
