; Examples

; Replace "btw" with "by the way" after pressing "default ending character"
::btw::by the way

; Replace "btw" with "by the way" without pressing ending character
:*:btw::by the way

; Run Notepad on CTRL+n
^n::
Run, notepad.exe
return
