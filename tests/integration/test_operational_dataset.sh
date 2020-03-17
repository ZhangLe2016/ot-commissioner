#!/bin/bash
#
#  Copyright (c) 2019, The OpenThread Authors.
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#  3. Neither the name of the copyright holder nor the
#     names of its contributors may be used to endorse or promote products
#     derived from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
#  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
#  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
#  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
#  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
#  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
#  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
#  POSSIBILITY OF SUCH DAMAGE.
#

[ -z "${TEST_ROOT_DIR}" ] && . "$(dirname "$0")"/common.sh

test_active_dataset_set_network_name() {
    set -e

    start_otbr "${NON_CCM_NCP}" "eth0"
    form_network "${PSKC}"

    start_commissioner "${NON_CCM_CONFIG}"
    send_command_to_commissioner "start :: 49191"
    send_command_to_commissioner "active"
    send_command_to_commissioner "opdataset set networkname test-network"

    ## TODO(wgtdkp): verify the result
    send_command_to_commissioner "opdataset get networkname"
    stop_commissioner
}

test_pending_dataset_set_channel() {
    set -e

    start_otbr "${NON_CCM_NCP}" "eth0"
    form_network "${PSKC}"

    start_commissioner "${NON_CCM_CONFIG}"
    send_command_to_commissioner "start :: 49191"
    send_command_to_commissioner "active"
    send_command_to_commissioner "opdataset set channel 0 17 60"

    ## TODO(wgtdkp): wait and verify the result
    send_command_to_commissioner "opdataset get channel"
    stop_commissioner
}

test_secure_pending_dataset() {
    ## TODO(wgtdkp): openthread-ccm doesn't implement SEC_PEDNING_SET yet.
    echo "not implemented yet."
}
