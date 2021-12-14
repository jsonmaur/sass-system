# Sass Style System

SSS is a highly customizable style system generator and utility-first CSS framework for quickly building user interfaces. Similar to frameworks such as Tailwind or Tachyons, but with zero dependencies other than Sass itself. Node and NPM are not required.

## Usage

```sass
@use "sss" with (
  $screens: (
    sm: 576px,
    md: 768px,
    lg: 992px,
    xl: 1200px,
    xxl: 1400px
  )
);
```
