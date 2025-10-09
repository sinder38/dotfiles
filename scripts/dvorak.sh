#!/usr/bin/env bash
# Add a custom keyboard layout to Linux (XKB)
# Usage: ./add_custom_layout.sh /path/to/custom_layout_file

set -e

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root (e.g., sudo $0 /path/to/custom_layout_file)"
    exit 1
fi

if [[ -z "$1" ]]; then
    echo "Usage: $0 /path/to/custom_layout_file"
    exit 1
fi

CUSTOM_LAYOUT_FILE="$1"
SYMBOLS_FILE="/usr/share/X11/xkb/symbols/us"
EVDEV_FILE="/usr/share/X11/xkb/rules/evdev.xml"

# --- Insert custom layout into symbols file ---
if grep -q "English (Real Programmers Dvorak)" "$EVDEV_FILE"; then
    echo "Custom layout already seems to exist. Exiting."
    exit 0
fi

TMPFILE=$(mktemp)
awk -v layout="$(cat "$CUSTOM_LAYOUT_FILE")" '
    BEGIN { inserted=0 }
    {
        if (!inserted && $0 ~ /xkb_symbols "dvp"/) {
            print layout "\n";
            inserted=1;
        }
        print $0;
    }
' "$SYMBOLS_FILE" > "$TMPFILE"

cp "$SYMBOLS_FILE" "$SYMBOLS_FILE.bak"
# mv "$TMPFILE" "$SYMBOLS_FILE"
echo "✅ Inserted custom layout into $SYMBOLS_FILE"

# --- Insert variant entry into evdev.xml ---
TMPFILE=$(mktemp)
awk '
    /<name>dvp<\/name>/ && !done {
        print;
        getline;
        print $0;
        getline;
        print $0;
        getline;
        print $0;
        print "        <variant>";
        print "          <configItem>";
        print "            <name>real-prog-dvorak</name>";
        print "            <description>English (Real Programmers Dvorak)</description>";
        print "          </configItem>";
        print "        </variant>";
        done=1;
        next;
    }
    { print }
' "$EVDEV_FILE" > "$TMPFILE"

cp "$EVDEV_FILE" "$EVDEV_FILE.bak"
mv "$TMPFILE" "$EVDEV_FILE"
echo "✅ Added layout entry to $EVDEV_FILE"

echo "🎉 Custom layout successfully added."

