-- Function to bind keys with hyper modifier
function bindKey(modifiers, key, appName)
  hs.hotkey.bind(modifiers, key, function()
      hs.application.launchOrFocus(appName)
  end)
end

-- Bind Option + T to open Terminal
bindKey({"alt"}, "t", "iTerm")

-- Bind Option + C to open Google Chrome
bindKey({"alt"}, "c", "Google Chrome")

-- Bind Option + V to open Visual Studio Code
bindKey({"alt"}, "v", "Visual Studio Code")

bindKey({"alt"}, "s", "Slack")

bindKey({"alt"}, "e", "Finder")

bindKey({"alt"}, "f", "Firefox")

bindKey({"alt"}, "i", "IntelliJ IDEA")

bindKey({"alt"}, "n", "Notion")

bindKey({"alt"}, "b", "Safari")

bindKey({"alt"}, "p", "Postman")

-- reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
