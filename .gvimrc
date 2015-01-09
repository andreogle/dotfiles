if has('gui_macvim')
  macmenu Edit.Find.Find\.\.\. key=<nop>
  macmenu File.Print key=<nop>
  macmenu File.Close key=<nop>
  macmenu File.Close\ Window key=<nop>

  map <D-f> /
  map <D-p> :CtrlP<CR>
  map <D-w> <c-w>
endif