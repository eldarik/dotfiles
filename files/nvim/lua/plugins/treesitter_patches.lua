-- Nvim 0.12 changed TSQueryMatch so match[capture_id] returns a list of TSNode
-- instead of a single TSNode. nvim-treesitter master was archived 2026-04-03
-- without adopting the new API, so its predicate/directive handlers crash with
-- "attempt to call method 'range' (a nil value)" inside vim.treesitter.get_node_text.
-- See https://github.com/nvim-treesitter/nvim-treesitter/issues/8636
-- Re-register each affected handler with a list-aware wrapper.

local query = require('vim.treesitter.query')
local opts = { force = true, all = false }

local function first_node(match, id)
  local val = match[id]
  if type(val) == 'table' then
    return val[1]
  end
  return val
end

local html_script_type_languages = {
  importmap = 'json',
  module = 'javascript',
  ['application/ecmascript'] = 'javascript',
  ['text/ecmascript'] = 'javascript',
}

local non_filetype_match_injection_language_aliases = {
  ex = 'elixir',
  pl = 'perl',
  sh = 'bash',
  uxn = 'uxntal',
  ts = 'typescript',
}

local function parser_from_markdown_info_string(alias)
  local m = vim.filetype.match({ filename = 'a.' .. alias })
  return m or non_filetype_match_injection_language_aliases[alias] or alias
end

query.add_predicate('nth?', function(match, _, _, pred)
  local node = first_node(match, pred[2])
  local n = tonumber(pred[3])
  if node and node:parent() and node:parent():named_child_count() > n then
    return node:parent():named_child(n) == node
  end
  return false
end, opts)

query.add_predicate('is?', function(match, _, bufnr, pred)
  local locals = require('nvim-treesitter.locals')
  local node = first_node(match, pred[2])
  local types = { unpack(pred, 3) }
  if not node then
    return true
  end
  local _, _, kind = locals.find_definition(node, bufnr)
  return vim.tbl_contains(types, kind)
end, opts)

query.add_predicate('kind-eq?', function(match, _, _, pred)
  local node = first_node(match, pred[2])
  local types = { unpack(pred, 3) }
  if not node then
    return true
  end
  return vim.tbl_contains(types, node:type())
end, opts)

query.add_directive('set-lang-from-mimetype!', function(match, _, bufnr, pred, metadata)
  local node = first_node(match, pred[2])
  if not node then
    return
  end
  local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
  local configured = html_script_type_languages[type_attr_value]
  if configured then
    metadata['injection.language'] = configured
  else
    local parts = vim.split(type_attr_value, '/', {})
    metadata['injection.language'] = parts[#parts]
  end
end, opts)

query.add_directive('set-lang-from-info-string!', function(match, _, bufnr, pred, metadata)
  local node = first_node(match, pred[2])
  if not node then
    return
  end
  local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
  metadata['injection.language'] = parser_from_markdown_info_string(injection_alias)
end, opts)

query.add_directive('downcase!', function(match, _, bufnr, pred, metadata)
  local id = pred[2]
  local node = first_node(match, id)
  if not node then
    return
  end
  local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ''
  if not metadata[id] then
    metadata[id] = {}
  end
  metadata[id].text = string.lower(text)
end, opts)
