<div align="center">
  ⚠️ <b>This project is still under active development. Check back soon for a stable release!</b>
</div>

<br /> <br /> <br /> <br />

<div align="center">
  <img src=".github/logo.svg" alt="ssbuild logo" width="300" />
</div>

<br /> <br />

<p align="center">
  A style system generator and utility-first CSS framework built in Sass.
</p>

<p align="center">
  <a aria-label="test status" href="https://github.com/maurandco/ssbuild/actions/workflows/test.yml">
    <img alt="test" src="https://img.shields.io/github/workflow/status/maurandco/ssbuild/Test?label=tests&style=flat-square" />
  </a>

  <a aria-label="version status" href="https://github.com/maurandco/ssbuild/releases">
    <img alt="version" src="https://img.shields.io/github/v/release/maurandco/ssbuild?display_name=tag&style=flat-square&color=B85A8A" />
  </a>
</p>

<br /> <br /> <br /> <br />

<details>
  <summary><b>Table of contents</b></summary>

  - [Features](#features)
  - [Why?](#why)
  - [Installation](#installation)
  - [Usage](#usage)
    - [Custom Classes](#custom-classes)
  - [Configuration](#configuration)
    - [Normalize](#normalize)
    - [Class Prefix](#class-prefix)
    - [Separator](#separator)
    - [Dark Mode](#dark-mode)
    - [Screens](#screens)
    - [Sizing](#sizing)
    - [Spacing](#spacing)
    - [Primary Fonts](#primary-fonts)
    - [Font Stacks](#font-stacks)
    - [Font Weights](#font-weights)
    - [Font Sizes](#font-sizes)
    - [Font Leading](#font-leading)
    - [Font Tracking](#font-tracking)
    - [Text Indent](#text-indent)
    - [Box Shadows](#box-shadows)
    - [Colors](#colors)
    - [Brand Colors](#brand-colors)
    - [Selectors](#selectors)
    - [Generators](#generators)
    - [Extend](#extend)
  - [Getters](#getters)
  - [Media Queries](#media-queries)
  - [(Auto)Prefixer](#autoprefixer)
  - [Acknowledgements](#acknowledgements)
</details>

## Features

- Highly customizable style system.
- Resonsive-first & utility-first classes.
- Support for dark mode utility classes.
- Beautiful presets for color, shadow, scale, and typography.
- Stacked pseudo selector classes for precision styling.
- Color scale generator for custom colors.
- Easily extended with custom Sass.
<!-- - 0kB gzipped and 0kB brotli'd for default build. -->

## Why?

ssbuild was inspired by similar utility-first CSS frameworks such as TailwindCSS and Tachyons, but it comes with the power of a CSS preprocessor and zero dependencies other than [dart-sass](https://sass-lang.com/dart-sass) (which is fast and self-contained). As opposed to dealing with a Node build system, an "Electron for CLI's" binary, or PostCSS with its plethora of plugins.

## Installation

If you don't need any customization and want to start using the utility classes right away, you can link directly to the default build in your HTML:

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ssbuild/core@0.0/index.min.css" />
```

If you want to customize your build, you'll need to install ssbuild into your project using one of these methods:

- [Download the latest release](https://github.com/maurandco/ssbuild/releases)
- Install with [hex](https://hex.pm) (Elixir): _not supported yet_
- Install with [gem](https://rubygems.org) (Ruby): _not supported yet_
- Install with [pip](https://pypi.org) (Python): _not supported yet_
- Install with [npm](https://www.npmjs.com) (Node): `npm install @ssbuild/core`

## Usage

```scss
@use "path/to/ssbuild";
```

Use [--load-path](https://sass-lang.com/documentation/cli/dart-sass#load-path) to include the vendor directory for your package management (could be `vendor`, `deps`, `node_modules`, etc.). Then point Sass to the ssbuild directory relative to the vendor directory. That's it! All the utility classes will now be included in your CSS output.

```html
<div class="m-5 p-5 bg-gray-8 max-w-6 md:max-w-7">
  <h1 class="mb-4 pink-5 text-xxl text-heavy">
    Welcome to ssbuild!
  </h1>

  <p class="text-sm text-light lead-copy">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
    ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
    ullamco laboris nisi ut aliquip ex ea commodo consequat.
  </p>
</div>
```

### Custom Classes

If you find yourself frequently reusing utility classes and want to extract common components into custom classes, you can use the [@extend](https://sass-lang.com/documentation/at-rules/extend) syntax:

```scss
.text-container {
  @extend .m-5;
  @extend .p-5;
  @extend .bg-gray-8;
  @extend .max-w-6;
  @extend .md\:max-w-7;
}
```

But due to the way `@extend` works, this can create an obscene amount of class names if used too often. A better solution is to access style system values directly using [getters](#getters):

```scss
@use "path/to/ssbuild" as ss;

.text-container {
  background-color: ss.color(gray-8);
  max-width: ss.size(6);
  padding: ss.space(5);
  margin: ss.space(5);

  @include ss.media-up-to(md) {
    max-width: ss.size(7);
  }
}
```

## Configuration

```sass
@use "path/to/ssbuild" with (
  $primary-fonts: (
    sans-serif: "Fira Sans",
    monospace: "Fira Mono",
  ),
  $extend: (
    brand-colors: (
      off-black: #202020,
    ),
  ),
);
```

_Note that all custom values will **override the defaults** unless they are configured within the [$extend](#extend) map._

- [$normalize](#normalize)
- [$class-prefix](#class-prefix)
- [$separator](#separator)
- [$dark-mode](#dark-mode)
- [$screens](#screens)
- [$sizing](#sizing)
- [$spacing](#spacing)
- [$primary-fonts](#primary-fonts)
- [$font-stacks](#font-stacks)
- [$font-weights](#font-weights)
- [$font-sizes](#font-sizes)
- [$font-leading](#font-leading)
- [$font-tracking](#font-tracking)
- [$text-indent](#text-indent)
- [$box-shadows](#box-shadows)
- [$colors](#colors)
- [$brand-colors](#brand-colors)
- [$selectors](#selectors)
- [$generators](#generators)
- [$extend](#extend)

### Normalize

<details>
  <summary><i>specs</i></summary>

  > type: `boolean`  
  > default: `true`
</details>

Whether to import [modern-normalize](https://github.com/sindresorhus/modern-normalize) and some other [opinionated normalize rules](lib/normalize.scss) at the top of your stylesheet.

### Class Prefix

<details>
  <summary><i>specs</i></summary>

  > type: `string`  
  > default: none
</details>

Used to prefix a value to every generated class name. This is turned off by default, so classes will look like `.bg-black`. e.g. If set to `ss-`, classes will look like `.ss-bg-black`.

### Separator

<details>
  <summary><i>specs</i></summary>

  > type: `string`  
  > default: `\\:`
</details>

Used to separate base class names from variants such as dark selectors, pseudo selectors, and responsive selectors. Using the default value of an escaped colon will generate classes such as `.sm\:dark\:bg-black`, which can be used as `<div class="sm:dark:bg-black">`.

### Dark Mode

<details>
  <summary><i>specs</i></summary>

  > type: `string`  
  > default: `media`
</details>

Enables dark mode classes using media queries or a parent class. Setting to `media` will create classes within `@media (prefers-color-scheme: dark)`, and setting to `class` will create classes under a parent `.dark` class such as `.dark .dark\:bg-black`.

### Screens

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `screen($name)`  
  > default:
  > ```sass
  > (
  >   xs: 640px,
  >   sm: 768px,
  >   md: 1024px,
  >   lg: 1280px,
  >   xl: 1792px,
  > )
  > ```
</details>

Named screen size values which are used to generate responsive classes within media queries such as `.md\:bg-black`. These key names cannot be used for screen sizes due to conflicts with [width](lib/generators/width#readme) classes: `0`, `px`, `full`, `screen`, `min`, `max`, `fit`, `auto`

### Sizing

<details>
  <summary><i>specs</i></summary>

  > type: `list`  
  > getter: `size($index)`  
  > default:
  > ```sass
  > [
  >   1rem
  >   2rem
  >   4rem
  >   8rem
  >   16rem
  >   32rem
  >   48rem
  >   64rem
  > ]
  > ```
</details>

Named width values used for paragraphs and other sized containers. These classes are prefixed with `.w-*`, `.max-w-*`, `.h-*`, and `.max-h-*`. See the [width generator](lib/generators/width#readme), [max-width generator](lib/generators/max-width#readme), [height generator](lib/generators/height#readme), and [max-height generator](lib/generators/max-height#readme) for more info.

### Spacing

<details>
  <summary><i>specs</i></summary>

  > type: `list`  
  > getter: `space($index)`  
  > default:
  > ```sass
  > [
  >   .25rem,
  >   .5rem,
  >   1rem,
  >   2rem,
  >   4rem,
  >   8rem,
  >   16rem,
  >   32rem,
  > ]
  > ```
</details>

Spacing values used for margin and padding. Class names correspond with the list index starting at 1. e.g. `.m-1` will correspond to `margin: .25rem`, and `.p-8` will correspond to `padding: 32rem`. These classes are prefixed with `.m-*` and `.p-*`. See the [margin generator](lib/generators/margin#readme) and [padding generator](lib/generators/padding#readme) for more info.

### Primary Fonts

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > default:
  > ```sass
  > (
  >   serif: null,
  >   sans-serif: null,
  >   monospace: null,
  > )
  > ```
</details>

A primary font can be set for each type of font stack, such as `monospace: "Fira Mono"`, which prepends to the default font stack of that same type. This avoids having to redefine entire system font stacks from scratch just to add a custom font.

### Font Stacks

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `font($name)`  
  > default:
  > ```sass
  > (
  >   serif: [
  >     ui-serif,
  >     Georgia,
  >     Cambria,
  >     "Times New Roman",
  >     Times,
  >     serif,
  >     "Apple Color Emoji",
  >     "Segoe UI Emoji",
  >     "Segoe UI Symbol",
  >     "Noto Color Emoji",
  >   ],
  >   sans-serif: [
  >     ui-sans-serif,
  >     system-ui,
  >     -apple-system,
  >     BlinkMacSystemFont,
  >     "Segoe UI",
  >     Roboto,
  >     "Helvetica Neue",
  >     Arial,
  >     "Noto Sans",
  >     sans-serif,
  >     "Apple Color Emoji",
  >     "Segoe UI Emoji",
  >     "Segoe UI Symbol",
  >     "Noto Color Emoji",
  >   ],
  >   monospace: [
  >     ui-monospace,
  >     SFMono-Regular,
  >     Menlo,
  >     Monaco,
  >     Consolas,
  >     "Liberation Mono",
  >     "Courier New",
  >     monospace,
  >     "Apple Color Emoji",
  >     "Segoe UI Emoji",
  >     "Segoe UI Symbol",
  >     "Noto Color Emoji",
  >   ],
  > )
  > ```
</details>

Named list values for font family stacks. Rather than redefining entire font stacks to specify a single custom font, it's recommended to specify a [primary font](#primary-fonts) instead. These classes **do not** have a prefix, so make sure there are no key conflicts with [$brand-colors](#brand-colors). See the [font-family generator](lib/generators/font-family#readme) for more info.

### Font Weights

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `font-weight($name)`  
  > default:
  > ```sass
  > (
  >   thin: 100,
  >   extra-light: 200,
  >   light: 300,
  >   regular: 400,
  >   medium: 500,
  >   semi-bold: 600,
  >   bold: 700,
  >   extra-bold: 800,
  >   heavy: 900,
  > )
  > ```
</details>

Named values used for font weight. These classes are prefixed with `.text-*`, so make sure there are no key conflicts with [$font-sizes](#font-sizes). See the [font-weight generator](lib/generators/font-weight#readme) for more info.

### Font Sizes

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `font-size($name)`  
  > default:
  > ```sass
  > (
  >   xxs: .75rem,
  >   xs: .875rem,
  >   sm: 1rem,
  >   md: 1.25rem,
  >   lg: 1.5rem,
  >   xl: 2.25rem,
  >   xxl: 3rem,
  >   jumbo: 6rem,
  > )
  > ```
</details>

Named values used for font size. These classes are prefixed with `.text-*`, so make sure there are no key conflicts with [$font-weights](#font-weights). See the [font-size generator](lib/generators/font-size#readme) for more info.

### Font Leading

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `font-lead($name)`  
  > default:
  > ```sass
  > (
  >   solid: 1em,
  >   title: 1.25em,
  >   copy: 1.5em,
  > )
  > ```
</details>

Named values used for font leading (line height). These classes are prefixed with `.lead-*`. See the [line-height generator](lib/generators/line-height#readme) for more info.

### Font Tracking

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `font-track($name)`  
  > default:
  > ```sass
  > (
  >   tight: -.05em,
  >   open: .1em,
  >   mega: .25em,
  > )
  > ```
</details>

Named values used for font tracking (letter spacing). These classes are prefixed with `.track-*`. See the [letter-spacing generator](lib/generators/letter-spacing#readme) for more info.

### Text Indent

<details>
  <summary><i>specs</i></summary>

  > type: `number`  
  > default: `1em`
</details>

Value used for the text indentation class. See the [text-indent generator](lib/generators/text-indent#readme) for more info.

### Box Shadows

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `box-shadow($name)`  
  > default:
  > ```sass
  > (
  >   low: (0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)),
  >   mid: (0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)),
  >   high: (0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1)),
  >   mega: 0 25px 50px -12px rgb(0 0 0 / 0.25),
  >   inner: inset 0 2px 4px 0 rgb(0 0 0 / 0.05),
  > )
  > ```
</details>

Named values used for box shadow. These classes are prefixed with `.shadow-*`. See the [box-shadow generator](lib/generators/box-shadow#readme) for more info.

### Colors

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `color($name-$index)`  
  > default:
  > ```sass
  > (
  >   gray: #adb5bd,
  >   cyan: #0dcaf0,
  >   teal: #20c997,
  >   green: #198754,
  >   yellow: #ffc107,
  >   orange: #fd7e14,
  >   red: #dc3545,
  >   pink: #d63384,
  >   purple: #6f42c1,
  >   indigo: #6610f2,
  >   blue: #0d6efd,
  > )
  > ```
</details>

Named values for colors that get auto-generated variations. 4 darker variations and 4 lighter variations will be generated for each color, for a total of 9 colors per key. These classes are prefixed with the color name. The base color will exist as `.[name]-5` with `.[name]-[1-4]` for lighter variations and `.[name]-[6-9]` for darker variations. See the [color generator](lib/generators/color#readme) and [background-color generator](lib/generators/background-color#readme) for more info.

### Brand Colors

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > getter: `color($name)`  
  > default:
  > ```sass
  > (
  >   black: #000000,
  >   white: #ffffff,
  > )
  > ```
</details>

Named values for brand colors that don't have auto-generated variations. These classes **do not** have a prefix, e.g. `black` creates a `.black` class. Make sure there are no key conflicts with [$font-stacks](#font-stacks). See the [color generator](lib/generators/color#readme) and [background-color generator](lib/generators/background-color#readme) for more info.

### Selectors

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > default:
  > ```sass
  > (
  >   // pseudo classes
  >   hover: ":hover",
  >   focus: ":focus",
  >   focus-within: ":focus-within",
  >   focus-visible: ":focus-visible",
  >   active: ":active",
  >   visited: ":visited",
  >   target: ":target",
  >   first: ":first-child",
  >   last: ":last-child",
  >   only: ":only-child",
  >   odd: ":nth-child(odd)",
  >   even: ":nth-child(even)",
  >   first-of-type: ":first-of-type",
  >   last-of-type: ":last-of-type",
  >   only-of-type: ":only-of-type",
  >   empty: ":empty",
  >   disabled: ":disabled",
  >   checked: ":checked",
  >   indeterminate: ":indeterminate",
  >   default: ":default",
  >   required: ":required",
  >   valid: ":valid",
  >   invalid: ":invalid",
  >   in-range: ":in-range",
  >   out-of-range: ":out-of-range",
  >   placeholder-shown: ":placeholder-shown",
  >   autofill: ":autofill",
  >   read-only: ":read-only",
  >   rtl: ":dir(rtl)",
  >   ltr: ":dir(ltr)",
  >   // pseudo elements
  >   before: "::before",
  >   after: "::after",
  >   first-letter: "::first-letter",
  >   first-line: "::first-line",
  >   marker: "::marker",
  >   selection: "::selection",
  >   file: "::file-selector-button",
  >   placeholder: "::placeholder",
  >   // attribute selectors
  >   open: "[open]",
  >   // nested selectors
  >   hover disabled: ":hover:disabled",
  >   hover before: ":hover::before",
  >   hover after: ":hover::after",
  > )
  > ```
</details>

All the selectors that can be specified in [generators](#generators), and the associated suffix for the classes. The key is used in the class name, and the value is used as the selector. e.g. If the `first` selector is enabled for a generator, it will create classes such as `.first\:bg-black:first-child`.

The selector name can also be a space-separated list for nested selectors. e.g. `hover first: ":hover:first-child"` will create `.hover\:first\:classname:hover:first-child` classes. We included a few by default, but add your own using [$extend](#extend) as needed. Using a space in the key name is to ensure the configured `$separator` is used in the generated class.

### Generators

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > default:
  > ```sass
  > (
  >   base: [
  >     background-color box-shadow box-sizing color font-family font-size font-style font-variant
  >     font-weight height letter-spacing line-height margin max-height max-width min-height
  >     min-width opacity padding text-align text-decoration text-indent text-overflow
  >     text-transform vertical-align white-space width
  >   ],
  >   hover: [],
  >   dark: (
  >     base: [],
  >   ),
  >   responsive: (
  >     base: [],
  >     dark: (
  >       base: [],
  >     ),
  >   ),
  > )
  > ```
</details>

Rather than include every single possible utility class in the final CSS (which would result in an enormous file), you can add or remove specific classes in the config—which we call "generators". Not using dark mode? Set those generators to an empty list. Want to add utility classes for a specific pseudo selector, or even nested pseudo selectors? Add those to the generators list. We added some sane defaults that will work for most sites, but you will need to add custom generator lists for anything beyond that.

This is different from other systems like Tailwind, which use a just-in-time method where a file watcher scans your HTML files for classes being used and includes them in the outputted CSS. We decided to leave that up to the configuration. It's a bit more work on the developer's side to manually include the class variations they need, but it's more predicable in the end.

See [selectors](#selectors) for a list of available selectors. `dark` can be set to a nested list of selectors to support dark classes, and `responsive` (or individual screens such as `sm` and `md`) can be set to a nested list to support responsive classes. Dark responsive classes can be enabled with by setting `dark` to a nested list _within_ `responsive`. If you find yourself with duplicated lists of generators, simply use a Sass variable.

[See all the available generators.](lib/generators#readme)

### Extend

<details>
  <summary><i>specs</i></summary>

  > type: `map`  
  > default: none
</details>

This can be used to append custom values onto config maps and lists while retaining the existing values. For example:

```sass
$extend: (
  screens: (
    xxl: 2304px,
  ),
)
```

Will result in these screens:

```sass
(
  xs: 640px,
  sm: 768px,
  md: 1024px,
  lg: 1280px,
  xl: 1792px,
  xxl: 2304px,
)
```

_Note that key names nested within `$extend` are **not** prefixed with `$`._

## Getters

These functions are useful for getting style system values inside [custom classes](#custom-classes).

- `screen($name)` to get values from [$screens](#screens)
- `size($name)` to get values from [$sizing](#sizing)
- `space($index)` to get values from [$spacing](#spacing)
- `font($name)` to get values from [$font-stacks](#font-stacks)
- `font-weight($name)` to get values from [$font-weights](#font-weights)
- `font-size($name)` to get values from [$font-sizes](#font-sizes)
- `font-lead($name)` to get values from [$font-leading](#font-leading)
- `font-track($name)` to get values from [$font-tracking](#font-tracking)
- `box-shadow($name)` to get values from [$box-shadows](#box-shadows)
- `color($name-$index)` to get values from [$colors](#colors)
- `color($name)` to get values from [$brand-colors](#brand-colors)

For example:

```scss
.foobar {
  color: ssbuild.color(gray-8);
  padding: ssbuild.space(4);
}
```

Will result in:

```css
.foobar {
  color: #e6e9eb;
  padding: 2rem;
}
```

## Media Queries

These mixins are useful for defining custom breakpoints using the sizes from [$screens](#screens). For example:

```scss
.foobar {
  padding: ssbuild.space(4);

  @include ssbuild.media-up-to(md) {
    padding: ssbuild.space(5);
  }
}
```

Will result in:

```css
.foobar {
  padding: 2rem;
}

@media (min-width: 1024px) {
  .foobar {
    padding: 4rem;
  }
}
```

<details>
  <summary><code>media-up-to($screen)</code></summary>

  Generates a media query using `min-width` (the given screen size or _larger_):

  ```scss
  @include ssbuild.media-up-to(md) {}
  ```

  Will result in:

  ```css
  @media (min-width: 1024px) {}
  ```
</details>

<details>
  <summary><code>media-down-to($screen)</code></summary>

  Generates a media query using `max-width` (the given screen size or _smaller_) with 0.5px subtracted from the screen size:

  ```scss
  @include ssbuild.media-down-to(md) {}
  ```

  Will result in:

  ```css
  @media (max-width: 1023.5px) {}
  ```
</details>

<details>
  <summary><code>media-only($screen)</code></summary>

  Generates a media query using `min-width` and `max-width` to target a single screen size:

  ```scss
  @include ssbuild.media-only(md) {}
  ```

  Will result in:

  ```css
  @media (min-width: 1024px) and (max-width: 1279.5px) {}
  ```
</details>

<details>
  <summary><code>media-between($screen1, $screen2)</code></summary>

  Generate a media query using `min-width` and `max-width` to target screen sizes between the two specified:

  ```scss
  @include ssbuild.media-between(sm, lg) {}
  ```

  Will result in:

  ```css
  @media (min-width: 768px) and (max-width: 1279.5px) {}
  ```
</details>

## (Auto)Prefixer

Since [Autoprefixer](https://github.com/postcss/autoprefixer) requires a post-processor and Sass is a pre-processor, there is no straightforward way to implement automatic vendor prefixing. This is automatically taken care of for ssbuild utility classes, but for custom classes you will need to add the necessary prefixes manually or use these mixins.

Prefixing is becoming less and less of a concern with modern browsers, so these mixins will continue to be deprecated as they are no longer needed in the future. For now, using mixins in place of the following rules should be sufficient for most use cases.

For example:

```scss
.foobar {
  @include ssbuild.prefix-transform(rotate(90deg));
}
```

Will result in:

```css
.foobar {
  -webkit-transform: rotate(90deg);
  -ms-transform: rotate(90deg);
  transform: rotate(90deg);
}
```

<details>
  <summary><code>prefix-animation($value)</code></summary>

  Adds `-webkit` prefix to `animation: $value;`.
</details>

<details>
  <summary><code>prefix-appearance($value)</code></summary>

  Adds `-webkit` and `-ms` prefixes to `appearance: $value;`.
</details>

<details>
  <summary><code>prefix-background-clip($value)</code></summary>

  Adds `-webkit` prefix to `background-clip: $value;`.
</details>

<details>
  <summary><code>prefix-filter($value)</code></summary>

  Adds `-webkit` prefix to `filter: $value;`.
</details>

<details>
  <summary><code>prefix-flexbox</code></summary>

  Adds `-webkit`, `-moz`, and `-ms` prefixes to `display: flex;`.
</details>

<details>
  <summary><code>prefix-flexbox-inline</code></summary>

  Adds `-webkit`, `-moz`, and `-ms` prefixes to `display: inline-flex;`.
</details>

<details>
  <summary><code>prefix-flex($value)</code></summary>

  Adds `-webkit` and `-ms` prefixes to `flex: $value;`.
</details>

<details>
  <summary><code>prefix-grid</code></summary>

  Adds `-ms` prefix to `display: grid;`.
</details>

<details>
  <summary><code>prefix-keyframes($name)</code></summary>

  Adds `-webkit` prefix to `@keyframes($name) { }`. This mixin requires content:

  ```scss
  @include ssbuild.prefix-keyframes(slidein) {
    from { @include ssbuild.prefix-transform(translateX(0%)); }
    to { @include ssbuild.prefix-transform(translateX(100%)); }
  }
  ```
</details>

<details>
  <summary><code>prefix-object-fit($value)</code></summary>

  Adds `-o` prefix to `object-fit: $value;`.
</details>

<details>
  <summary><code>prefix-transform($value)</code></summary>

  Adds `-webkit` and `-ms` prefixes to `transform: $value;`
</details>

<details>
  <summary><code>prefix-user-select($value)</code></summary>

  Adds `-webkit`, `-moz`, and `-ms` prefixes to `user-select: $value;`.
</details>

## Acknowledgements

Created by [Maur & Co.](https://maur.co)
