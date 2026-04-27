local options = {
  bar = {
    enable = function(buf, win, _)
      buf = vim._resolve_bufnr(buf)

      local ft = vim.bo[buf].filetype
      if vim.tbl_contains({
        "http",
      }, ft) then
        return false
      end

      -- fallback to default behavior
      if
        not vim.api.nvim_buf_is_valid(buf)
        or not vim.api.nvim_win_is_valid(win)
        or vim.fn.win_gettype(win) ~= ""
        or vim.wo[win].winbar ~= ""
        or ft == "help"
      then
        return false
      end

      -- disable for large files
      local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
      if stat and stat.size > 1024 * 1024 then
        return false
      end
      return true
    end,
  },
}
require("dropbar").setup(options)
