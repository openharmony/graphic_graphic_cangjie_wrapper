/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Created on 2024/6/6
 */
package ohos_app_cangjie_entry

internal import ArkGraphics2D.*
import ohos.base.*
import std.unittest.testmacro.*
import std.math.numeric.*
import std.runtime.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@Test
class Test_color_manager {
    override func afterAll(): Unit {
        GC()
        sleep(Duration.second)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getColorSpaceName() {
        try {
            let colorSpaceManagerInstance = create(ColorSpace.Srgb)
            let colorSpace: ColorSpace = colorSpaceManagerInstance.getColorSpaceName()
            @Expect(colorSpace.toString(), "ColorSpace.Srgb")
        } catch (e: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getWhitePoint() {
        try {
            let colorSpaceManagerInstance = create(
                ColorSpacePrimaries(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0), 0.1)
            let colorSpaceArray = colorSpaceManagerInstance.getWhitePoint()
            @Expect(colorSpaceArray[0], 1.0)
        } catch (e: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_getGamma() {
        try {
            let colorSpaceManagerInstance = create(
                ColorSpacePrimaries(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0), 0.1)
            let gamma = colorSpaceManagerInstance.getGamma()
            @Expect(gamma, 0.1)
        } catch (e: Exception) {
            @Expect(false)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_checkRet() {
        try {
            let colorSpaceManagerInstance = create(
                ColorSpacePrimaries(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0), -1.0)
            let gamma = colorSpaceManagerInstance.getGamma()
            @Expect(true)
        } catch (e: Exception) {
            @Expect(false)
        }
    }
}
