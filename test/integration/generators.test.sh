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
suite_addTest testGeneratorExtend

testGenerator() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$colors: (),
  \$brand-colors: (black: black),
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
  \$colors: (),
  \$brand-colors: (black: black),
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
  \$colors: (),
  \$brand-colors: (black: black),
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
  \$colors: (),
  \$brand-colors: (black: black),
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
  \$colors: (),
  \$brand-colors: (black: black),
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
  \$colors: (),
  \$brand-colors: (black: black),
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

testGeneratorExtend() {
  INPUT=$(cat <<EOF
@use "sass:list";
@use "sass:map";
@use "../index" with (
  \$normalize: false,
  \$colors: (),
  \$brand-colors: (black: black),
  \$generators: (
    base: [background-color],
    dark: (
      base: [background-color],
    ),
    sm: (
      base: [background-color],
    ),
  ),
);

.test {
  @extend .bg-black;
  @extend .sm\:bg-black;
  color: white;
}

.test-dark {
  @extend .dark\:bg-black;
  color: gray;
}

.test-container {
  max-width: index.size(6);
  background-color: index.color(black);
  padding: index.space(5);
  margin: index.space(5);

  @include index.media-up-to(md) {
    max-width: index.size(7);
  }
}
EOF
  );

  OUTPUT=$(cat <<EOF
.bg-black, .test {
  background-color: black;
}

@media (prefers-color-scheme: dark) {
  .dark\:bg-black, .test-dark {
    background-color: black;
  }
}
@media (min-width: 768px) {
  .sm\:bg-black, .test {
    background-color: black;
  }
}
.test {
  color: white;
}

.test-dark {
  color: gray;
}

.test-container {
  max-width: 32rem;
  background-color: black;
  padding: 4rem;
  margin: 4rem;
}
@media (min-width: 1024px) {
  .test-container {
    max-width: 48rem;
  }
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}
