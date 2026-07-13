## get_platform_and_os.bash
## Written by: Justin Gedge - 2026.03.21
##
## 2026.04.18
## cleanup with help from Bat Computer [aka Grok]

export PLATFORM=$( uname -m)
export OS=$(       uname --kernel-name | tr '[:upper:]' '[:lower:]')

if [[ "$OS" == "linux" ]]; then
    if [[ "${DEBUG_ENV:-0}" -eq 1 ]]; then
        echo "DEBUG: Detecting Linux distribution..."
    fi

    distro_name=$(   awk -F= '/^ID=/         {gsub(/"/,"",$2); print tolower($2)}' /etc/os-release)
    distro_version=$(awk -F= '/^VERSION_ID=/ {gsub(/"/,"",$2); print $2}'          /etc/os-release)

    export DISTRO="${distro_name}_${distro_version}"
fi

if [[ "${DEBUG_ENV:-0}" -eq 1 ]]; then
    echo "OS       = ${OS}"
    echo "PLATFORM = ${PLATFORM}"
    echo "DISTRO   = ${DISTRO}"
fi
