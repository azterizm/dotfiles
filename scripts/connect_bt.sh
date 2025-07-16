#!/bin/bash

# ==============================================================================
# Bluetooth Auto-Connect Script
#
# Description:
# This script automates connecting to a specific Bluetooth device.
# 1. It removes the device if it's already paired or known.
# 2. It starts scanning for Bluetooth devices.
# 3. It waits until the specified device is discovered.
# 4. It stops scanning and connects to the device.
# 5. It includes a timeout to prevent it from running indefinitely.
#
# Usage:
# 1. Make the script executable: chmod +x your_script_name.sh
# 2. Run it: ./your_script_name.sh
#
# Note: This script may require root privileges (run with sudo) to manage
#       Bluetooth settings on some systems.
# ==============================================================================

# --- Configuration ---
# The MAC address of the Bluetooth device you want to connect to.
DEVICE_MAC="33:7B:B5:FF:0A:54"

# The maximum time (in seconds) to wait for the device to appear during a scan.
SCAN_TIMEOUT=60

# --- Script Logic ---

echo "--- Bluetooth Auto-Connect Script ---"
echo "Target Device: $DEVICE_MAC"
echo

# Check if bluetoothctl is available
if ! command -v bluetoothctl &> /dev/null
then
    echo "Error: 'bluetoothctl' command not found."
    echo "Please ensure the 'bluez' package is installed on your system."
    exit 1
fi

# Function to send commands to bluetoothctl
# This makes the script cleaner and easier to read.
run_bluetoothctl_command() {
    echo "Running: bluetoothctl $1"
    bluetoothctl <<< "$1"
}

# 1. Remove the device to ensure a clean slate
echo "[Step 1/4] Attempting to remove any existing pairing for $DEVICE_MAC..."
run_bluetoothctl_command "remove $DEVICE_MAC"
echo "Removal attempt finished. It's okay if it failed; it just means the device wasn't known."
echo

# 2. Start scanning for devices
echo "[Step 2/4] Starting Bluetooth scan..."
run_bluetoothctl_command "scan on" &
SCAN_PID=$! # Capture the process ID of the background scan command

# Disown the process so it doesn't get killed if the script exits unexpectedly
disown $SCAN_PID

# Ensure scanning is turned off when the script exits for any reason
trap 'echo "Stopping scan..."; run_bluetoothctl_command "scan off"; kill $SCAN_PID &> /dev/null' EXIT

# 3. Wait for the device to be discovered
echo "[Step 3/4] Waiting for device to appear... (Timeout: ${SCAN_TIMEOUT}s)"
SECONDS=0 # BASH built-in timer
device_found=false

while [ $SECONDS -lt $SCAN_TIMEOUT ]; do
    # Check if the device is in the list of discovered devices
    if bluetoothctl devices | grep -q "$DEVICE_MAC"; then
        echo "Success: Device $DEVICE_MAC found!"
        device_found=true
        break
    fi
    # Wait a moment before checking again
    sleep 2
    echo -n "."
done
echo # Newline for cleaner output

# 4. Connect to the device or handle timeout
if [ "$device_found" = true ]; then
    echo "[Step 4/4] Stopping scan and attempting to connect..."
    run_bluetoothctl_command "scan off"
    
    # Attempt to connect
    run_bluetoothctl_command "connect $DEVICE_MAC"
    
    # Check connection status
    if bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
        echo "--- Script Finished: Successfully connected to $DEVICE_MAC ---"
        exit 0
    else
        echo "--- Script Finished: Failed to establish a connection. ---"
        exit 1
    fi
else
    echo
    echo "--- Script Finished: Timeout reached. Device $DEVICE_MAC not found after ${SCAN_TIMEOUT} seconds. ---"
    exit 1
fi

