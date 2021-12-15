#! /bin/sh

suite_addTest testDarkModeClass

testDarkModeClass() {
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

.dark .dark\:tester {
  color: red;
}
.dark .dark\:first\:tester:first-child {
  color: red;
}
.dark .dark\:last\:tester:last-child {
  color: red;
}

@media (min-width: 400px) {
  .sm\:tester {
    color: red;
  }

  .sm\:disabled\:tester:disabled {
    color: red;
  }

  .dark .sm\:dark\:tester {
    color: red;
  }
  .dark .sm\:dark\:first\:tester:first-child {
    color: red;
  }
  .dark .sm\:dark\:last\:tester:last-child {
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

  .dark .md\:dark\:tester {
    color: red;
  }
  .dark .md\:dark\:first\:tester:first-child {
    color: red;
  }
  .dark .md\:dark\:last\:tester:last-child {
    color: red;
  }
}
EOF
)

  assertEquals "$(sass dark-class.test.scss)" "$VALUE"
}
