<br /> <br /> <br />

<div align="center">
  <img src=".github/logo.svg" alt="SSS Logo" width="200" />
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
- 10kB gzipped and 8kB brotli'd for default build.

### Why?

SSS was inspired by similar functional CSS frameworks such as TailwindCSS and Tachyons, but it comes with the power of a CSS preprocessor and zero dependencies other than [dart-sass](https://sass-lang.com/dart-sass) (which is fast and self-contained). As opposed to dealing with a Node build system and PostCSS with its plethora of plugins.

## Install

### Default Build

If you don't need any customization and want to use the utility classes right away, you can link directly to the default build in your HTML.

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sss@0.1/index.min.css" />
```

### Custom Build

If you want to customize your build, you'll need to install the Sass source code into your project using any of the following methods.

- [Download the latest release](https://github.com/maurandco/sss/releases)
- Install with [hex](https://hex.pm) (Elixir): _not supported yet_
- Install with [gem](https://rubygems.org) (Ruby): _not supported yet_
- Install with [pip](https://pypi.org) (Python): _not supported yet_
- Install with [npm](https://www.npmjs.com) (Node): _not supported yet_

## Usage

```scss
@use "sss" with (
  $config_name: config_value,
);
```

## Configuration

- [normalize](#normalize)
- [class-prefix](#class-prefix)
- [separator](#separator)
- [dark-mode](#dark-mode)
- [screens](#screens)
- [measures](#measures)
- [spacing](#spacing)
- [primary-fonts](#primary-fonts)
- [font-stacks](#font-stacks)
- [font-weights](#font-weights)
- [font-sizes](#font-sizes)
- [font-leading](#font-leading)
- [font-tracking](#font-tracking)
- [text-indent](#text-indent)
- [box-shadows](#box-shadows)
- [colors](#colors)
- [auto-colors](#auto-colors)
- [selectors](#selectors)
- [generators](#generators)
- [extending](#extending)

### Normalize

### Class Prefix

### Separator

### Dark Mode

### Screens

### Measures

### Spacing

### Primary Fonts

### Font Stacks

### Font Weights

### Font Sizes

### Font Leading

### Font Tracking

### Text Indent

### Box Shadows

### Colors

### Auto Colors

### Selectors

### Generators

Rather than include everything up front to be removed later, we add in rules as needed to keep the file size down.

### Extending

## Remaining Rules

- `align-content`
- `align-items`
- `align-self`
- `all`
- `animation`
- `animation-delay`
- `animation-direction`
- `animation-duration`
- `animation-fill-mode`
- `animation-iteration-count`
- `animation-name`
- `animation-play-state`
- `animation-timing-function`
- `backface-visibility`
- `background`
- `background-attachment`
- `background-blend-mode`
- `background-clip`
- `background-image`
- `background-origin`
- `background-position`
- `background-repeat`
- `background-size`
- `border`
- `border-bottom`
- `border-bottom-color`
- `border-bottom-left-radius`
- `border-bottom-right-radius`
- `border-bottom-style`
- `border-bottom-width`
- `border-collapse`
- `border-color`
- `border-image`
- `border-image-outset`
- `border-image-repeat`
- `border-image-slice`
- `border-image-source`
- `border-image-width`
- `border-left`
- `border-left-color`
- `border-left-style`
- `border-left-width`
- `border-radius`
- `border-right`
- `border-right-color`
- `border-right-style`
- `border-right-width`
- `border-spacing`
- `border-style`
- `border-top`
- `border-top-color`
- `border-top-left-radius`
- `border-top-right-radius`
- `border-top-style`
- `border-top-width`
- `border-width`
- `bottom`
- `box-decoration-break`
- `break-after`
- `break-before`
- `break-inside`
- `caption-side`
- `caret-color`
- `clear`
- `clip`
- `column-count`
- `column-fill`
- `column-gap`
- `column-rule`
- `column-rule-color`
- `column-rule-style`
- `column-rule-width`
- `column-span`
- `column-width`
- `columns`
- `content`
- `counter-increment`
- `counter-reset`
- `cursor`
- `direction`
- `display`
- `empty-cells`
- `filter`
- `flex`
- `flex-basis`
- `flex-direction`
- `flex-flow`
- `flex-grow`
- `flex-shrink`
- `flex-wrap`
- `float`
- `font`
- `font-feature-settings`
- `font-kerning`
- `font-language-override`
- `font-size-adjust`
- `font-stretch`
- `font-synthesis`
- `font-variant-alternates`
- `font-variant-caps`
- `font-variant-east-asian`
- `font-variant-ligatures`
- `font-variant-numeric`
- `font-variant-position`
- `gap`
- `grid`
- `grid-area`
- `grid-auto-columns`
- `grid-auto-flow`
- `grid-auto-rows`
- `grid-column`
- `grid-column-end`
- `grid-column-gap`
- `grid-column-start`
- `grid-gap`
- `grid-row`
- `grid-row-end`
- `grid-row-gap`
- `grid-row-start`
- `grid-template`
- `grid-template-areas`
- `grid-template-columns`
- `grid-template-rows`
- `hanging-punctuation`
- `height`
- `hyphens`
- `image-rendering`
- `isolation`
- `justify-content`
- `left`
- `line-break`
- `list-style`
- `list-style-image`
- `list-style-position`
- `list-style-type`
- `mask`
- `mask-clip`
- `mask-composite`
- `mask-image`
- `mask-mode`
- `mask-origin`
- `mask-position`
- `mask-repeat`
- `mask-size`
- `mask-type`
- `max-height`
- `min-height`
- `min-width`
- `mix-blend-mode`
- `object-fit`
- `object-position`
- `order`
- `orphans`
- `outline`
- `outline-color`
- `outline-offset`
- `outline-style`
- `outline-width`
- `overflow`
- `overflow-wrap`
- `overflow-x`
- `overflow-y`
- `page-break-after`
- `page-break-before`
- `page-break-inside`
- `perspective`
- `perspective-origin`
- `pointer-events`
- `position`
- `quotes`
- `resize`
- `right`
- `row-gap`
- `scroll-behavior`
- `tab-size`
- `table-layout`
- `text-align-last`
- `text-combine-upright`
- `text-decoration-color`
- `text-decoration-line`
- `text-decoration-style`
- `text-justify`
- `text-orientation`
- `text-shadow`
- `text-underline-position`
- `top`
- `transform`
- `transform-origin`
- `transform-style`
- `transition`
- `transition-delay`
- `transition-duration`
- `transition-property`
- `transition-timing-function`
- `unicode-bidi`
- `user-select`
- `visibility`
- `widows`
- `word-break`
- `word-spacing`
- `word-wrap`
- `writing-mode`
- `z-index`
