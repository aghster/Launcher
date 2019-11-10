; Returns function that returns some setting value when called with controller.
; Example usage:
/*
new ShowMessage(GetEnvironmentSetting("browser")).SetDescription("Show current browser")
*/
GetEnvironmentSetting(setting) {
    return Func("GetEnvironmentSettingFunction").Bind(setting)
}

GetEnvironmentSettingFunction(setting, contr, context) {
    return contr.GetEnvironment().GetSetting(GetValue(setting, contr, context))
}

; Helper method for commands.
; In many commands user can give string or function returning string.
GetValue(objOrFunc, contr, context) {
    callResult := %objOrFunc%(contr, context)
    if (callResult != "") {
        return callResult
    } else {
        return objOrFunc
    }
}

; Shows input in gui. Returns entered string value.
; If user closes gui before pressing Return key, `options.defaultValue` is returned.
GetUserInput(options := "") {
    static DEFAULT_OPTIONS := { title: "", defaultValue: "Default value" }
    options := MergeArrays(DEFAULT_OPTIONS, options)
    return Func("_GetUserInput").Bind(options.title, options.defaultValue)
}

_GetUserInput(title, defaultValue, contr, context) {
    gui := contr.GetGui()
    gui.DisableAll()
    title := GetValue(title, contr, context)
    if (title != "") {
        gui.AddText({ text: title })
    }
    inputControl := gui.AddTextInput()
    state := { submitted: false
             , input: ""
             , inputControl: inputControl
             , defaultValue: defaultValue}
    state.returnSubscription := inputControl.SubscribeReturnPressed(Func("_GetUserInputHandler").Bind(state), { duration: "once" })
    ; this subscription unsubscribes itself, sooner or later gui has to be destroyed
    gui.SubscribeGuiDestroyed(Func("_GetUserGuiDestroyedHandler").Bind(state), { duration: "once" })
    gui.Show()
    while (!state.submitted) {
        ; spinlock this thread
    }
    gui.DisableAll()
    return state.input
}

_GetUserInputHandler(ByRef state, input) {
    state.input := input
    state.submitted := true
}

_GetUserGuiDestroyedHandler(ByRef state) {
    state.input := state.defaultValue
    state.submitted := true
    state.returnSubscription.Unsubscribe()
}
