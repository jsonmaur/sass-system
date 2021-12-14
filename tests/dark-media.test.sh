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

.first\:tester:first-child {
  color: red;
}

@media (prefers-color-scheme: dark) {
  .dark\:tester {
    color: red;
  }

  .dark\:hover\:tester:hover {
    color: red;
  }

  .dark\:first\:tester:first-child {
    color: red;
  }
}
@media (min-width: 500px) {
  .sm\:tester {
    color: red;
  }

  .sm\:hover\:tester:hover {
    color: red;
  }

  .sm\:first\:tester:first-child {
    color: red;
  }
}
@media (min-width: 500px) and (prefers-color-scheme: dark) {
  .sm\:dark\:tester {
    color: red;
  }

  .sm\:dark\:hover\:tester:hover {
    color: red;
  }

  .sm\:dark\:first\:tester:first-child {
    color: red;
  }
}
EOF
)

  assertEquals "$(sass dark-media.test.scss)" "$VALUE"
}
