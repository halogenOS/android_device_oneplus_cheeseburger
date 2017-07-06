/*
 * Copyright (C) 2014 The CyanogenMod Project
 * Copyright (C) 2017 The halogenOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.cyanogenmod.hardware;

import org.halogenos.io.FileUtils;

/*
 * Disable capacitive keys
 *
 * This is intended for use on devices in which the capacitive keys
 * can be fully disabled for replacement with a soft navbar. You
 * really should not be using this on a device with mechanical or
 * otherwise visible-when-inactive keys
 */

public class KeyDisabler {

    private static String CONTROL_PATHS[] = new String[] {
        "/proc/touchpanel/key_disable",
        "/sys/module/fpc1020_tee/parameters/ignor_home_for_ESD"
    };

    public static boolean isSupported() {
        return FileUtils.isFileWritable(CONTROL_PATHS[0]);
    }

    public static boolean isActive() {
        return FileUtils.readString(CONTROL_PATHS[0]).contains("1");
    }

    public static boolean setActive(boolean state) {
        boolean result = true;
        for (String path : CONTROL_PATHS) {
            result &= FileUtils.writeString(path, state ? "0" : "1");
        }
        return result;
    }
}
