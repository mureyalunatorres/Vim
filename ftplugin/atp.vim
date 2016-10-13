" This file outlines any filtype specific configurations for .ATP files
setlocal nowrap

command CompactVectors %s/\(repeat\s\|set_loop[ABCD]\s\)\@<!\(\<[-01VLHX]\+\)\s\+/\2 /g | ''
