return {
    "zbirenbaum/nvterm",
    config = function()
        local toggle_modes = { "n", "t" }
        local nvterm = require("nvterm")
        local terminal = require("nvterm.terminal")
        nvterm.setup()
        vim.keymap.set(toggle_modes, "<A-h>", function()
            terminal.toggle("horizontal")
        end, { noremap = true, silent = true })
        vim.keymap.set(toggle_modes, "<A-v>", function()
            terminal.toggle("vertical")
        end, { noremap = true, silent = true })
        vim.keymap.set(toggle_modes, "<A-i>", function()
            terminal.toggle("float")
        end, { noremap = true, silent = true })
    end,
}
