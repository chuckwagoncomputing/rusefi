#!/bin/bash

INTERACTIVE_HTML_BOM_NO_DISPLAY="true"
IBOM_CMD="python3 hardware/InteractiveHtmlBom/InteractiveHtmlBom/generate_interactive_bom.py --no-browser --name-format \"%f_latest\" --dest-dir ../ibom --include-nets"
echo "IBOM_CMD=$IBOM_CMD"

echo "Current directory: $(pwd)"
[ $(basename $(pwd)) = 'rusef' ] || { echo "Not in 'rusefi' directory. Was this invoked from the wrong directory?"; exit 1; }

for f in $(ls hardware/*/*.kicad_pcb); do
  if ls $(dirname $f)/$(basename $f .kicad_pcb).net 2>/dev/null; then
    $IBOM_CMD --netlist-file $(ls $(dirname $f)/$(basename $f .kicad_pcb).net) $f
  else
    $IBOM_CMD $f
  fi
done
