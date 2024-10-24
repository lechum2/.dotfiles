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
        org_hide_leading_stars = true,
        mappings = {
            global = {
                org_agenda = { "gA", "<Leader>oa" },
                org_capture = { "gC", "<Leader>oc" },
            },
        }
    },
    keys = {
        {
            "<leader>ns",
            function()
                require("neogit").open({ cwd = "~/notes/" })
            end,
            desc = "Neogit notes"
        },
    },
}
