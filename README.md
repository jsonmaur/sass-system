<br /> <br /> <br /> <br />

<div align="center">
  <img src=".github/logo.svg" alt="SSS Logo" width="200" />
</div>

<br /> <br /> <br /> <br />

A highly customizable style system generator and utility-first CSS framework for quickly building user interfaces. Similar to frameworks such as [Tailwind](https://tailwindcss.com) and [Tachyons](https://tachyons.io), but with the power of a CSS preprocessor and zero dependencies other than [dart-sass](https://sass-lang.com/dart-sass). Built in Sass, for Sass.

[![tests](https://github.com/maurandco/sss/actions/workflows/test.yml/badge.svg)](https://github.com/maurandco/sss/actions/workflows/test.yml)

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

## Generators

Rather than include everything up front to be removed later, we add in rules as needed to keep the file size down.

## Reference

| Rule                       | Classnames                                                        |
|----------------------------|-------------------------------------------------------------------|
| align-content              |                                                                   |
| align-items                |                                                                   |
| align-self                 |                                                                   |
| all                        |                                                                   |
| animation                  |                                                                   |
| animation-delay            |                                                                   |
| animation-direction        |                                                                   |
| animation-duration         |                                                                   |
| animation-fill-mode        |                                                                   |
| animation-iteration-count  |                                                                   |
| animation-name             |                                                                   |
| animation-play-state       |                                                                   |
| animation-timing-function  |                                                                   |
| backface-visibility        |                                                                   |
| background                 |                                                                   |
| background-attachment      |                                                                   |
| background-blend-mode      |                                                                   |
| background-clip            |                                                                   |
| background-color           | `.bg-white` `.bg-black`                                           |
| background-image           |                                                                   |
| background-origin          |                                                                   |
| background-position        |                                                                   |
| background-repeat          |                                                                   |
| background-size            |                                                                   |
| border                     |                                                                   |
| border-bottom              |                                                                   |
| border-bottom-color        |                                                                   |
| border-bottom-left-radius  |                                                                   |
| border-bottom-right-radius |                                                                   |
| border-bottom-style        |                                                                   |
| border-bottom-width        |                                                                   |
| border-collapse            |                                                                   |
| border-color               |                                                                   |
| border-image               |                                                                   |
| border-image-outset        |                                                                   |
| border-image-repeat        |                                                                   |
| border-image-slice         |                                                                   |
| border-image-source        |                                                                   |
| border-image-width         |                                                                   |
| border-left                |                                                                   |
| border-left-color          |                                                                   |
| border-left-style          |                                                                   |
| border-left-width          |                                                                   |
| border-radius              |                                                                   |
| border-right               |                                                                   |
| border-right-color         |                                                                   |
| border-right-style         |                                                                   |
| border-right-width         |                                                                   |
| border-spacing             |                                                                   |
| border-style               |                                                                   |
| border-top                 |                                                                   |
| border-top-color           |                                                                   |
| border-top-left-radius     |                                                                   |
| border-top-right-radius    |                                                                   |
| border-top-style           |                                                                   |
| border-top-width           |                                                                   |
| border-width               |                                                                   |
| bottom                     |                                                                   |
| box-decoration-break       |                                                                   |
| box-shadow                 | `.shadow-low` `.shadow-mid` `.shadow-high` `.shadow-mega` `.shadow-inner` `.no-shadow` |
| box-sizing                 | `.border-box` `.content-box`                                      |
| break-after                |                                                                   |
| break-before               |                                                                   |
| break-inside               |                                                                   |
| caption-side               |                                                                   |
| caret-color                |                                                                   |
| clear                      |                                                                   |
| clip                       |                                                                   |
| color                      | `.current` `.white` `.black`                                      |
| column-count               |                                                                   |
| column-fill                |                                                                   |
| column-gap                 |                                                                   |
| column-rule                |                                                                   |
| column-rule-color          |                                                                   |
| column-rule-style          |                                                                   |
| column-rule-width          |                                                                   |
| column-span                |                                                                   |
| column-width               |                                                                   |
| columns                    |                                                                   |
| content                    |                                                                   |
| counter-increment          |                                                                   |
| counter-reset              |                                                                   |
| cursor                     |                                                                   |
| direction                  |                                                                   |
| display                    |                                                                   |
| empty-cells                |                                                                   |
| filter                     |                                                                   |
| flex                       |                                                                   |
| flex-basis                 |                                                                   |
| flex-direction             |                                                                   |
| flex-flow                  |                                                                   |
| flex-grow                  |                                                                   |
| flex-shrink                |                                                                   |
| flex-wrap                  |                                                                   |
| float                      |                                                                   |
| font                       |                                                                   |
| font-family                | `.serif` `.sans-serif` `.monospace`                               |
| font-feature-settings      |                                                                   |
| font-kerning               |                                                                   |
| font-language-override     |                                                                   |
| font-size                  | `.text-xxs` `.text-xs` `.text-md` `.text-lg` `.text-xl` `.text-xxl` `.text-jumbo` |
| font-size-adjust           |                                                                   |
| font-stretch               |                                                                   |
| font-style                 | `.italic` `.no-italic`                                            |
| font-synthesis             |                                                                   |
| font-variant               | `.small-caps` `.no-caps`                                          |
| font-variant-alternates    |                                                                   |
| font-variant-caps          |                                                                   |
| font-variant-east-asian    |                                                                   |
| font-variant-ligatures     |                                                                   |
| font-variant-numeric       |                                                                   |
| font-variant-position      |                                                                   |
| font-weight                | `.bolder` `.lighter` `.thin` `.extra-light` `.light` `.regular` `.medium` `.semi-bold` `.bold` `.extra-bold` `.heavy` |
| gap                        |                                                                   |
| grid                       |                                                                   |
| grid-area                  |                                                                   |
| grid-auto-columns          |                                                                   |
| grid-auto-flow             |                                                                   |
| grid-auto-rows             |                                                                   |
| grid-column                |                                                                   |
| grid-column-end            |                                                                   |
| grid-column-gap            |                                                                   |
| grid-column-start          |                                                                   |
| grid-gap                   |                                                                   |
| grid-row                   |                                                                   |
| grid-row-end               |                                                                   |
| grid-row-gap               |                                                                   |
| grid-row-start             |                                                                   |
| grid-template              |                                                                   |
| grid-template-areas        |                                                                   |
| grid-template-columns      |                                                                   |
| grid-template-rows         |                                                                   |
| hanging-punctuation        |                                                                   |
| height                     |                                                                   |
| hyphens                    |                                                                   |
| image-rendering            |                                                                   |
| isolation                  |                                                                   |
| justify-content            |                                                                   |
| left                       |                                                                   |
| letter-spacing             | `.track-tight` `.track-open` `.track-mega`                        |
| line-break                 |                                                                   |
| line-height                | `.lead-solid` `.lead-title` `.lead-copy`                          |
| list-style                 |                                                                   |
| list-style-image           |                                                                   |
| list-style-position        |                                                                   |
| list-style-type            |                                                                   |
| margin                     |                                                                   |
| margin-bottom              |                                                                   |
| margin-left                |                                                                   |
| margin-right               |                                                                   |
| margin-top                 |                                                                   |
| mask                       |                                                                   |
| mask-clip                  |                                                                   |
| mask-composite             |                                                                   |
| mask-image                 |                                                                   |
| mask-mode                  |                                                                   |
| mask-origin                |                                                                   |
| mask-position              |                                                                   |
| mask-repeat                |                                                                   |
| mask-size                  |                                                                   |
| mask-type                  |                                                                   |
| max-height                 |                                                                   |
| max-width                  | `.mw-0` `.mw-full` `.mw-min` `.mw-max` `.mw-fit` `.measure-narrow` `.measure-regular` `.measure-wide` |
| min-height                 |                                                                   |
| min-width                  |                                                                   |
| mix-blend-mode             |                                                                   |
| object-fit                 |                                                                   |
| object-position            |                                                                   |
| opacity                    |                                                                   |
| order                      |                                                                   |
| orphans                    |                                                                   |
| outline                    |                                                                   |
| outline-color              |                                                                   |
| outline-offset             |                                                                   |
| outline-style              |                                                                   |
| outline-width              |                                                                   |
| overflow                   |                                                                   |
| overflow-wrap              |                                                                   |
| overflow-x                 |                                                                   |
| overflow-y                 |                                                                   |
| padding                    |                                                                   |
| padding-bottom             |                                                                   |
| padding-left               |                                                                   |
| padding-right              |                                                                   |
| padding-top                |                                                                   |
| page-break-after           |                                                                   |
| page-break-before          |                                                                   |
| page-break-inside          |                                                                   |
| perspective                |                                                                   |
| perspective-origin         |                                                                   |
| pointer-events             |                                                                   |
| position                   |                                                                   |
| quotes                     |                                                                   |
| resize                     |                                                                   |
| right                      |                                                                   |
| row-gap                    |                                                                   |
| scroll-behavior            |                                                                   |
| tab-size                   |                                                                   |
| table-layout               |                                                                   |
| text-align                 | `.text-left` `.text-right` `.text-center` `.text-justify`         |
| text-align-last            |                                                                   |
| text-combine-upright       |                                                                   |
| text-decoration            | `.strike` `.underline` `.no-underline`                            |
| text-decoration-color      |                                                                   |
| text-decoration-line       |                                                                   |
| text-decoration-style      |                                                                   |
| text-indent                | `.indent`                                                         |
| text-justify               |                                                                   |
| text-orientation           |                                                                   |
| text-overflow              | `.truncate`                                                       |
| text-shadow                |                                                                   |
| text-transform             | `.capitalize` `.lowercase` `.uppercase` `.no-case`                |
| text-underline-position    |                                                                   |
| top                        |                                                                   |
| transform                  |                                                                   |
| transform-origin           |                                                                   |
| transform-style            |                                                                   |
| transition                 |                                                                   |
| transition-delay           |                                                                   |
| transition-duration        |                                                                   |
| transition-property        |                                                                   |
| transition-timing-function |                                                                   |
| unicode-bidi               |                                                                   |
| user-select                |                                                                   |
| vertical-align             | `.top` `.middle` `.bottom` `.baseline`                            |
| visibility                 |                                                                   |
| white-space                | `.pre` `.wrap` `.no-wrap`                                         |
| widows                     |                                                                   |
| width                      | `.w-0` `.w-px` `.w-full` `.w-screen` `.w-min` `.w-max` `.w-fit`   |
| word-break                 |                                                                   |
| word-spacing               |                                                                   |
| word-wrap                  |                                                                   |
| writing-mode               |                                                                   |
| z-index                    |                                                                   |
