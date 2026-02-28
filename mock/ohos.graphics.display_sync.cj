/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos.graphics.display_sync

import ohos.callback_invoke.{Callback1Argument}
import ohos.labels.APILevel

public class IntervalInfo {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: Int64
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var targetTimestamp: Int64

    init() {
        super()
        this.timestamp = 0
        this.targetTimestamp = 0
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DisplaySync {
    init() {
        super()
    }

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFrame(callback: Callback1Argument<IntervalInfo>): Unit {
        return ()
    }

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func offFrame(callback!: ?Callback1Argument<IntervalInfo> = None): Unit {
        return ()
    }
}
