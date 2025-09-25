# 图形图像仓颉封装

## 简介

图形图像仓颉接口是在OpenHarmony上面向开发者进行应用开发使用Graphic_2D能力封装的仓颉API实现。提供了仓颉的色彩管理能力API，当前开放的文件管理仓颉接口仅支持standard设备。

## 系统架构

其主要的结构如下图所示：

**图 1**  图形图像仓颉架构图
![图形图像仓颉接口](figures/graphic_cangjie_wrapper_architecture_zh.png)

如架构图所示：

接口层说明：

- 色彩管理API：基于色彩管理封装面向开发者开放的仓颉公开接口声明。

框架层说明：

- 色彩管理封装：提供色域相关配置能力。该封装层是基于graphic_2d对色彩管理功能进行的仓颉封装实现。
- 仓颉图形图像FFI接口定义：负责定义被Cangjie语言调用的C语言互操作接口，用于实现仓颉图形图像能力。

仓颉图形图像依赖部件引用说明：

- graphic_2d：提供可被图形图像仓颉接口调用的完成图片效果、渲染特效等效果处理的能力的C语言接口，包括：多效果的串联、并联处理，在布局时加入渲染特效、控件交互特效等相关能力。
- 仓颉互操作：封装C语言互操作公共接口，并提供仓颉标签类实现用于对仓颉API进行标注，以及提供抛向用户的BusinessException异常类定义。
- 仓颉DFX：负责提供日志接口，提供可被图形图像仓颉接口调用的在关键路径处打印日志能力的仓颉接口。

## 目录

```
foundation/graphic/graphic_cangjie_wrapper
├── figures                           # 存放README中的架构图
├── kit                               # 仓颉图形图像kit化代码
│   └── ArkGraphics2D                 # 仓颉ArkGraphics2D实现
├── ohos                              # 仓颉图形图像接口实现
│   └── graphics                      # 仓颉图形接口实现
│       └── color_space_manager       # 色彩管理模块
└── test                              # 仓颉测试代码
    └── color_manager                 # 色彩管理测试
        └── test                      # 色彩管理测试工程
```

## 使用说明

图形图像仓颉接口当前仅提供了色彩管理相关功能。

色彩管理，包括创建标准色彩空间和自定义色彩空间，以及获取色彩空间相关信息的方法。支持开发者在图片处理、相机管理中设置/获取颜色空间相关信息。

相关使用指南请参见[色彩管理开发指导](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/graphics/cj-color-manager-development-guide.md)。

## 约束

与ArkTS提供的API能力相比，暂不支持以下功能：

- UI框架的绘制能力。
- 2D渲染、3D渲染和渲染引擎的管理。
- 动画引擎的相关能力。
- 图片效果、渲染特效能力。
- 显示与内存管理能力。

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[graphic_graphic_2d](https://gitcode.com/openharmony/graphic_graphic_2d/blob/master/README_zh.md)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/README_zh.md)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper/blob/master/README_zh.md)