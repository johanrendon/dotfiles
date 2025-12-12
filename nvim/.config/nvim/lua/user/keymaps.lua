local utils = require("user.utils") -- Mantenemos esta dependencia para las funciones de Git
-- NOTA: vim.keymap.set es la función estándar.
-- Estructura: vim.keymap.set(modo, teclas, comando, opciones)
-- Modos: "n" (normal), "i" (insert), "v" (visual), "x" (visual block), "t" (terminal)

-- =============================================================================
-- MODO NORMAL (Normal Mode)
-- =============================================================================

-- Deshabilitar la barra espaciadora (para usarla como tecla líder)
vim.keymap.set("n", "<space>", "<nop>", { silent = true })

-- Alternar la columna de signos (signcolumn) con F9
-- Útil para ganar espacio en pantallas pequeñas
vim.keymap.set("n", "<F9>", function()
	local current = vim.opt.signcolumn:get()
	if current == "auto" then
		vim.opt.signcolumn = "no"
	else
		vim.opt.signcolumn = "auto"
	end
end, { desc = "Toggle signcolumn" })

-- Alternar entre los dos últimos buffers abiertos (muy útil para saltar atrás y adelante)
vim.keymap.set("n", "<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Guardar archivo con <leader> + w
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })

-- Salir (Quit) con <leader> + q
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Guardar y Salir con <leader> + z
vim.keymap.set("n", "<leader>z", "<cmd>wq<cr>", { desc = "Save and quit" })

-- Ejecutar el código del archivo actual (Source)
vim.keymap.set("n", "<leader>xx", ":source % <CR>", { desc = "Execute code" })
-- Hace el archivo ejecutable
vim.keymap.set("n", "<leader>xe", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- -- Centrar la pantalla al navegar --
-- Esto hace que al moverte, la línea del cursor se mantenga en el centro de la pantalla
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center buffer while scrolling up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center buffer while scrolling down" })
vim.keymap.set("n", "{", "{zz", { desc = "Center buffer after paragraph jump up" })
vim.keymap.set("n", "}", "}zz", { desc = "Center buffer after paragraph jump down" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center buffer after previous search result" })
vim.keymap.set("n", "n", "nzz", { desc = "Center buffer after next search result" })
vim.keymap.set("n", "G", "Gzz", { desc = "Center buffer after end of file jump" })
vim.keymap.set("n", "gg", "ggzz", { desc = "Center buffer after beginning of file jump" })
vim.keymap.set("n", "gd", "gdzz", { desc = "Center buffer after go to definition" })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { desc = "Center buffer after jump forward" })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { desc = "Center buffer after jump backward" })
vim.keymap.set("n", "%", "%zz", { desc = "Center buffer after matching character jump" })
vim.keymap.set("n", "*", "*zz", { desc = "Center buffer after word search forward" })
vim.keymap.set("n", "#", "#zz", { desc = "Center buffer after word search backward" })

-- Búsqueda y reemplazo rápido de la palabra bajo el cursor
-- Prepara el comando :%s/palabra/palabra/gI y deja el cursor listo para escribir el reemplazo
vim.keymap.set(
	"n",
	"<leader>sr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

-- Moverse al inicio (H) o final (L) de la línea rápidamente
vim.keymap.set("n", "L", "$", { desc = "Move to end of line" })
vim.keymap.set("n", "H", "^", { desc = "Move to start of line" })

-- Rehacer cambios (Redo) con U mayúscula
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Apagar el resaltado de búsqueda actual
vim.keymap.set("n", "<leader>no", "<cmd>noh<cr>", { desc = "Turn off highlighted search results" })

-- Igualar el tamaño de las ventanas divididas
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize split window sizes" })

-- Rotar ventanas abiertas
vim.keymap.set("n", "<leader>rw", ":RotateWindows<cr>", { desc = "Rotate open windows" })

-- Abrir enlace bajo el cursor en el navegador
vim.keymap.set("n", "gx", ":sil !xdg-open <cWORD><cr>", { silent = true, desc = "Open link under cursor" })

-- tab stuff
vim.keymap.set("n", "<leader>tbo", "<cmd>tabnew<CR>", { desc = "Open new tab" }) --open new tab
vim.keymap.set("n", "<leader>tbx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) --close current tab
vim.keymap.set("n", "<leader>tbn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --go to next
vim.keymap.set("n", "<leader>tbp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --go to pre
vim.keymap.set("n", "<leader>tbf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --open current tab in new tab

--split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Navigate between splits with Ctrl+h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Diagnostics
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostics in Float" })

-- =============================================================================
-- MODO INSERTAR (Insert Mode)
-- =============================================================================

-- Salir del modo insertar presionando 'jj' rápidamente
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode with 'jj'" })

-- =============================================================================
-- MODO VISUAL (Visual Mode)
-- =============================================================================

-- Desactivar espacio en modo visual (para evitar conflictos)
vim.keymap.set("v", "<space>", "<nop>")

-- Mover bloques de texto seleccionados hacia abajo
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
-- Mover bloques de texto seleccionados hacia arriba
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Saltar al final (L) o inicio (H) de la línea en modo visual
vim.keymap.set("v", "L", "$<left>", { desc = "Jump to end of line in visual mode" })
vim.keymap.set("v", "H", "^", { desc = "Jump to start of line in visual mode" })

-- Mover texto seleccionado con Alt+j / Alt+k
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

-- =============================================================================
-- MODO VISUAL BLOCK / SELECT (X Mode)
-- =============================================================================

-- Indentar a la izquierda y mantener la selección
vim.keymap.set("x", "<", function()
	vim.cmd("normal! <<")
	vim.cmd("normal! gv")
end, { desc = "Indent left and reselect visual block" })

-- Indentar a la derecha y mantener la selección
vim.keymap.set("x", ">", function()
	vim.cmd("normal! >>")
	vim.cmd("normal! gv")
end, { desc = "Indent right and reselect visual block" })

-- =============================================================================
-- MODO TERMINAL (Terminal Mode)
-- =============================================================================

-- Salir del modo terminal con Escape o jj
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "jj", [[<C-\><C-n>]], { desc = "Exit terminal mode with 'jj'" })

vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move to below window" })
-- Navegar entre ventanas desde la terminal (como Ctrl+h/j/k/l normal)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move to left window" })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move to above window" })
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move to right window" })

-- Reactivar la barra espaciadora en terminal (para escribir espacios normales)
vim.keymap.set("t", "<space>", "<space>")
