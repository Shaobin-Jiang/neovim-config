--[[ local status, undotree = pcall(require, 'undotree')
if not status then
  vim.notify('没有找到 undotree')
  return
end ]]

vim.g.undotree_WindowLayout = 2
vim.g.undotree_TreeNodeShape = '-'
