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

.first\:tester:first-child {
  color: red;
}

.dark .dark\:tester {
  color: red;
}
.dark .dark\:hover\:tester:hover {
  color: red;
}
.dark .dark\:first\:tester:first-child {
  color: red;
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

  .dark .sm\:dark\:tester {
    color: red;
  }
  .dark .sm\:dark\:hover\:tester:hover {
    color: red;
  }
  .dark .sm\:dark\:first\:tester:first-child {
    color: red;
  }
}
EOF
)

  assertEquals "$(sass dark-class.test.scss)" "$VALUE"
}
