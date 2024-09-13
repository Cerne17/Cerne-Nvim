require('oil').setup({
    vim.keymap.set({"n", "v"}, "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" }),

    default_file_explorer = true,

    columns = {
        "icon",
        -- "permissions",
    },

    skip_confirmation_for_simple_edits = true,

    prompt_save_on_select_new_entry = true,

    view_options = {
        show_hidden = true,

        is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
        end,
        is_always_hidden = function(name, bufnr)
            return false
        end,
    }
})
