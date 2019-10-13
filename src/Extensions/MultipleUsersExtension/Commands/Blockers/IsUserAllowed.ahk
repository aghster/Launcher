#Include %A_ScriptDir%\src\Utils\ObjectUtils.ahk

; For use as command blocker.
MultipleUsers_IsUserAllowed(com, contr) {
    user := contr.GetEnvironment()["user"]
    config := com.GetUserConfig()
    isOnBlacklist := config.blacklist == "all" 
                    || ArrayContains(config.blacklist, user)
    isOnWhitelist := config.whitelist == "all"
                    || ArrayContains(config.whitelist, user)
    isBlocked := isOnBlacklist && !isOnWhitelist
    if (isOnBlacklist && !isOnWhitelist) {
        return "Command """ com.GetDescription() """ `ncannot be run for user """ user """."
    } else {
        return false
    }
}