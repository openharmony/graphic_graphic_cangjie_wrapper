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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.graphics.display_sync

import ohos.arkui.component.common.ExpectedFrameRateRange

foreign {
    func FfiDisplaySyncCreate(errCode: CPointer<Int32>): Int64

    func FfiDisplaySyncOn(id: Int64, `type`: CString, callbackId: Int64): Int32

    func FfiDisplaySyncOff(id: Int64, `type`: CString, callbackId: Int64): Int32
}

@C
struct CExpectedFrameRateRange {
    CExpectedFrameRateRange(
        let min!: Int32 = 60,
        let max!: Int32 = 60,
        let expected!: Int32 = 60
    ) {}

    init(rateRange: ExpectedFrameRateRange) {
        if (let Some(v) <- rateRange.min) {
            this.min = v
        } else {
            this.min = 60
        }
        if (let Some(v) <- rateRange.max) {
            this.max = v
        } else {
            this.max = 60
        }
        if (let Some(v) <- rateRange.expected) {
            this.expected = v
        } else {
            this.expected = 60
        }
    }
}

@C
struct CIntervalInfo {
    CIntervalInfo(
        let timestamp: Int64,
        let targetTimestamp: Int64
    ) {}

    init(info: IntervalInfo) {
        timestamp = info.timestamp
        targetTimestamp = info.targetTimestamp
    }
}
