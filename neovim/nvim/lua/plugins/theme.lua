local themes = {

  gruvbox = {
    colorscheme = "gruvbox",
    { "ellisonleao/gruvbox.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "gruvbox",
      },
    },
  },

  solarizedDark = {
    colorscheme = "solarizedDark",
    { "nxstynate/solarizedDark.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "solarizedDark",
      },
    },
  },
  rosePine = {
    colorscheme = "rosePine",
    { "nxstynate/rosePine.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "rosePine",
      },
    },
  },

  monokai = {
    colorscheme = "monokai",
    { "nxstynate/monokai.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "monokai",
      },
    },
  },

  oneDarkPro = {
    colorscheme = "oneDarkPro",
    { "nxstynate/oneDarkPro.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "oneDarkPro",
      },
    },
  },
}
local selectedTheme = "gruvbox"
return themes[selectedTheme]
