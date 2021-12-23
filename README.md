<br /> <br /> <br />

<div align="center">
  <img src=".github/logo.svg" alt="sss logo" width="200" />
</div>

<br /> <br /> <br />

<p align="center">
  A style system generator and utility-first CSS framework built in Sass.
</p>

<p align="center">
  <a aria-label="test status" href="https://github.com/maurandco/sss/actions/workflows/test.yml">
    <img alt="test" src="https://img.shields.io/github/workflow/status/maurandco/sss/test.yml?label=test&style=flat-square" />
  </a>

  <a aria-label="version status" href="https://github.com/maurandco/sss/releases">
    <img alt="version" src="https://img.shields.io/github/v/release/maurandco/sss?display_name=tag&style=flat-square&color=B85A8A" />
  </a>
</p>

<br /> <br /> <br />

## Features

- Highly customizable style system.
- Beautiful defaults for color, shadow, scale, and typography.
- Resonsive-first classes with configurable breakpoints.
- Support for dark mode classes and media queries.
- Stacked pseudo selectors for precision styling.
- Automatic color scale generator for custom colors.
- Easily extended with mixins and custom Sass.
- Add or remove classes from build as needed.
- 0kB gzipped and 0kB brotli'd for default build.

## Why?

Sass Style System was inspired by similar functional CSS frameworks such as TailwindCSS and Tachyons, but it comes with the power of a CSS preprocessor and zero dependencies other than [dart-sass](https://sass-lang.com/dart-sass) (which is fast and self-contained). As opposed to dealing with a Node build system and PostCSS with its plethora of plugins.

## Installation

If you don't need any customization and want to start using the utility classes right away, you can link directly to the default build in your HTML.

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sss@0.1/index.min.css" />
```

If you want to customize your build, you'll need to install sss into your project using one of these methods.

- [Download the latest release](https://github.com/maurandco/sss/releases)
- Install with [hex](https://hex.pm) (Elixir): _not supported yet_
- Install with [gem](https://rubygems.org) (Ruby): _not supported yet_
- Install with [pip](https://pypi.org) (Python): _not supported yet_
- Install with [npm](https://www.npmjs.com) (Node): _not supported yet_

## Usage

```sass
@use "sss";
```

That's it! All the utility classes will now be included in your CSS output.

```html
<div class="measure-narrow bg-gray-1">
  <h1 class="text-xxl text-heavy pink-5 mb-4">
    Welcome to Sass Style System!
  </h1>

  <p class="text-sm text-light">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
    ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
    ullamco laboris nisi ut aliquip ex ea commodo consequat.
  </p>
</div>
```

## Customization

Every value of sss can be configured by adding `with ()` to the end of the use statement with a map of your customization values. All custom values will **override the defaults** unless they are configured within the [$extend](#extend) map.

```sass
// example customization
@use "sss" with (
  $normalize: false,
  $dark-mode: class,
  $primary-fonts: (
    sans-serif: "Fira Sans",
    monospace: "Fira Mono",
  ),
  $extend: (
    colors: (
      off-black: #202020,
    ),
  ),
);
```

- [$normalize](#normalize)
- [$class-prefix](#class-prefix)
- [$separator](#separator)
- [$dark-mode](#dark-mode)
- [$screens](#screens)
- [$measures](#measures)
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
- [$auto-colors](#auto-colors)
- [$selectors](#selectors)
- [$generators](#generators)
- [$extend](#extend)

### Normalize

Whether to import [modern-normalize](https://github.com/sindresorhus/modern-normalize) and some other [opinionated normalize rules](lib/normalize.scss) at the top of the stylesheet.

> key: `$normalize`  
> type: `boolean`  
> default: `true`

### Class Prefix

A value that gets prefixed to every generated class name. e.g. If set to `sss-`, generated classes will look like `.sss-bg-black`.

> key: `$class-prefix`  
> type: `string`  
> default: none

### Separator

A value used to separate base class names from variants such as dark, hover, responsive, etc. Using the default value of an escaped colon will generate classes such as `.sm\:dark\:bg-black`.

> key: `$separator`  
> type: `string`  
> default: `\\:`

### Dark Mode

Enables dark mode classes using media queries or a parent class. Setting to `media` will create classes within a `prefers-color-scheme: dark` media query, and setting to `class` will create classes under a parent `.dark` class such as `.dark .dark\:bg-black`.

> key: `$dark-mode`  
> type: `string`  
> default: `media`

### Screens

A map of named screen size values which are used to generate responsive mixins and classes.

> key: `$screens`  
> type: `map`  
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

### Measures

Named width values used for paragraph and other containers.

> key: `$measures`  
> type: `map`  
> default:
> ```sass
> (
>   narrow: 20em,
>   regular: 30em,
>   wide: 34em,
> )
> ```

### Spacing

Spacing values used for margin and padding. Classes correspond with index in list.

> key: `$spacing`  
> type: `list`  
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

### Primary Fonts

Primary fonts for each type of font stack, to avoid redefining the font stacks from scratch.

> key: `$primary-fonts`  
> type: `map`  
> default:
> ```sass
> (
>   serif: null,
>   sans-serif: null,
>   monospace: null,
> )
> ```

### Font Stacks

Named values for font family with the associated primary font prepended if it exists.

> key: `$font-stacks`  
> type: `map`  
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

### Font Weights

Named values for font weight.

> key: `$font-weights`  
> type: `map`  
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

### Font Sizes

Named values for font size.

> key: `$font-sizes`  
> type: `map`  
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

### Font Leading

Named values for font leading (line spacing).

> key: `$font-leading`  
> type: `map`  
> default:
> ```sass
> (
>   solid: 1em,
>   title: 1.25em,
>   copy: 1.5em,
> )
> ```

### Font Tracking

Named values for font tracking (letter spacing).

> key: `$font-tracking`  
> type: `map`  
> default:
> ```sass
> (
>   tight: -.05em,
>   open: .1em,
>   mega: .25em,
> )
> ```

### Text Indent

Value used for text indentation.

> key: `$text-indent`  
> type: `number`  
> default: `1em`

### Box Shadows

Named values for box shadow.

> key: `$box-shadows`  
> type: `map`  
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

### Colors

Named values for color. The color classes are not prefixed with anything, so be careful while naming to avoid conflicts with other generated classes. e.g. `black` creates a `.black` class.

> key: `$colors`  
> type: `map`  
> default:
> ```sass
> (
>   black: #000000,
>   white: #ffffff,
> )
> ```

### Auto Colors

Named values for colors that have auto-generated variations. By default, it will generate 4 darker variations and 4 lighter variations of each color for a total of 9. The base color will exist as `.[name]-5` with `.[name]-[1-4]` for darker variations and `.[name]-[6-9]` for lighter variations.

> key: `$auto-colors`  
> type: `map`  
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

### Selectors

Named values for selectors that can be used when adding generators, and the associated suffix for the class. The selector name can be a space-separated list for nested selectors. e.g. `hover disabled: ":hover:disabled"` will create `.hover\:disabled\:classname:hover:disabled`. Using a space in the key name is to ensure the configured `$separator` is used in the class.

> key: `$selectors`  
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

### Generators

Rather than include everything up front to be removed later, we add in rules as needed to keep the file size down.

Classname generators to include for each selector type. Deciding what to include before building rather than removing afterwards cuts down on build system complexity, and helps cut down the final CSS file size. Since every class name could potentially have a base class, a base dark class, classes within media queries for for each of the 5 screen sizes (depending on how many screens are configured), and dark classes for each of those media queries. It adds up very quickly, and we want to keep stuff out of the build unless it's needed.

See `$selectors` for a list of available selectors. Use the `dark` selector to support dark classes, and the `responsive` selector or individual screen selectors (such as `sm` and `md`) for responsive classes. Responsive dark classes can be enabled with the nested `dark` selector within `responsive` or the individual screen selectors. To avoid copying the same lists over and over if multiple selectors are used, user can use a Sass variable.
 
[All Generators](lib/generators#readme)

> key: `$generators`  
> type: `map`  
> default:
> ```sass
> (
>   base: [
>     background-color
>     box-shadow
>     box-sizing
>     color
>     font-family
>     font-size
>     font-style
>     font-variant
>     font-weight
>     letter-spacing
>     line-height
>     margin
>     max-width
>     opacity
>     padding
>     text-align
>     text-decoration
>     text-indent
>     text-overflow
>     text-transform
>     vertical-align
>     white-space
>     width
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

### Extend

Append custom values to config maps/lists rather than replace them.

> key: `$extend`  
> type: `map`  
> default: none
