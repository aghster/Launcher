﻿#Include %A_ScriptDir%\src\Executables\Executable.ahk

class CommandSet extends Executable {
    subscribedTo := ["keyPressed", "returnPressed"]
    Execute(input) {
        if (not this.commands.HasKey(input)) {
            return false
        }
        command := this.commands[input]
        result := %command%()
        if (result == "") {
            return true
        }
        return result
    }
}
