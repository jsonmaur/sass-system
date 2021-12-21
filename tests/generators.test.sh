#! /bin/sh

suite_addTest testGenerator
suite_addTest testGeneratorDark
suite_addTest testGeneratorResponsive
suite_addTest testGeneratorResponsiveDark
suite_addTest testGeneratorResponsiveScreen
suite_addTest testGeneratorCustomSelector
suite_addTest testGeneratorInvalidSelector
suite_addTest testGeneratorInvalidSelectorValue
suite_addTest testGeneratorResponsiveInvalidScreen

testGenerator() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$colors: (black: black),
  \$auto-colors: (),
  \$generators: (
    base: [background-color color],
    hover: [background-color],
    first: [background-color],
    hover disabled: [background-color],
  ),
);
EOF
  );

  OUTPUT=$(cat <<EOF
.bg-black {
  background-color: black;
}

.current-color {
  color: currentColor;
}

.black {
  color: black;
}

.hover\:bg-black:hover {
  background-color: black;
}

.first\:bg-black:first-child {
  background-color: black;
}

.hover\:disabled\:bg-black:hover:disabled {
  background-color: black;
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}

testGeneratorDark() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$colors: (black: black),
  \$auto-colors: (),
  \$generators: (
    base: [background-color],
    dark: (
      base: [background-color],
      hover: [background-color],
    ),
  ),
);
EOF
  );

  OUTPUT=$(cat <<EOF
.bg-black {
  background-color: black;
}

@media (prefers-color-scheme: dark) {
  .dark\:bg-black {
    background-color: black;
  }

  .dark\:hover\:bg-black:hover {
    background-color: black;
  }
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}

testGeneratorResponsive() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$colors: (black: black),
  \$auto-colors: (),
  \$screens: (
    sm: 400px,
    md: 600px,
  ),
  \$generators: (
    responsive: (
      base: [background-color],
    ),
  ),
);
EOF
  );

  OUTPUT=$(cat <<EOF
@media (min-width: 400px) {
  .sm\:bg-black {
    background-color: black;
  }
}
@media (min-width: 600px) {
  .md\:bg-black {
    background-color: black;
  }
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}

testGeneratorResponsiveDark() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$colors: (black: black),
  \$auto-colors: (),
  \$screens: (
    sm: 400px,
    md: 600px,
  ),
  \$generators: (
    responsive: (
      base: [background-color],
      dark: (
        base: [background-color],
      ),
    ),
  ),
);
EOF
  );

  OUTPUT=$(cat <<EOF
@media (min-width: 400px) {
  .sm\:bg-black {
    background-color: black;
  }
}
@media (min-width: 400px) and (prefers-color-scheme: dark) {
  .sm\:dark\:bg-black {
    background-color: black;
  }
}
@media (min-width: 600px) {
  .md\:bg-black {
    background-color: black;
  }
}
@media (min-width: 600px) and (prefers-color-scheme: dark) {
  .md\:dark\:bg-black {
    background-color: black;
  }
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}

testGeneratorResponsiveScreen() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$colors: (black: black),
  \$auto-colors: (),
  \$screens: (
    sm: 400px,
    md: 600px,
  ),
  \$generators: (
    sm: (
      base: [background-color],
      dark: (
        base: [background-color],
      ),
    ),
  ),
);
EOF
  );

  OUTPUT=$(cat <<EOF
@media (min-width: 400px) {
  .sm\:bg-black {
    background-color: black;
  }
}
@media (min-width: 400px) and (prefers-color-scheme: dark) {
  .sm\:dark\:bg-black {
    background-color: black;
  }
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}

testGeneratorCustomSelector() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$colors: (black: black),
  \$auto-colors: (),
  \$selectors: (
    foo bar: ":foo:bar",
  ),
  \$generators: (
    foo bar: [background-color],
  ),
);
EOF
  );

  OUTPUT=$(cat <<EOF
.foo\:bar\:bg-black:foo:bar {
  background-color: black;
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}

testGeneratorInvalidSelector() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$generators: (
    foo: [background-color],
  ),
);
EOF
  );

  echo $INPUT | sass --stdin 2>/dev/null
  assertEquals 65 $?
}

testGeneratorInvalidSelectorValue() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$generators: (
    base: 1,
  ),
);
EOF
  );

  echo $INPUT | sass --stdin 2>/dev/null
  assertEquals 65 $?
}

testGeneratorResponsiveInvalidScreen() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$screens: (
    sm: 400px,
  ),
  \$generators: (
    md: (),
  ),
);
EOF
  );

  echo $INPUT | sass --stdin 2>/dev/null
  assertEquals 65 $?
}
