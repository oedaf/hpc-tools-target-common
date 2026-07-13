## env_functions.bash
# Environment helper functions

# ============================================================================
# Villain Detection: Spaces in critical Unix paths
# ============================================================================

check_for_improper_path() {
    local path="$1"
    local name="$2"

    if [[ "$path" == *" "* ]]; then
        cat >&2 << 'EOF'
================================================================================
⚠️  SPACES IN PATH DETECTED ⚠️
================================================================================
Path for ${name} contains spaces:

    ${path}

This is a Unix tools environment.
We have a long-standing cultural aversion to spaces in paths.

Please rename the path to remove the spaces.

(If you truly cannot live without them, set:
 export I_ALLOW_SPACES_IN_PATHS=1
 to bypass this check.)
================================================================================
EOF

        if [[ "${I_ALLOW_SPACES_IN_PATHS:-0}" -eq 1 ]]; then
            echo "Bypass flag detected. Proceeding with spaces in paths." >&2
        else
            echo "Environment loading aborted due to spaces in critical path." >&2
            exit 1
        fi
    fi
}
