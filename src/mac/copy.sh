#!/bin/bash

# Mac System Config Copy Script
# This script copies system configuration files between this directory and the Mac home directory

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration files to manage
CONFIG_FILES=(
    ".zshrc"
    ".zsh_custom"
    ".bash_aliases"
    ".vimrc"
)

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}=== $1 ===${NC}"
}

# Function to create backup
create_backup() {
    local target_dir="$1"
    local backup_dir="${target_dir}/backup_$(date +%Y%m%d_%H%M%S)"
    
    print_status "Creating backup in: $backup_dir"
    mkdir -p "$backup_dir"
    
    for file in "${CONFIG_FILES[@]}"; do
        if [[ -f "${target_dir}/${file}" ]]; then
            cp "${target_dir}/${file}" "$backup_dir/"
            print_status "Backed up: $file"
        fi
    done
}

# Function to copy files from this directory to home
copy_to_home() {
    print_header "Copying configuration files TO home directory"
    
    # Create backup of existing files in home
    if [[ "$1" != "--no-backup" ]]; then
        create_backup "$HOME_DIR"
    fi
    
    for file in "${CONFIG_FILES[@]}"; do
        if [[ -f "${SCRIPT_DIR}/${file}" ]]; then
            cp "${SCRIPT_DIR}/${file}" "${HOME_DIR}/${file}"
            print_status "Copied: $file → ~/$file"
        else
            print_warning "Source file not found: ${SCRIPT_DIR}/${file}"
        fi
    done
    
    print_status "Configuration files copied to home directory"
}

# Function to copy files from home to this directory
copy_from_home() {
    print_header "Copying configuration files FROM home directory"
    
    # Create backup of existing files in this directory
    if [[ "$1" != "--no-backup" ]]; then
        create_backup "$SCRIPT_DIR"
    fi
    
    for file in "${CONFIG_FILES[@]}"; do
        if [[ -f "${HOME_DIR}/${file}" ]]; then
            cp "${HOME_DIR}/${file}" "${SCRIPT_DIR}/${file}"
            print_status "Copied: ~/$file → $file"
        else
            print_warning "Source file not found: ~/$file"
        fi
    done
    
    print_status "Configuration files copied from home directory"
}

# Function to show differences between files
show_diff() {
    print_header "Showing differences between directories"
    
    for file in "${CONFIG_FILES[@]}"; do
        if [[ -f "${SCRIPT_DIR}/${file}" ]] && [[ -f "${HOME_DIR}/${file}" ]]; then
            if ! diff -q "${SCRIPT_DIR}/${file}" "${HOME_DIR}/${file}" >/dev/null; then
                print_status "Differences in $file:"
                diff "${SCRIPT_DIR}/${file}" "${HOME_DIR}/${file}" || true
                echo
            else
                print_status "$file: No differences"
            fi
        else
            print_warning "$file: Not present in both locations"
        fi
    done
}

# Function to show help
show_help() {
    echo "Mac System Config Copy Script"
    echo
    echo "Usage: $0 [OPTION]"
    echo
    echo "Options:"
    echo "  to-home      Copy configuration files from this directory to home"
    echo "  from-home    Copy configuration files from home to this directory"
    echo "  diff         Show differences between files in both locations"
    echo "  help         Show this help message"
    echo
    echo "Additional options:"
    echo "  --no-backup  Skip creating backup before copying"
    echo
    echo "Configuration files managed:"
    for file in "${CONFIG_FILES[@]}"; do
        echo "  - $file"
    done
    echo
    echo "Script directory: $SCRIPT_DIR"
    echo "Home directory: $HOME_DIR"
}

# Main script logic
case "${1:-help}" in
    "to-home")
        copy_to_home "$2"
        ;;
    "from-home")
        copy_from_home "$2"
        ;;
    "diff")
        show_diff
        ;;
    "help"|"-h"|"--help")
        show_help
        ;;
    *)
        print_error "Unknown option: $1"
        echo
        show_help
        exit 1
        ;;
esac
