-- Function to bind keys with hyper modifier
function bindKey(modifiers, key, appName)
  hs.hotkey.bind(modifiers, key, function()
      hs.application.launchOrFocus(appName)
  end)
end

-- bind on letter keys
bindKey({"alt"}, "t", "/Users/ling/Applications/iTerm.app")

-- Bind Option + C to open Google Chrome
bindKey({"alt"}, "c", "Google Chrome")

-- Bind Option + V to open Visual Studio Code
bindKey({"alt"}, "v", "/Users/ling/Applications/Visual Studio Code.app")

bindKey({"alt"}, "s", "/Users/ling/Applications/Slack.app")

bindKey({"alt"}, "e", "/Users/ling/Applications/Cursor.app")

bindKey({"alt"}, "f", "Firefox")

bindKey({"alt"}, "r", "Safari")

bindKey({"alt"}, "i", "/Users/ling/Applications/IntelliJ IDEA.app")

bindKey({"alt"}, "p", "Passwords")

bindKey({"alt"}, "a", "Finder")

bindKey({"alt"}, "o", "/Applications/Microsoft Outlook.app")

bindKey({"alt"}, "n", "/Users/ling/Applications/Notion.app")

bindKey({"alt"}, "g", "/Users/ling/Applications/GoLand.app")

bindKey({"alt"}, "w", "/Users/ling/Applications/Warp.app")

bindKey({"alt"}, "z", "/Users/ling/Applications/Zed.app")

--- bind on number keys
bindKey({"alt"}, "1", "/Users/ling/Applications/ChatGPT.app")
bindKey({"alt"}, "2", "/Users/ling/Applications/Claude.app")

-- reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
