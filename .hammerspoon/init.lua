-- Function to bind keys with hyper modifier
function bindKey(modifiers, key, appName)
  hs.hotkey.bind(modifiers, key, function()
    hs.application.launchOrFocus(appName)
  end)
end

bindKey({ "alt" }, "a", "Finder")


bindKey({ "alt" }, "b", "Preview")

-- Bind Option + C to open Google Chrome
bindKey({ "alt" }, "c", "Google Chrome")

bindKey({ "alt" }, "d", "/Users/ling/Applications/DataGrip.app")

bindKey({ "alt" }, "e", "/Users/ling/Applications/Cursor.app")

bindKey({ "alt" }, "f", "Firefox")

bindKey({ "alt" }, "g", "/Users/ling/Applications/GoLand.app")

bindKey({ "alt" }, "i", "/Users/ling/Applications/IntelliJ IDEA.app")

bindKey({ "alt" }, "n", "/Users/ling/Applications/Notion.app")

bindKey({ "alt" }, "o", "/Applications/Microsoft Outlook.app")
-- bindKey({ "alt" }, "o", "/Users/ling/Applications/Obsidian.app")

bindKey({ "alt" }, "p", "Passwords")

bindKey({ "alt" }, "r", "Safari")

bindKey({ "alt" }, "s", "/Users/ling/Applications/Slack.app")

-- bind on letter keys
bindKey({ "alt" }, "t", "/Users/ling/Applications/Ghostty.app")
-- bindKey({ "alt" }, "t", "/Users/ling/Applications/iTerm.app")

-- Bind Option + V to open Visual Studio Code
bindKey({ "alt" }, "v", "/Users/ling/Applications/Visual Studio Code.app")

bindKey({ "alt" }, "z", "/Users/ling/Applications/Zed.app")

--- bind on number keys
bindKey({ "alt" }, "1", "/Users/ling/Applications/Claude.app")
bindKey({ "alt" }, "2", "/Users/ling/Applications/ChatGPT.app")

-- reload config
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
