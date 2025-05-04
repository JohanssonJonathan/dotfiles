local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"


local lazyExist = vim.uv.fs_stat(lazypath);

if not lazyExist then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end



vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  import = "plugins",
  opts = {
    rocks = {
      -- disables luarocks error when checking :checkhealth lazy.
      enabled = false,
      hererocks = false,
    }
  }
})
