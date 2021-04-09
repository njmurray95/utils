:: Useful aliases and commands working in the Windows CMD Prompt
:: Change as needed.

:: To set up automatic loading (TODO: Transform into a .reg file):
::  1. regedit 
::  2. HKEY_CURRENT_USER\Software\Microsoft\Command Processor
::  2. Add String Value entry with name "AutoRun" and full path to this file
@echo off

::::::::::::::::::::::::::::::::::::::::
:: General

:: See `prompt /?`
:: $P -> Drive and Path
:: $G -> '>'
:: $S -> (space)
prompt $P$G$S

:: vim / neovim
doskey nvim=nvim-qt.exe $*

:: Python
doskey python2=C:\Program Files\Python27\python.exe
doskey python3=C:\Program Files\Python36\python.exe

:: Useful alert popup
::  * Run multiple commands:
::    && is the "finish if successful operator", but CP interprets as separate from the doskey command
::    ^ is the escape character workaround
::  * Weird symbol/blank after echo is ^G / CTRL-G / ALT+007, represents bell sound when echoed
doskey alert=echo  ^&^& msg %USERNAME% "Task done."
