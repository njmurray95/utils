:: To set up automatic loading:
::  1. regedit 
::  2. HKEY_CURRENT_USER\Software\Microsoft\Command Processor
::  2. Add String Value entry with name "AutoRun" and full path to this file
@echo off

:: Python
doskey python2=C:\Program Files\Python27\python.exe
doskey python3=C:\Program Files\Python36\python.exe
