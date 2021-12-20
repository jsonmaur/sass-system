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
| margin                     | `.m-0` `.m-px` `.m-auto` `.m-1` `.m-2` `.m-3` `.m-4` `.m-5` `.m-6` `.m-7` `.m-8` `.mx-0` `.mx-px` `.mx-auto` `.mx-1` `.mx-2` `.mx-3` `.mx-4` `.mx-5` `.mx-6` `.mx-7` `.mx-8` `.my-0` `.my-px` `.my-auto` `.my-1` `.my-2` `.my-3` `.my-4` `.my-5` `.my-6` `.my-7` `.my-8` |
| margin-bottom              | `.mb-0` `.mb-px` `.mb-auto` `.mb-1` `.-mb-1` `.mb-2` `.-mb-2` `.mb-3` `.-mb-3` `.mb-4` `.-mb-4` `.mb-5` `.-mb-5` `.mb-6` `.-mb-6` `.mb-7` `.-mb-7` `.mb-8` `.-mb-8` |
| margin-left                | `.ml-0` `.ml-px` `.ml-auto` `.ml-1` `.-ml-1` `.ml-2` `.-ml-2` `.ml-3` `.-ml-3` `.ml-4` `.-ml-4` `.ml-5` `.-ml-5` `.ml-6` `.-ml-6` `.ml-7` `.-ml-7` `.ml-8` `.-ml-8` |
| margin-right               | `.mr-0` `.mr-px` `.mr-auto` `.mr-1` `.-mr-1` `.mr-2` `.-mr-2` `.mr-3` `.-mr-3` `.mr-4` `.-mr-4` `.mr-5` `.-mr-5` `.mr-6` `.-mr-6` `.mr-7` `.-mr-7` `.mr-8` `.-mr-8` |
| margin-top                 | `.mt-0` `.mt-px` `.mt-auto` `.mt-1` `.-mt-1` `.mt-2` `.-mt-2` `.mt-3` `.-mt-3` `.mt-4` `.-mt-4` `.mt-5` `.-mt-5` `.mt-6` `.-mt-6` `.mt-7` `.-mt-7` `.mt-8` `.-mt-8` |
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
| opacity                    | `.o-0` `.o-5` `.o-10` `.o-15` `.o-20` `.o-25` `.o-30` `.o-35` `.o-40` `.o-45` `.o-50` `.o-55` `.o-60` `.o-65` `.o-70` `.o-75` `.o-80` `.o-85` `.o-90` `.o-95` `.o-100` |
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
| padding                    | `.p-0` `.p-px` `.p-1` `.p-2` `.p-3` `.p-4` `.p-5` `.p-6` `.p-7` `.p-8` `.px-0` `.px-px` `.px-1` `.px-2` `.px-3` `.px-4` `.px-5` `.px-6` `.px-7` `.px-8` `.py-0` `.py-px` `.py-1` `.py-2` `.py-3` `.py-4` `.py-5` `.py-6` `.py-7` `.py-8` |
| padding-bottom             | `.pb-0` `.pb-px` `.pb-1` `.pb-2` `.pb-3` `.pb-4` `.pb-5` `.pb-6` `.pb-7` `.pb-8` |
| padding-left               | `.pl-0` `.pl-px` `.pl-1` `.pl-2` `.pl-3` `.pl-4` `.pl-5` `.pl-6` `.pl-7` `.pl-8` |
| padding-right              | `.pr-0` `.pr-px` `.pr-1` `.pr-2` `.pr-3` `.pr-4` `.pr-5` `.pr-6` `.pr-7` `.pr-8` |
| padding-top                | `.pt-0` `.pt-px` `.pt-1` `.pt-2` `.pt-3` `.pt-4` `.pt-5` `.pt-6` `.pt-7` `.pt-8` |
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
