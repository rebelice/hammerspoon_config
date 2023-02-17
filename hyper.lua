local status, hyperModeAppMappings = pcall(require, 'hyper-apps')
local application = require "hs.application"

for i, mapping in ipairs(hyperModeAppMappings) do
    local key = mapping[1]
    local app = mapping[2]
    hs.hotkey.bind({'shift', 'ctrl', 'alt', 'cmd'}, key, function ()
        toggleApplication(app)
    end)
end

function toggleApplication(_app)
  -- finds a running applications
  local app = application.find(_app)
  if not app then
    -- application not running, launch app
    application.open(_app)
    return
  end
  -- application running, toggle hide/unhide
  local mainwin = app:mainWindow()
  hs.logger.new('hyper'):e('mainwin', mainwin)
  if mainwin then
    if true == app:isFrontmost() then
      mainwin:application():hide()
    else
      mainwin:application():activate(true)
      mainwin:application():unhide()
      mainwin:focus()
    end
  else
    app:setFrontmost(true)
  end
end