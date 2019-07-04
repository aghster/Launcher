﻿; Created by Asger Juul Brunshøj

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance

SetCapsLockState, AlwaysOff

#Include %A_ScriptDir%\src\Executables\Commands\ImportCommands.ahk

#Include %A_ScriptDir%\UserCommands.ahk
global topLevelExecutable := CreateCommands()

#Include %A_ScriptDir%\src\CommandHandler.ahk
Initialize()


; #InstallKeybdHook

;-------------------------------------------------------
; AUTO EXECUTE SECTION FOR INCLUDED SCRIPTS
; Scripts being included need to have their auto execute
; section in a function or subroutine which is then
; executed below.
;-------------------------------------------------------
Gosub, gui_autoexecute
;-------------------------------------------------------
; END AUTO EXECUTE SECTION
return
;-------------------------------------------------------

; Load the GUI code
#Include %A_ScriptDir%\src\GuiLauncher.ahk

; General settings
#Include %A_ScriptDir%\src\Utils.ahk
