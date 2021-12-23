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
- 10kB gzipped and 8kB brotli'd for default build.

## Why?

Sass Style System was inspired by similar functional CSS frameworks such as TailwindCSS and Tachyons, but it comes with the power of a CSS preprocessor and zero dependencies other than [dart-sass](https://sass-lang.com/dart-sass) (which is very fast and self-contained). As opposed to dealing with a Node build system and PostCSS with its plethora of plugins.

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

```scss
@use "sss";
```

That's it! All the utility classes will now be included in your CSS output. Use them to your heart's content.

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

Every value of sss can be configured by simply adding `with ()` to the end of the use statement with a map of your customization values. All custom values will **override the defaults** unless they are configured within the [$extend](#extend) map.

```scss
@use "sss" with (
  $config_name: config_value,
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

### Extend
