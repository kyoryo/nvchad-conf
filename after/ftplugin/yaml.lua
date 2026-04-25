-- Only look for files, ignore the JSON pointer/fragment
vim.opt_local.includeexpr = "substitute(v:fname, '#.*', '', '')"
-- Ensure Neovim knows to look for .yaml or .yml if you omit them
vim.opt_local.suffixesadd = ".yaml,.yml"
-- Add curly braces to the list of valid filename characters
vim.opt.isfname:append "{,}"
