local status, hop = pcall(require, 'hop')
if not status then
    vim.notify('没有找到 hop')
end

hop.setup({
    hint_position = require('hop.hint').HintPosition.END,
    keys = 'fjghdksltyrueiwoqpvbcnxmza'
})
