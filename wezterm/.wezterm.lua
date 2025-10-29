-- Pull in the wezterm API
local wezterm = require("wezterm")

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
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 12
--config.font_locator = 'ConfigDirsOnly'
--config.font_dirs = { 'scoop\\apps\\VictorMono-NF-Mono\\current' }

config.default_prog = { "pwsh.exe" }

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = true

wezterm.on('opacity-up', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity and overrides.window_background_opacity <= 0.1 then
        return
    end
    if not overrides.window_background_opacity then
        overrides.window_background_opacity = 0.9
    else
        overrides.window_background_opacity = overrides.window_background_opacity - 0.1
    end
    window:set_config_overrides(overrides)
end)

wezterm.on('opacity-down', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.window_background_opacity then
        return
    end
    if overrides.window_background_opacity >= 0.9 then
        overrides.window_background_opacity = nil
    else
        overrides.window_background_opacity = overrides.window_background_opacity + 0.1
    end
    window:set_config_overrides(overrides)
end)

local act = wezterm.action
config.keys = {
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = act.ActivateTabRelative(-1),
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = act.ActivateTabRelative(1),
    },
    {
        key = "h",
        mods = "ALT|SHIFT",
        action = act.MoveTabRelative(-1),
    },
    {
        key = "l",
        mods = "ALT|SHIFT",
        action = act.MoveTabRelative(1),
    },
    {
        key = "n",
        mods = "CTRL|SHIFT",
        action = act.SpawnCommandInNewTab({
            cwd = "~",
        }),
    },
    {
        key = "<",
        mods = "CTRL|SHIFT",
        action = act.SpawnTab("CurrentPaneDomain"),
    },
    {
        key = "m",
        mods = "CTRL|SHIFT",
        action = act.SpawnCommandInNewTab({
            args = { "nvim" },
            domain = "CurrentPaneDomain",
        }),
    },
    {
        key = "p",
        mods = "CTRL|SHIFT",
        action = act.ActivateCopyMode,
        -- v to clear selection
    },
    {
        key = "d",
        mods = "CTRL|SHIFT",
        action = act.ActivateCommandPalette,
    },
    {
        key = "?",
        mods = "CTRL|SHIFT",
        action = act.Search("CurrentSelectionOrEmptyString"),
        -- CRTL-U to clear search pattern
    },
    {
        key = "o",
        mods = "CTRL|SHIFT",
        action = act.Search({
            Regex = "[a-f0-9]{6,}",
        }),
    },
    {
        key = "i",
        mods = "CTRL|SHIFT",
        action = act.Search({
            Regex = "\\bsf\\s+[^\"\\n\\r]*",
        }),
    },
    {
        key = "u",
        mods = "SHIFT|CTRL",
        action = wezterm.action.CharSelect({
            copy_on_select = true,
            copy_to = "ClipboardAndPrimarySelection",
        }),
    },
    {
        key = "{",
        mods = "CTRL|SHIFT",
        action = wezterm.action.EmitEvent("opacity-down"),
    },
    {
        key = "}",
        mods = "CTRL|SHIFT",
        action = wezterm.action.EmitEvent("opacity-up"),
    }
}

-- start maximized
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
