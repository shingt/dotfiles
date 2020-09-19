local function keyCode(key, modifiers)
  modifiers = modifiers or {}
  return function()
    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
    hs.timer.usleep(1000)
    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

local function remapKey(modifiers, key, keyCode)
  hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
  for k, v in pairs(hs.hotkey.getHotkeys()) do
    v['_hk']:disable()
  end
end

local function enableAllHotkeys()
  for k, v in pairs(hs.hotkey.getHotkeys()) do
    v['_hk']:enable()
  end
end

local function handleGlobalAppEvent(name, event, app)
  if event == hs.application.watcher.activated then
    if (name ~= "iTerm2") then
      enableAllHotkeys()
    else
      disableAllHotkeys()
    end
  end
end

local function keyCtrlK()
  keyCode('right', {'shift', 'cmd'})()
  keyCode('x', {'cmd'})()
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

remapKey({'ctrl'}, 'j', keyCode('return'))
remapKey({'ctrl'}, 'w', keyCode('x', {'cmd'}))

remapKey({'ctrl'}, 'v', keyCode('pagedown'))
remapKey({'option'}, 'v', keyCode('pageup'))
