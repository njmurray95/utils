#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Trigger mouse movement every minute to avoid sleep
SetTimer,KeepAwake,60000         ; run every minute
return
 
KeepAwake:
{
     MouseMove,5,0,0,R ; mouse pointer stays in place but sends a mouse event
     ;MouseMove,0,0,0,R ; mouse pointer stays in place but sends a mouse event
}
return