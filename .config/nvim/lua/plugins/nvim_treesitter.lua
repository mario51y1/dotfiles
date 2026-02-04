return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {

      ensure_installed = {"python","sql","hcl","dockerfile","bash","json","yaml","c","cpp","vim","lua", "markdown", "markdown_inline", "html", "latex", "terraform" },
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        disable = {},
        additional_vim_regex_highlighting = false,
      },
    }
  }
}
