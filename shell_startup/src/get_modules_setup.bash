## get_modules_setup.bash

modules_version='modules-5.6.1'

# Remove any pre-existing module function from the OS
if [[ $(type -t module) == "function" ]]; then
    module purge >/dev/null 2>&1
    unset -f module
    unset    module
    unset -f ml
    unset    ml
fi

# Load our controlled version of modules
source "${TOOLS_TARGET}/arch/${ARCH}/${DISTRO}/modules/${modules_version}/init/bash"

export MODULESHOME="${TOOLS_TARGET}/arch/${ARCH}/${DISTRO}/modules/${modules_version}"

# Set up MODULEPATH - explicit and verbose
export MODULEPATH="${TOOLS_TARGET}/arch/${ARCH}/${DISTRO}/modulefiles"
# export MODULEPATH="${MODULEPATH}:${TOOLS_TARGET}/arch/${ARCH}/${DISTRO}/modulefiles/tools"

# Debug output with nice indentation
if [[ "${DEBUG_ENV:-0}" -eq 1 ]]; then
    echo "MODULESHOME = ${MODULESHOME}"
    echo "MODULEPATH  ="

    IFS=':' read -ra path_array <<< "${MODULEPATH}"
    for path_element in "${path_array[@]}"; do
        echo "    ${path_element}"
    done
fi


source /tools/arch/x86_64_v2/ubuntu_24.04/modules/modules-5.6.1/init/bash_completion
source /tools/arch/x86_64_v2/ubuntu_24.04/modules/modules-5.6.1/init/bash

