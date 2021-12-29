#! /bin/sh

suite_addTest testIndexBuild
suite_addTest testConfigBaseConflicts
suite_addTest testConfigTextConflicts

testIndexBuild() {
  INPUT=$(cat ../index.scss);
  assertEquals 0 $?

  echo $INPUT | sass --stdin 2>/dev/null
  assertEquals 0 $?
}

testConfigBaseConflicts() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$font-stacks: (foobar: [baz]),
  \$brand-colors: (foobar: black),
);
EOF
  );

  echo $INPUT | sass --stdin 2>/dev/null
  assertEquals 65 $?
}

testConfigTextConflicts() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$font-weights: (foobar: 400),
  \$font-sizes: (foobar: 1rem),
);
EOF
  );

  echo $INPUT | sass --stdin 2>/dev/null
  assertEquals 65 $?
}
