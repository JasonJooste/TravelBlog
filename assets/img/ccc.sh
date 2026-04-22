##!/bin/bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") <source_directory>"
    exit 1
fi

SOURCE_DIR="$1"
"$SCRIPT_DIR/cp_rename.bash" "$SOURCE_DIR"/* .
"$SCRIPT_DIR/convert_and_compress.sh"
