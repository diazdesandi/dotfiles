-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.guifont = "GeistMono NF:h14"  -- or "MonoLisa:h13"
vim.g.neovide_cursor_vfx_mode = "railgun"

-- TRANSPARENCY
vim.g.neovide_opacity = 0.99
vim.g.neovide_background_color = "#1e1e2e" -- fallback BG for transparency

-- CURSOR FX
vim.g.neovide_cursor_vfx_mode = "railgun"  -- Other options: "pixiedust", "sonicboom", "wireframe"
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_density = 20.0

-- WINDOW FX
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_window_blurred = true

-- FRAMELESS WINDOW (if not passed in CLI)
vim.g.neovide_no_idle = false

-- Rounded borders for LSP UI
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

vim.diagnostic.config({
  float = { border = "rounded" },
})