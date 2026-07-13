#!/bin/bash
model=$(grep -m1 "model name" /proc/cpuinfo | cut -d: -f2- | xargs)


# ----------------------------------------
# --- to help gather info ----------------
# gcc -march=native -Q --help=target \
#     | grep -E 'march|mtune'

case "$model" in
  *"E5-2650 v2"*|*"E5-26"*v2*)
    arch_core="x86_64_ivybridge"
    march="ivybridge"
    mtune="ivybridge"
    ;;
  *"8370C"*)
    arch_core="x86_64_icelake"
    march="icelake-server"
    mtune="icelake-server"
    ;;
  *"7V73X"*|*"74F3"*)          # ← New entry added here
    arch_core="x86_64-znver3"
    march="znver3"
    mtune="znver3"
    ;;
  *"9V84"*)
    arch_core="x86_64_znver4"
    march="znver4"
    mtune="znver4"
    ;;
  *"Ryzen 7 7840U"*)
    arch_core="x86_64_znver4"
      
    ;;
  *)
    # === SAFE COMMON FALLBACK ===
    arch_core="x86_64-v2"
    march="x86-64-v2"
    mtune="generic"
    ;;
esac


if [[ ${DEBUG} -eq 1 ]]; then
    echo "model:      ${model}"
    echo "arch_core:  ${arch_core}"
    echo "march:      ${march}"
    echo "mtune:      ${mtune}"
    echo ''
    echo "export   CFLAGS=\"-march=${march} -mtune=${mtune} -O3 -pipe -fomit-frame-pointer\""
    echo "export CXXFLAGS=\"-march=${march} -mtune=${mtune} -O3 -pipe -fomit-frame-pointer\""
    echo "export   FFLAGS=\"-march=${march} -mtune=${mtune} -O3 -pipe -fomit-frame-pointer\""
    echo ''
    
fi


