#Include %A_ScriptDir%\src\Commands\Command.ahk

class ShowMessage extends Command {
    __New(message) {
        this._message := message
        this._description := "Show message """ message """"
    }

    Run(mainController) {
        MsgBox % this._message
    }
}
