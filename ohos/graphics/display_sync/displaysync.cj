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

import ohos.callback_invoke.{Callback1Argument}
import ohos.ffi.{RemoteDataLite, releaseFFIData, Callback1Param}
import ohos.hilog.{HilogChannel}
import ohos.labels.{APILevel}
import std.collection.{HashMap, ArrayList}
import std.sync.{Mutex}
import ohos.business_exception.{BusinessException, ERR_PARAMETER_ERROR}

let DISPLAY_SYNC_LOG = HilogChannel(0, 0xD004201, "CJ-DisplaySync")

class RequestEvent {
    let callbackList: ArrayList<(Callback1Argument<IntervalInfo>, Int64)>
    let callBackMutex: Mutex

    init() {
        callbackList = ArrayList<(Callback1Argument<IntervalInfo>, Int64)>()
        callBackMutex = Mutex()
    }

    func off(target: Callback1Argument<IntervalInfo>): Unit {
        synchronized(callBackMutex) {
            callbackList.removeIf({callback => refEq(callback[0], target)})
        }
    }

    func on(callback: Callback1Argument<IntervalInfo>, id: Int64): Unit {
        synchronized(callBackMutex) {
            callbackList.add((callback, id))
        }
    }

    func clear(): Unit {
        synchronized(callBackMutex) {
            callbackList.clear()
        }
    }

    func contains(target: Callback1Argument<IntervalInfo>): Bool {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback[0], target)) {
                    return true
                }
            }
        }
        false
    }

    func getId(target: Callback1Argument<IntervalInfo>): Option<Int64> {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback[0], target)) {
                    return callback[1]
                }
            }
        }
        None
    }
}

class EventManage {
    let eventMap: HashMap<String, RequestEvent>
    let mutex: Mutex

    init() {
        eventMap = HashMap<String, RequestEvent>()
        mutex = Mutex()
    }

    func getOrCreate(eventName: String): RequestEvent {
        synchronized(mutex) {
            if (let Some(v) <- eventMap.get(eventName)) {
                return v
            }
            let event = RequestEvent()
            eventMap.add(eventName, event)
            event
        }
    }

    func remove(eventName: String) {
        synchronized(mutex) {
            eventMap.remove(eventName)
        }
    }
}

/**
 * Provides the IntervalInfo interface, which includes timestamp and targetTimestamp.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class IntervalInfo {
    /**
    * The timestamp means the current drawing frame time.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var timestamp: Int64

    /**
    * The timestamp means the next drawing frame time.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var targetTimestamp: Int64

    init(intervalInfo: CIntervalInfo) {
        this.timestamp = intervalInfo.timestamp
        this.targetTimestamp = intervalInfo.targetTimestamp
    }
}

/**
 * Provides functions of applying an independent draw frame rate used for drawing the UI.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DisplaySync <: RemoteDataLite {
    init() {
        super(
            unsafe {
                var id: Int64 = 0
                var errCode: Int32 = 0
                id = FfiDisplaySyncCreate(inout errCode)
                throwIfNotSuccess(errCode)
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    private let eventMng_: EventManage = EventManage()

    /**
     * Registers a callback with the corresponding query condition by using the handle.
     * This callback is triggered when DisplaySync dispatching.
     * @param { Callback1Argument<IntervalInfo> } callback - The callback function to be called when DisplaySync dispatching.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFrame(callback: Callback1Argument<IntervalInfo>): Unit {
        let ty: String = "frame"
        DISPLAY_SYNC_LOG.info("onChange start register")
        if (eventMng_.getOrCreate(ty).contains(callback)) {
            return
        }
        let wrapper = {
            info: CIntervalInfo => callback.invoke(None, IntervalInfo(info))
        }
        unsafe {
            let registerCall = Callback1Param<CIntervalInfo, Unit>(wrapper)
            try (cTy = LibC.mallocCString(ty).asResource()) {
                let ret = FfiDisplaySyncOn(getID(), cTy.value, registerCall.getID())
                throwIfNotSuccess(ret)
            }
            eventMng_.getOrCreate(ty).on(callback, registerCall.getID())
        }
        DISPLAY_SYNC_LOG.info("onChange register success")
    }

    /**
     * Deregisters a callback with the corresponding query condition by using the handle.
     * This callback is triggered when DisplaySync dispatching.
     * @param { ?Callback1Argument<IntervalInfo> } [callback] - The callback function to remove. If not provided, all callbacks for the given event type
     *                                                will be removed.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func offFrame(callback!: ?Callback1Argument<IntervalInfo> = None): Unit {
        let ty: String = "frame"

        let id: Int64 = match (callback) {
            case Some(v) =>
                if (let Some(v) <- eventMng_.getOrCreate(ty).getId(v)) {
                    v
                } else {
                    return
                }
            case None => 0 // 0 is off all
        }

        unsafe {
            try (cTy = LibC.mallocCString(ty).asResource()) {
                let ret = FfiDisplaySyncOff(getID(), cTy.value, id)
                throwIfNotSuccess(ret)
            }
        }

        if (let Some(v) <- callback) {
            eventMng_.getOrCreate(ty).off(v)
        } else {
            eventMng_.remove(ty)
        }
    }
}
