local options = {
  autoread      = true,
  autowrite     = true,
  background    = "light",
  clipboard     = "unnamed,unnamedplus",    --- Copy-paste between vim and everything else
  cmdheight     = 1,                        --- Give more space for displaying messages
  completeopt   = "menu,menuone,noselect",  --- Better autocompletion
  cursorcolumn  = true,
  cursorline    = true,                     --- Highlight of current line
  encoding      = "utf-8",                  --- The encoding displayed
  expandtab     = true,                     --- Use spaces instead of tabs
  ignorecase    = true,                     --- Needed for smartcase
  langmap       = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz',
  lazyredraw    = true,                     --- Makes macros faster & prevent errors in complicated mappings
  lcs           = "tab:>¬,trail:~,space:·", --- Show spaces, trail spaces, tabs
  list          = true,
  mouse         = "a",                      --- Enable mouse
  number        = true,                     --- Shows current line number
  scrolloff     = 4,                        --- Always keep space when scrolling to bottom/top edge
  shiftwidth    = 2,                        --- Change a number of space characeters inseted for indentation
  signcolumn    = "yes:1",                  --- Add extra sign column next to line number
  smartcase     = true,                     --- Uses case in search
  smartindent   = true,                     --- Makes indenting smart
  smarttab      = true,                     --- Makes tabbing smarter will realize you have 2 vs 4
  softtabstop   = 2,                        --- Insert 2 spaces for a tab
  splitright    = true,                     --- Vertical splits will automatically be to the right
  swapfile      = false,                    --- Swap not needed
  tabstop       = 2,                        --- Insert 2 spaces for a tab
  -- timeoutlen     = 200,                     --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
  -- ttimeoutlen    = 3000,
  undofile      = true,     --- Sets undo to file
  updatetime    = 100,      --- Faster completion
  viminfo       = "'1000",  --- Increase the size of file history
  wrap          = true,     --- Display long lines as just one line
  writebackup   = false,    --- Not needed
  termguicolors = true,
}

local globals = {
  mapleader = ' ',                   --- Map leader key to SPC
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
