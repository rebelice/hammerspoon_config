local log = hs.logger.new('init.lua', 'debug')

-- Use Control+R to reload Hammerspoon config
hs.hotkey.bind({'ctrl'}, 'r', nil, function ()
  hs.reload()
end)

require('hyper')
require('windows')

hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()