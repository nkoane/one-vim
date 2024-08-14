-- TODO: formatting stuff

require("notify")("hello, formatting running here")

return {
    {
        'stevearc/conform.nvim',
        dependencies = { "mason.nvim" },
        lazy = "true",
        opts = {},
    }
}
