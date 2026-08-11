#!/usr/bin/env bash

set -euo pipefail

echo "Setting up Human Theme Environment..."

echo "
FREETYPE_PROPERTIES=\"truetype:interpreter-version=35\"
GTK_OVERLAY_SCROLLING=0 
GTK_BACKDROP=1 
GTKM_INSERT_EMOJI=1 
GTK_USE_IEC_UNITS=1 
GTK_FOCUS_VISIBLE=1 
GTK_PROGRESS_TEXT_INSIDE=1 
GTK_TREEVIEW_LINES=0 
GTK_ENLARGE_SCROLLBAR=1
" >>/etc/environment
