#!usr/bin/env bash
set -Eeuo pipefall

# =============================
# Metadata
# =============================
TOOL_NAME="nhsetup"
VERSION="1.0.0"
AUTHOR="Iddu Sacha"

# =============================
# Colors
# =============================
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;32m'
NC='\033[0m'

# =============================
# Banner
# =============================
banner() {
 if command -v figlet >/dev/null 2>&1; then
   figlet -f slant "TOOL_NAME"
 else
  echo "=== $TOOL_NAME ==="
 fi
}

info() { echo -e "${GREEN}[+]{NC} $1"; }
warn() { echo -e "${CYAN}[!]{NC} $1"; }
error() { echo -e "${RED}[-]{NC} $1"; }

# ============================
# Environment Detection
# ============================
install_deps() {
 info "Installing dependencies..."

 if is_termux; then
   pkg install -y git curl wget figlet
 else
   sudo apt install -y g8t curl wget figlet
 fi

 info "Dependencies installed"
}

usage() {
 cat <<EOF
$TOOL_NAME v$VERSION

Usage
 $TOOL_NAME [option]

Options:
 -i Install dependencies
 -h Show help
EOF
}

# ===============================
# Main
# ===============================
clear
banner

while getopts ":ih" opt; do
 case $opt in
  i) install_deps ;;
  h) usage; exit 0 ;;
  *) error "Invalid option"; usage; exit 1 ;;
 esac
done
