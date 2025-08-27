# graphic_cangjie_wrapper

## Introduction

The graphic_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Graphics Subsystem.The Graphics subsystem mainly consists of user interface (UI) components, layout, animator, font, input event, window management, and rendering and drawing modules. It is an application framework that can be built on the standard OS to develop OpenHarmony applications for standard- and large-system devices.

## System Architecture

The following figure shows the architecture of the Graphics subsystem.

![Graphics subsystem architecture](figures/graphic_cangjie_wrapper_architecture_en.jpg)

## Directory Structure

```
foundation/graphic/graphic_cangjie_wrapper
├── ohos             # Cangjie Graphics Subsystem code
├── kit              # Cangjie kit code
├── figures          # architecture pictures
```

## Constraints

The currently open Graphic Cangjie api only supports standard devices.

## Usage Guidelines

The currently provided feature is only Color Management.

For Graphic-related APIs, please refer to [ohos.graphics.color_space_manager (Color Management)](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/ArkGraphics2D/cj-apis-color_manager.md).

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

- [graphic_graphic_2d](https://gitee.com/openharmony/graphic_graphic_2d/blob/master/README.md)
