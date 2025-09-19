return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "black",
        "clangd",
        "verible",
        "clang-format",
        "codelldb",
        "pyright",
        "mypy",
        "bash-language-server",
        "shellcheck",
        "shfmt",
      })
    end,
  },
}
