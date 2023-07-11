-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = 'Ayu Dark (Gogh)'
config.font = wezterm.font(
    'VictorMono Nerd Font Mono',
    {
        weight = 'Bold',
    })
config.font_size = 11

config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' }

local act = wezterm.action
config.keys = {
    {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = act.ActivateTabRelative(-1),
    },
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = act.ActivateTabRelative(1),
    },
    {
        key = 'n',
        mods = 'CTRL|SHIFT',
        action = act.SpawnTab('DefaultDomain'),
    },
    {
        key = '<',
        mods = 'CTRL|SHIFT',
        action = act.SpawnTab('CurrentPaneDomain'),
    },
    {
        key = 'm',
        mods = 'CTRL|SHIFT',
        action = act.SpawnCommandInNewTab {
            args = { 'nvim' },
            domain = 'CurrentPaneDomain',
        },
    },
    {
        key = 'g',
        mods = 'CTRL|SHIFT',
        action = act.SpawnCommandInNewTab {
            args = { 'C:\\Program Files\\Git\\bin\\bash.exe' },
            domain = 'DefaultDomain',
        },
    },
}
-- and finally, return the configuration to wezterm
return config
