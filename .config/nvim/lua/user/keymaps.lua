local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local conform = require("conform")
local utils = require("user.utils")
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")

local M = {}

-- Normal --
-- Disable space bar --
nnoremap("<space>", "<nop>")

-- Swap between last two buffers
nnoremap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", { silent = false, desc = "Save" })

-- Move lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", { silent = false, desc = "Quit" })

-- Save and Quit with leader key
nnoremap("<leader>z", "<cmd>wq<cr>", { silent = false, desc = "Save and quit" })

-- Source current file
nnoremap("<leader>x", ":source % <CR>", { desc = "Execute code" })

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
	require("oil").toggle_float()
end, { desc = "Open oil" })

-- Map Undotree to <leader>ut
nnoremap("<leader>ut", ":UndotreeToggle<CR>", { desc = "Toggle [U]ndo[T]ree" })

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz", { desc = "Center buffer while scrolling up" })
nnoremap("<C-d>", "<C-d>zz", { desc = "Center buffer while scrolling down" })
nnoremap("{", "{zz", { desc = "Center buffer after paragraph jump up" })
nnoremap("}", "}zz", { desc = "Center buffer after paragraph jump down" })
nnoremap("N", "Nzz", { desc = "Center buffer after previous search result" })
nnoremap("n", "nzz", { desc = "Center buffer after next search result" })
nnoremap("G", "Gzz", { desc = "Center buffer after end of file jump" })
nnoremap("gg", "ggzz", { desc = "Center buffer after beginning of file jump" })
nnoremap("gd", "gdzz", { desc = "Center buffer after go to definition" })
nnoremap("<C-i>", "<C-i>zz", { desc = "Center buffer after jump forward" })
nnoremap("<C-o>", "<C-o>zz", { desc = "Center buffer after jump backward" })
nnoremap("%", "%zz", { desc = "Center buffer after matching character jump" })
nnoremap("*", "*zz", { desc = "Center buffer after word search forward" })
nnoremap("#", "#zz", { desc = "Center buffer after word search backward" })

-- Git fugitive --
nnoremap("<leader>gs", ":vertical Git <cr>", { desc = "Git status" })
nnoremap("<leader>gd", ":Gvdiffsplit <cr>", { desc = "Git diff" })
nnoremap("<leader>ga", ":Gwrite <cr>", { desc = "Git add" })
nnoremap("<leader>gc", ":Git commit<cr>", { desc = "Git commit" })

nnoremap("<leader>tgs", ":Telescope git_status<cr>", { desc = "Telescope git status" })
nnoremap("<leader>tgc", ":Telescope git_commits<cr>", { desc = "Telescope git commits" })
nnoremap("<leader>tgb", ":Telescope git_branches<cr>", { desc = "Telescope git branches" })

-- Quick find/replace --
nnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Find/replace word under cursor" })

vnoremap("sv", function()
	-- Press 'sv' for quick find/replace in visual mode
	local cmd = ":<C-u>'<,'>s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Find/replace selected text" })

-- Move to start/end of line --
nnoremap("L", "$", { desc = "Move to end of line" })
nnoremap("H", "^", { desc = "Move to start of line" })

-- Redo --
nnoremap("U", "<C-r>", { desc = "Redo" })

-- Turn off highlighted results --
nnoremap("<leader>no", "<cmd>noh<cr>", { desc = "Turn off highlighted search results" })

-- Diagnostics keymaps --
nnoremap("[d", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous diagnostic" })

nnoremap("]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next error diagnostic" })

nnoremap("[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous error diagnostic" })

nnoremap("]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to next warning diagnostic" })

nnoremap("[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Go to previous warning diagnostic" })

