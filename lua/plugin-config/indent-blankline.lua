local status, indent_blankline = pcall(require, 'indent_blankline')
if not status then
  vim.notify('没有找到 indent_blankline')
  return
end

indent_blankline.setup({
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = true,
  context_patterns = {
    'class',
    'function',
    'method',
    'element',
    '^if',
    '^while',
    '^for',
    '^object',
    '^table',
    'block',
    'arguments',
  },
  -- :echo &filetype
  filetype_exclude = {
    'dashboard',
    'packer',
    'terminal',
    'help',
    'log',
    'markdown',
    'TelescopePrompt',
    'lsp-installer',
    'lspinfo',
    'toggleterm',
  },
  -- Available styles
  -- char = '¦'
  -- char = '┆'
  -- char = '│'
  -- char = '⎸',
  char = '▏',
})