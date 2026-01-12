#!/usr/bin/env bash
set -euo pipefail

# find first .trace in current directory
TRACE="$(ls *.trace 2>/dev/null | head -n 1 || true)"

if [[ -z "$TRACE" ]]; then
  echo "[!] no .trace file found in current directory"
  exit 1
fi

if [[ ! -d "$TRACE" ]]; then
  echo "[!] $TRACE exists but is not a directory"
  exit 1
fi

TMP_XML="$(mktemp /tmp/xctrace.XXXXXX.xml)"

echo "[*] found trace: $TRACE"
echo "[*] exporting trace → XML..."

xctrace export --input "$TRACE" > "$TMP_XML"

# sanity check: any numbers at all?
if ! grep -Eq '[0-9]' "$TMP_XML"; then
  echo "[!] no numeric data found in exported XML"
  echo "[!] counters likely instrument-private (not CLI-exportable)"
  rm -f "$TMP_XML"
  exit 2
fi

echo "[*] extracting rows → table..."

ROWS="$(xmllint --xpath '//row' "$TMP_XML" 2>/dev/null || true)"

if [[ -z "$ROWS" ]]; then
  echo "[!] no <row> elements found in XML"
  echo "[!] this trace does not expose counters as tables"
  rm -f "$TMP_XML"
  exit 3
fi

# print table
echo "$ROWS" \
  | sed 's/<[^>]*>/ /g' \
  | tr -s ' ' \
  | sed '/^\s*$/d' \
  | column -t

echo "[*] cleaning up..."
rm -f "$TMP_XML"
rm -rf "$TRACE"

echo "[✓] done"
