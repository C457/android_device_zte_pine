#!/vendor/bin/sh

# vendor format:
# wifiaddr:0x50 0x22 0x80 0xCF 0xB9 0x35
WLAN_MAC_VENDOR_PATH="/mnt/vendor/persist/wifimac.dat"

# expected format:
# Intf0MacAddress=000AF58989FF
# Intf1MacAddress=000AF58989FE
# END
WLAN_MAC_PERSIST_PATH="/mnt/vendor/persist/wlan_mac.bin"

function wait_for_file() {
    file="${1}"
    max_retries=10
    retries=0

    while [ ! -s "${file}" ]; do
        retries=$((retries + 1))

        if [ "${retries}" -eq "${max_retries}" ]; then
            return 1
        fi

        sleep 1
    done

    return 0
}

if ! wait_for_file "${WLAN_MAC_VENDOR_PATH}"; then
    exit
fi

if [ ! -f "${WLAN_MAC_PERSIST_PATH}" ]; then
    # Read file contents
    raw_mac_data=$(cat "${WLAN_MAC_VENDOR_PATH}")

    # Strip wifiaddr: from the string
    raw_mac="${raw_mac_data#*:}"

    # Store raw mac in an array for easy manipulation
    wifiaddr=($raw_mac)

    # The MAC of the first interface is the raw mac,
    first_mac=$(printf "%X" "${wifiaddr[@]}")

    # Increment index 5 by 1.
    wifiaddr[5]=$((${wifiaddr[5]} +1))
    
    # The MAC of the second interface is the first
    # mac incremented by 1.
    second_mac=$(printf "%X" "${wifiaddr[@]}")

    # Write the MACs
    echo "Intf0MacAddress=${first_mac}" > "${WLAN_MAC_PERSIST_PATH}"
    echo "Intf1MacAddress=${second_mac}" >> "${WLAN_MAC_PERSIST_PATH}"
    echo "END" >> "${WLAN_MAC_PERSIST_PATH}"
fi

insmod /vendor/lib/modules/wlan.ko
