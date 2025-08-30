# graphic_cangjie_wrapper

## Introduction

The graphic_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Graphics Subsystem. The Graphics subsystem mainly consists of user interface (UI) components, layout, animator, font, input event, window management, and rendering and drawing modules. It is an application framework that can be built on the standard OS to develop OpenHarmony applications for standard and large-system devices.

## System Architecture

The following figure shows the architecture of the Graphics subsystem.

![Graphics subsystem architecture](figures/graphic_cangjie_wrapper_architecture_en.png)

As shown in the architecture diagram:

- Color Manager: Provide gamut-dependent configuration capabilities;
- Cangjie graphics FFI interface definition: Responsible for defining the C-Interoperable Cangjie interface, which is used to realize Cangjie graphics;
- Effect: Mainly completes the ability to process image effects, rendering effects and other effects, including: multi-effect series and parallel processing, adding rendering effects, control interaction effects and other related capabilities during layout.

## Directory Structure

```
foundation/graphic/graphic_cangjie_wrapper
├── figures                # architecture pictures
├── kit                    # Cangjie Graphics kit code
│   └── ArkGraphics2D      # Cangjie ArkGraphics2D code implementation
└── ohos                   # Cangjie Graphics Subsystem code
    └── graphics           # Cangjie Graphics code implementation
```

## Usage Guidelines

The current Cangjie Graphics interface provides only Color Management.

Compared with ArkTS, the following functions are not supported at the moment:

- The rendering capabilities of the UI framework;
- 2D rendering, 3D rendering and rendering engine management;
- Related capabilities of the animation engine;
- Ability to process image effects, rendering effects;
- The display and memory management capabilities.

For Graphic-related APIs, please refer to [ohos.graphics.color_space_manager (Color Management)](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/ArkGraphics2D/cj-apis-color_manager.md).

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

- [graphic_graphic_2d](https://gitee.com/openharmony/graphic_graphic_2d/blob/master/README.md)

- [cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/README.md)

- [hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper/blob/master/README.md)
