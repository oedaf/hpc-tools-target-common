# source_user_setup.bash
# Main entry point for user shell environment


export TOOLS_TARGET="${TOOLS_TARGET:-/tools}"

# Initial debug output
if [[ "${DEBUG_ENV:-0}" -eq 1 ]]; then
    echo "TOOLS_TARGET  = ${TOOLS_TARGET}"
    # echo "TOOLS_ADMIN   = ${TOOLS_ADMIN}"
    # echo "BUILD_NPROC   = ${BUILD_NPROC}"
fi

# ----------------------------------------
# --- ARCH -------------------------------
#
# everyone starts with x86_64_v2, will
# add detection of other platforms as they
# are added.
#
# note- this is explicitly set in build
# scripts, but detected for run env.

# set for now, will add detection later as
# needed.
export ARCH='x86_64_v2'


umask 027




## Load helper functions first - only needed by system/tool_admin account
#source "${TOOLS_TARGET}/common/shell_startup/src/env_functions.bash"

# Load core environment

#echo "${TOOLS_TARGET}/common/shell_startup/src/get_platform_and_os.bash"
#echo "${TOOLS_TARGET}/common/shell_startup/src/get_modules_setup.bash"
source "${TOOLS_TARGET}/common/shell_startup/src/get_platform_and_os.bash"
source "${TOOLS_TARGET}/common/shell_startup/src/get_modules_setup.bash"

## Final path sanity check (anti-villain protection)
#check_for_improper_path "${TOOLS_TARGET}"  "TOOLS_TARGET"
#check_for_improper_path "${TOOLS_ADMIN}"   "TOOLS_ADMIN"
#check_for_improper_path "${MODULESHOME}"   "MODULESHOME"


#source /tools/x86_64_v2/ubuntu_24.04/modules/modules-5.6.1/init/bash_completion
#source /tools/x86_64_v2/ubuntu_24.04/modules/modules-5.6.1/init/bash

