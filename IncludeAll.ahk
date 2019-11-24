; Created by Asger Juul Brunshøj

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn, All  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance

#Include %A_ScriptDir%\src\Validator.ahk
#Include %A_ScriptDir%\src\Commands\ImportCommands.ahk
#Include %A_ScriptDir%\src\Environment\ImportOpeners.ahk
#Include %A_ScriptDir%\src\Commands\Filters.ahk
#Include %A_ScriptDir%\src\Commands\CommandFactory.ahk

#Include %A_ScriptDir%\src\Controller.ahk
#Include %A_ScriptDir%\src\Environment\Environment.ahk
#Include %A_ScriptDir%\src\Gui\Gui.ahk

#Include %A_ScriptDir%\src\Extensions\RegisterExtensions.ahk
#Include %A_ScriptDir%\src\Extensions\UsersExtension\UsersExtension.ahk
#Include %A_ScriptDir%\src\Extensions\DesktopsExtension\DesktopsExtension.ahk