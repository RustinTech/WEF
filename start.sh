#!/usr/bin/env bash
# wef.sh - A script to check the Wi-Fi interface mode, switch to managed mode if necessary, and run the 'wef' program.
# Usage: sudo bash wef.sh -i wlan0

set -euo pipefail

# Command existence check
command_exists() { command -v "$1" >/dev/null 2>&1; }

# Check dependencies
if ! command_exists iw || ! command_exists ip || ! command_exists systemctl; then
  echo "ERROR: This script requires 'iw', 'ip', and 'systemctl'. Install them and try again."
  exit 2
fi

# Ensure we're running as root (sudo)
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root (sudo)."
  exit 1
fi

# Function to collect available wireless interfaces
collect_interfaces() {
  local -a ifs=()
  while IFS= read -r line; do
    [[ -n "$line" ]] && ifs+=("$line")
  done < <(iw dev 2>/dev/null | awk '/Interface/ {print $2}')
  echo "${ifs[@]:-}"
}

# Function to set interface to monitor mode
set_monitor_mode() {
  local ifname="$1"
  
  # Check if already in monitor mode
  current_mode=$(iw dev "$ifname" info | grep -oP '(?<=type )\w+')
  if [[ "$current_mode" == "monitor" ]]; then
    echo "$ifname is already in monitor mode."
    return 0
  fi
  
  # Stop NetworkManager if running
  if systemctl is-active --quiet NetworkManager; then
    echo "NetworkManager is active. Stopping temporarily..."
    systemctl stop NetworkManager
  fi

  # Bring interface down before changing mode
  ip link set dev "$ifname" down

  # Set the interface to monitor mode
  echo "Setting $ifname to monitor mode..."
  iw dev "$ifname" set type monitor
  ip link set dev "$ifname" up

  # Restart NetworkManager (if previously stopped)
  systemctl start NetworkManager
}

# Function to set interface to managed mode
set_managed_mode() {
  local ifname="$1"
  
  # Check if already in managed mode
  current_mode=$(iw dev "$ifname" info | grep -oP '(?<=type )\w+')
  if [[ "$current_mode" == "managed" ]]; then
    echo "$ifname is already in managed mode."
    return 0
  fi

  # Stop NetworkManager if running
  if systemctl is-active --quiet NetworkManager; then
    echo "NetworkManager is active. Stopping temporarily..."
    systemctl stop NetworkManager
  fi

  # Bring interface down before changing mode
  ip link set dev "$ifname" down

  # Set the interface to managed mode
  echo "Setting $ifname to managed mode..."
  iw dev "$ifname" set type managed
  ip link set dev "$ifname" up

  # Restart NetworkManager (if previously stopped)
  systemctl start NetworkManager
}

# Parse command-line arguments
INTERFACE=""
while getopts "i:" opt; do
  case "$opt" in
    i) INTERFACE="$OPTARG" ;;
    *) echo "Usage: $0 -i <interface>"; exit 1 ;;
  esac
done

# If no interface is provided, let the user choose from available interfaces
if [[ -z "$INTERFACE" ]]; then
  mapfile -t IFACES < <(collect_interfaces)
  if [[ ${#IFACES[@]} -eq 0 ]]; then
    echo "No wireless interfaces found."
    exit 1
  fi

  echo "Available wireless interfaces:"
  for i in "${!IFACES[@]}"; do
    idx=$((i+1))
    echo "  $idx) ${IFACES[$i]}"
  done

  read -rp "Select interface number (1 to ${#IFACES[@]}): " sel
  if [[ ! "$sel" =~ ^[0-9]+$ || "$sel" -lt 1 || "$sel" -gt ${#IFACES[@]} ]]; then
    echo "Invalid selection."
    exit 1
  fi

  INTERFACE="${IFACES[$((sel-1))]}"
  echo "Selected interface: $INTERFACE"
fi

# Check if the interface is in monitor mode, if so, switch it to managed mode
echo "Checking current mode of $INTERFACE..."
current_mode=$(iw dev "$INTERFACE" info | grep -oP '(?<=type )\w+')

if [[ "$current_mode" == "monitor" ]]; then
  echo "$INTERFACE is in monitor mode, switching to managed mode..."
  set_managed_mode "$INTERFACE"
fi

# Run the 'wef' program with the selected interface in managed mode
echo "Running 'wef' with interface $INTERFACE..."

# Use the full path to the current directory to run 'wef' with sudo
SCRIPT_DIR=$(dirname "$(realpath "$0")")
sudo "$SCRIPT_DIR/wef" -i "$INTERFACE"

