-- Function to bind keys with hyper modifier
function bindKey(modifiers, key, appName)
  hs.hotkey.bind(modifiers, key, function()
    hs.application.launchOrFocus(appName)
  end)
end

bindKey({ "alt" }, "a", "Finder")

-- Bind Option + C to open Google Chrome
bindKey({ "alt" }, "c", "Google Chrome")

bindKey({ "alt" }, "d", "/Applications/DataGrip.app")

bindKey({ "alt" }, "e", "/Applications/Cursor.app")

bindKey({ "alt" }, "f", "Firefox")

bindKey({ "alt" }, "i", "/Applications/IntelliJ IDEA.app")

bindKey({ "alt" }, "n", "/Applications/Notion.app")

bindKey({ "alt" }, "o", "/Applications/Microsoft Outlook.app")
-- bindKey({ "alt" }, "o", "/Applications/Obsidian.app")

bindKey({ "alt" }, "p", "Passwords")

bindKey({ "alt" }, "r", "Safari")

bindKey({ "alt" }, "s", "/Applications/Slack.app")

-- bind on letter keys
bindKey({ "alt" }, "t", "/Applications/Ghostty.app")
bindKey({ "alt" }, "3", "/Applications/iTerm.app")
-- bindKey({ "alt" }, "t", "/Applications/Alacritty.app")

-- Bind Option + V to open Visual Studio Code
bindKey({ "alt" }, "v", "/Applications/Visual Studio Code.app")

bindKey({ "alt" }, "z", "/Applications/Zed.app")

-- reload config
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
