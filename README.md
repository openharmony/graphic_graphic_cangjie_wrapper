# graphic_cangjie_wrapper

## Introduction

The graphic_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on Graphic_2D capabilities. Provides Cangjie color management capability API. The currently open file management Cangjie interface only supports standard devices.

## System Architecture

The following figure shows the architecture of the Graphics subsystem.

**Figure 1** Architecture of the Graphics subsystem
![Graphics subsystem architecture](figures/graphic_cangjie_wrapper_architecture_en.png)

As shown in the architecture diagram:

Interface layer description:

- Color Management API: Cangjie public interfaces based on color management encapsulation exposed to users.

Framework layer description:

- Color Management Wrapper: Provide gamut-dependent configuration capabilities.
- Cangjie graphics FFI interface definition: Responsible for defining the C language interoperable Cangjie interface, which is used to realize Cangjie graphics.

Cangjie Graphics Dependencies:

- graphic_2d: Provides C language interfaces that can be called by the graphics Cangjie interface to complete image effects, rendering effects and other effects processing capabilities, including: multi-effect series and parallel processing, adding rendering effects, control interaction effects and other related capabilities during layout.
- Cangjie ark interop: Encapsulates public interfaces for C language interoperation, and provides Cangjie tag class implementation for annotating Cangjie APIs, as well as providing BusinessException exception class definitions thrown to users.
- Cangjie DFX: Responsible for providing log interfaces, providing Cangjie interfaces that can be called by the graphics Cangjie interface to print logs at critical paths.

## Directory Structure

```
foundation/graphic/graphic_cangjie_wrapper
├── figures                           # architecture pictures
├── kit                               # Cangjie Graphics kit code
│   └── ArkGraphics2D                 # Cangjie ArkGraphics2D code implementation
├── ohos                              # Cangjie Graphics Subsystem code
│   └── graphics                      # Cangjie Graphics code implementation
│       └── color_space_manager       # Color management module
└── test                              # Cangjie test code
    └── color_manager                 # Color management tests
        └── test                      # Color management test project
```

## Usage Guidelines

The current Cangjie Graphics interface provides only Color Management.

Color management, including creating standard color spaces and custom color spaces, as well as methods for obtaining color space related information. Supports developers in setting/getting color space related information in image processing and camera management.

For Graphic-related APIs, please refer to [Color Management API](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/ArkGraphics2D/cj-apis-color_manager.md).

## Constraints

Compared with the API capabilities provided by ArkTS, the following functions are not supported at the moment:

- The rendering capabilities of the UI framework.
- 2D rendering, 3D rendering and rendering engine management.
- Related capabilities of the animation engine.
- Ability to process image effects, rendering effects.
- The display and memory management capabilities.

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[graphic_graphic_2d](https://gitcode.com/openharmony/graphic_graphic_2d/blob/master/README.md)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/README.md)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper/blob/master/README.md)