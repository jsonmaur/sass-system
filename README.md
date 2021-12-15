# Sass Style System

SSS is a highly customizable style system generator and utility-first CSS framework for quickly building user interfaces. Compare to frameworks such as [Tailwind](https://tailwindcss.com) and [Tachyons](https://tachyons.io), but with zero dependencies other than [dart-sass](https://sass-lang.com/dart-sass). Node and NPM are not required.

## Usaget

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
