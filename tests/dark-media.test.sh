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
  .dark\:sm\:tester {
    color: red;
  }

  .dark\:sm\:last\:tester:last-child {
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
  .dark\:md\:tester {
    color: red;
  }

  .dark\:md\:last\:tester:last-child {
    color: red;
  }
}
EOF
)

  assertEquals "$(sass dark-media.test.scss)" "$VALUE"
}
