#!/system/bin/sh
# Copyright (c) 2014, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`
action=`getprop sys.usb_uicc.enabled`
uicc_loading=`getprop sys.usb_uicc.loading`

# Perfom uicc_insert/uicc_remove only when usb uicc client says so
if [ $uicc_loading != "1" ]; then
    action=""
fi

if [ -f /sys/devices/soc0/soc_id ]; then
    soc_hwid=`cat /sys/devices/soc0/soc_id`
else
    soc_hwid=`cat /sys/devices/system/soc/soc0/id`
fi

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

case $action in
"1")
    setprop sys.usb_uicc.loading 0
    ;;
"0")
    setprop sys.usb_uicc.loading 0
    ;;
*)
    echo "USB_UICC invalid action for uicc operation!"
    ;;
esac

