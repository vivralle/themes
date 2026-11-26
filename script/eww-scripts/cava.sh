#!/bin/bash
# Set to "block" or "braille"
STYLE="${1:-block}"
FRAME_SKIP=1   # 1 = print every frame; 2 = every other frame, etc.

CONF=$(mktemp /tmp/eww_cava.XXXXXX.conf)
cat > "$CONF" <<EOF
[general]
bars = 24
framerate = 45

[input]
method = pulse

[smoothing]
monstercat = 1.5
noise_reduction = 77
gravity = 120

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
bar_delimiter = 59
EOF

  bars=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

# Kill cava when this script exits (e.g. when eww stops listening)
trap 'kill 0; rm -f "$CONF"' EXIT

i=0
cava -p "$CONF" | while IFS= read -r line; do
  ((i++ % FRAME_SKIP)) && continue
  out=""
  IFS=';' read -ra v <<< "$line"
  for n in "${v[@]}"; do
    [[ $n =~ ^[0-7]$ ]] && out+="${bars[$n]}"
  done
  printf '%s\n' "$out"
done