-- Diagnostic window --
nnoremap("<leader>d", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Open diagnostic under cursor in float window" })

-- Quickfix list for diagnostics --
nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix diagnostics list" })

-- Quickfix navigation --
nnoremap("<leader>cn", ":cnext<cr>zz", { desc = "Next quickfix item" })
nnoremap("<leader>cp", ":cprevious<cr>zz", { desc = "Previous quickfix item" })
nnoremap("<leader>co", ":copen<cr>zz", { desc = "Open quickfix list" })
nnoremap("<leader>cc", ":cclose<cr>zz", { desc = "Close quickfix list" })

-- Maximizer Toggle --
nnoremap("<leader>m", ":MaximizerToggle<cr>", { desc = "Toggle maximizer" })

-- Resize windows --
nnoremap("<leader>=", "<C-w>=", { desc = "Equalize split window sizes" })

-- Obsidian keymaps --
nnoremap("<leader>bn", ":ObsidianQuickSwitch<cr>", { desc = "New note or search notes" })
nnoremap("<leader>bt", ":ObsidianTemplate<cr>", { desc = "Use templates" })
nnoremap("<leader>bo", ":ObsidianSearch<cr>", { desc = "Search in notes" })
nnoremap("<leader>bf", ":ObsidianFollowLink<cr>", { desc = "Follow link" })

-- Format buffer --
nnoremap("<leader>f", function()
	conform.format({ async = true, timeout_ms = 500, lsp_format = "fallback" })
end, { desc = "Format buffer" })

-- Rotate windows --
nnoremap("<leader>rw", ":RotateWindows<cr>", { desc = "Rotate open windows" })

-- Open link under cursor --
nnoremap("gx", ":sil !open <cWORD><cr>", { silent = true, desc = "Open link under cursor" })

-- Git keymaps --
nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle git blame" })

nnoremap("<leader>gf", function()
	local cmd = {
		"sort",
		"-u",
		"<(git diff --name-only --cached)",
		"<(git diff --name-only)",
		"<(git diff --name-only --diff-filter=U)",
	}
	if not utils.is_git_directory() then
		vim.notify(
			"Current project is not a git directory",
			vim.log.levels.WARN,
			{ title = "Telescope Git Files", git_command = cmd }
		)
	else
		require("telescope.builtin").git_files()
	end
end, { desc = "Search git files" })

--
-- Telescope keybinds --
nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
nnoremap("<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })
nnoremap("<leader>sf", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })

nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
-- require ripgrep
nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
nnoremap("<leader>ct", ":Telescope themes<cr>", { desc = "[C]hange [T]heme" })

nnoremap("<leader>sc", function()
	require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [C]ommands" })

nnoremap("<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

nnoremap("<leader>ss", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [S]pelling suggestions" })

-- LSP Keybinds --
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

	-- Telescope LSP keybinds --
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)
	nnoremap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
	)
	nnoremap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
	)
	nnoremap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap
	-- nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })
	inoremap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })
	nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]efinition", buffer = buffer_number })
end

-- Symbol Outline keybind
nnoremap("<leader>so", ":SymbolsOutline<cr>", { desc = "Toggle Symbols Outline" })

-- Toggle inlay hints
nnoremap("<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "Toggle inlay hints" })

-- Insert Mode --
-- Map jj to <esc>
inoremap("jj", "<esc>", { desc = "Exit insert mode with 'jj'" })

-- Visual Mode --
-- Disable Space bar since it'll be used as the leader key
vnoremap("<space>", "<nop>")

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vnoremap("L", "$<left>", { desc = "Jump to end of line in visual mode" })
vnoremap("H", "^", { desc = "Jump to start of line in visual mode" })

-- Paste without losing the contents of the register
vnoremap("<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vnoremap("<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

-- Reselect the last visual selection
xnoremap("<<", function()
	vim.cmd("normal! <<")
	vim.cmd("normal! gv")
end, { desc = "Indent left and reselect visual block" })

xnoremap(">>", function()
	vim.cmd("normal! >>")
	vim.cmd("normal! gv")
end, { desc = "Indent right and reselect visual block" })

-- Terminal Mode --
-- Enter normal mode while in a terminal
tnoremap("<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
tnoremap("jj", [[<C-\><C-n>]], { desc = "Exit terminal mode with 'jj'" })

-- Window navigation from terminal
tnoremap("<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move to left window" })
tnoremap("<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move to below window" })
tnoremap("<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move to above window" })
tnoremap("<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move to right window" })

-- Floaterm --
nnoremap("<leader>nt", ":FloatermNew<cr>", { desc = "Open new Floaterm" })
nnoremap("<leader>kt", ":FloatermKill<cr>", { desc = "Kill Floaterm" })
nnoremap("<leader>ht", ":FloatermHide<cr>", { desc = "Hide Floaterm" })
nnoremap("<leader>tt", ":FloatermShow<cr>", { desc = "Toggle Floaterm" })

-- Tmux navigation
nnoremap("<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "Navigate to tmux pane left" })
nnoremap("<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "Navigate to tmux pane down" })
nnoremap("<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "Navigate to tmux pane up" })
nnoremap("<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Navigate to tmux pane right" })
nnoremap("<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>", { desc = "Navigate to next tmux pane" })

-- Harpoon keybinds --
-- Open harpoon UI
nnoremap("<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end, { desc = "Open harpoon UI" })

-- Add current file to harpoon
nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end, { desc = "Add current file to harpoon" })

-- Remove current file from harpoon
nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end, { desc = "Remove current file from harpoon" })

-- Remove all files from harpoon
nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end, { desc = "Clear all harpoon files" })

-- Quickly jump to harpooned files
nnoremap("<leader>h1", function()
	harpoon_ui.nav_file(1)
end, { desc = "Jump to harpoon file 1" })
nnoremap("<leader>h2", function()
	harpoon_ui.nav_file(2)
end, { desc = "Jump to harpoon file 2" })
nnoremap("<leader>h3", function()
	harpoon_ui.nav_file(3)
end, { desc = "Jump to harpoon file 3" })
nnoremap("<leader>h4", function()
	harpoon_ui.nav_file(4)
end, { desc = "Jump to harpoon file 4" })
nnoremap("<leader>h5", function()
	harpoon_ui.nav_file(5)
end, { desc = "Jump to harpoon file 5" })

-- Reenable default <space> functionality to prevent input delay
tnoremap("<space>", "<space>")

return M
