#! /bin/sh

suite_addTest testDarkModeMedia
suite_addTest testDarkModeClass

testDarkModeMedia() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$dark-mode: media,
  \$colors: (black: black),
  \$auto-colors: (),
  \$generators: (
    dark: (
      base: [background-color],
    ),
    sm: (
      dark: (
        base: [background-color],
      ),
    ),
  ),
);
EOF
  );

  OUTPUT=$(cat <<EOF
@media (prefers-color-scheme: dark) {
  .dark\:bg-black {
    background-color: black;
  }
}
@media (min-width: 768px) and (prefers-color-scheme: dark) {
  .sm\:dark\:bg-black {
    background-color: black;
  }
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}

testDarkModeClass() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$dark-mode: class,
  \$colors: (black: black),
  \$auto-colors: (),
  \$generators: (
    dark: (
      base: [background-color],
    ),
    sm: (
      dark: (
        base: [background-color],
      ),
    ),
  ),
);
EOF
  );

  OUTPUT=$(cat <<EOF
.dark .dark\:bg-black {
  background-color: black;
}

@media (min-width: 768px) {
  .dark .sm\:dark\:bg-black {
    background-color: black;
  }
}
EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}
