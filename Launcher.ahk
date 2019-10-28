#Include %A_ScriptDir%\IncludeAll.ahk
#Include %A_ScriptDir%\UserCommands.ahk
rootCommand := CreateCommands()
main := new Controller(new Environment(), new Gui())
main.SetRootCommand(rootCommand)
extensionManager.Attach(main, "all", {users: {desktopToUserMap: desktopToUserMap}})

^/::
    main.Execute()
    return

#Include %A_ScriptDir%\src\Gui\GuiEscapes.ahk
