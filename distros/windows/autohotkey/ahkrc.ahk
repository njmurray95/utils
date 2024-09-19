; AutoHotKey
;
; General system-wide config


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Remap Caps Lock to Escape on Press and Control on hold
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    If ((A_TickCount-cDown) < 300) ; Press time in Milliseconds
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

; Allow normal Caps Lock toggling with Alt+Escape
!Esc::
    GetKeyState, capsstate, CapsLock, T
    If capsstate = U
        SetCapsLockState, AlwaysOn
    Else
        SetCapsLockState, AlwaysOff
Return
