#!/usr/bin/env bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root"
    exit 1
fi

if [[ -z "$1" ]]; then
    echo "Usage: $0 /path/to/custom_layout_file"
    exit 1
fi

CUSTOM_LAYOUT_FILE="$1"
SYMBOLS_FILE="/usr/share/X11/xkb/symbols/us"
EVDEV_FILE="/usr/share/X11/xkb/rules/evdev.xml"

if grep -q "sinder-prog-dvorak" "$EVDEV_FILE"; then
    echo "Already exists. Exiting."
    exit 0
fi

if grep -q "sinder-prog-dvorak" "$SYMBOLS_FILE"; then
    echo "Layout already in symbols file. Exiting."
    exit 0
fi

# --- Insert into symbols file ---
cp "$SYMBOLS_FILE" "$SYMBOLS_FILE.bak"
TMPFILE=$(mktemp)
awk -v layoutfile="$CUSTOM_LAYOUT_FILE" '
    /xkb_symbols "dvp"/ && !inserted {
        while ((getline line < layoutfile) > 0) print line
        print ""
        inserted=1
    }
    { print }
' "$SYMBOLS_FILE" > "$TMPFILE"
mv "$TMPFILE" "$SYMBOLS_FILE"
echo "✅ Inserted custom layout into symbols file"

# --- Insert into evdev.xml using sed ---
# Insert AFTER the </variant> that closes the dvp block (line 3089)
cp "$EVDEV_FILE" "$EVDEV_FILE.bak"
sed -i '/<name>dvp<\/name>/{
    /English (programmer Dvorak)/!b
    n;n;n
    a\        <variant>\n          <configItem>\n            <name>sinder-prog-dvorak<\/name>\n            <description>English (Sinder Programmers Dvorak)<\/description>\n          <\/configItem>\n        <\/variant>
}' "$EVDEV_FILE"

xmllint --noout "$EVDEV_FILE" && echo "✅ XML valid" || echo "❌ XML invalid!"
echo "🎉 Done. Log out and back in."
