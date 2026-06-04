local term_buf = nil

local function toggle_float_term()
  local existing_win = nil
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        existing_win = win
        break
      end
    end
  else
    term_buf = nil
  end

  if existing_win then
    vim.api.nvim_win_close(existing_win, true)
    return
  end

  local buf
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    buf = term_buf
  else
    buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].filetype = "float_term"
    term_buf = buf
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.7)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.api.nvim_win_set_option(win, "number", false)
  vim.api.nvim_win_set_option(win, "relativenumber", false)

  if vim.fn.bufexists(buf) == 0 or vim.b[buf].terminal_job_id == nil then
    vim.fn.termopen(vim.env.SHELL, {
      on_exit = function()
        term_buf = nil
      end,
    })
  end

  vim.cmd("startinsert")
end

return { toggle = toggle_float_term }