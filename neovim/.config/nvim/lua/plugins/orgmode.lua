return {
    "nvim-orgmode/orgmode",
    ft = { "org" },
    opts = {
        org_agenda_files = "~/notes/**/*",
        org_default_notes_file = "~/notes/quick.org",
        org_todo_keywords = { "NOW", "SOON", "LATER", "|", "DONE" },
        org_todo_keyword_faces = {
            NOW = ":foreground red",
            SOON = ":foreground orange",
            LATER = ":foreground gray",
            DONE = ":foreground green",
        },
        org_startup_folded = "showeverything",
        org_hide_leading_stars = true,
    },
    keys = {
        {
            "<leader>ns",
            function()
                local neogit = require("neogit")
                neogit.open({ cwd = "~/notes/" })
            end,
        },
    },
}
