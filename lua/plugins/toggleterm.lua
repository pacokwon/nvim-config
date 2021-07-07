local toggleterm = require 'toggleterm'

toggleterm.setup {
    size = 20,
    open_mapping = [[ th]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    direction = 'horizontal',
    close_on_exit = false,
}
