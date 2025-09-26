# 图形图像仓颉封装

## 简介

图形图像仓颉封装为OpenHarmony应用开发者提供了仓颉的色彩管理能力API，当前开放的文件管理仓颉接口仅支持standard设备。

## 系统架构

其主要的结构如下图所示：

**图 1**  图形图像仓颉架构图
![图形图像仓颉接口](figures/graphic_cangjie_wrapper_architecture_zh.png)

如架构图所示：

接口层说明：

- 色彩管理API：提供管理抽象化色域对象的一些基础能力，包括色域对象的创建与色域基础属性的获取的仓颉公开接口声明。

框架层说明：

- 色彩管理封装：提供色域相关创建与获取能力。该封装层是基于graphic_2d对色彩管理功能进行的仓颉封装实现。

仓颉图形图像依赖部件引用说明：

- graphic_2d：提供可被图形图像仓颉封装调用的图片效果、渲染特效等效果处理的能力的native功能实现，包括：多效果的串联、并联处理，在布局时加入渲染特效、控件交互特效等相关能力。
- cangjie_ark_interop：封装C语言互操作公共接口，并提供仓颉标签类实现用于对仓颉API进行标注，以及提供抛向用户的BusinessException异常类定义。
- hiviewdfx_cangjie_wrapper：负责提供日志接口，提供可被图形图像仓颉接口调用的在关键路径处打印日志能力的仓颉接口。

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
```

## 使用说明

图形图像仓颉接口当前仅提供了色彩管理相关功能。

色彩管理，包括创建标准色彩空间和自定义色彩空间，以及获取色彩空间相关信息的方法。支持开发者在图片处理、相机管理中设置/获取颜色空间相关信息。

相关使用指南请参见[色彩管理开发指导](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/graphics/cj-color-manager-development-guide.md)。

## 约束

与ArkTS提供的API能力相比，暂不支持以下功能：

- AR引擎服务
- graphic_3d服务
- 图形加速服务
- GPU加速引擎服务

graphic_2d服务中暂不支持：

- [图像效果](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkgraphics2d/js-apis-effectKit.md)：提供了处理图像的基础能力，包括亮度调节、模糊化、灰度调节和智能取色等。
- [可变帧率](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkgraphics2d/js-apis-graphics-displaySync.md)：支持让开发者以指定帧率来运行UI业务，一般用于开发者自绘制UI，并且对于帧率有特定诉求的场景。
- [HDR能力](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkgraphics2d/js-apis-hdrCapability.md)：提供HDR（高动态显示范围）能力。
- [文本模块](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkgraphics2d/js-apis-graphics-text.md)：提供高质量的排版，包括字符到字形的转换、字距调整、换行、对齐、文本测量等。。
- [效果级联](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkgraphics2d/js-apis-uiEffect.md)：提供组件效果的一些基础能力，包括模糊、边缘像素扩展、提亮等。

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[graphic_graphic_2d](https://gitcode.com/openharmony/graphic_graphic_2d/blob/master/README_zh.md)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/README_zh.md)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper/blob/master/README_zh.md)