#! /bin/sh

suite_addTest testDarkModeMedia

testDarkModeMedia() {
  VALUE=$(cat << EOF
.tester {
  color: red;
}

.hover\:tester:hover {
  color: red;
}

.active\:tester:active {
  color: red;
}

@media (prefers-color-scheme: dark) {
  .dark\:tester {
    color: red;
  }

  .dark\:first\:tester:first-child {
    color: red;
  }
}
@media (min-width: 400px) {
  .sm\:tester {
    color: red;
  }

  .sm\:disabled\:tester:disabled {
    color: red;
  }
}
@media (min-width: 400px) and (prefers-color-scheme: dark) {
  .sm\:dark\:tester {
    color: red;
  }

  .sm\:dark\:last\:tester:last-child {
    color: red;
  }
}
@media (min-width: 800px) {
  .md\:tester {
    color: red;
  }

  .md\:disabled\:tester:disabled {
    color: red;
  }
}
@media (min-width: 800px) and (prefers-color-scheme: dark) {
  .md\:dark\:tester {
    color: red;
  }

  .md\:dark\:last\:tester:last-child {
    color: red;
  }
}
EOF
)

  assertEquals "$(sass dark-media.test.scss)" "$VALUE"
}
