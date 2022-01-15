#! /bin/sh

suite_addTest testColors

testColors() {
  INPUT=$(cat <<EOF
@use "../index" with (
  \$normalize: false,
  \$colors: (
    gray: #555555
  ),
  \$brand-colors: (),
  \$generators: (
    base: [color]
  ),
);
EOF
  );

    OUTPUT=$(cat <<EOF
.current-color {
  color: currentColor;
}

.gray-1 {
  color: #eeeeee;
}

.gray-2 {
  color: #cccccc;
}

.gray-3 {
  color: #aaaaaa;
}

.gray-4 {
  color: #888888;
}

.gray-5 {
  color: #555555;
}

.gray-6 {
  color: #444444;
}

.gray-7 {
  color: #333333;
}

.gray-8 {
  color: #222222;
}

.gray-9 {
  color: #111111;
}

EOF
  );

  assertEquals "$OUTPUT" "$(echo $INPUT | sass --stdin)"
}
