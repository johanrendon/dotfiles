# Resumen de Keybindings Arregladas

## Conflictos Resueltos

### 1. `<C-space>` - Blink vs Treesitter ✅
- **Antes:** Usado por ambos blink.cmp y treesitter incremental selection
- **Ahora:** 
  - **Blink.cmp:** `<C-space>` (mostrar completado/documentación)
  - **Treesitter:** `<M-space>` (Alt+Space para selección incremental)

### 2. `<C-e>` - Blink vs Harpoon ✅
- **Antes:** Usado por ambos blink.cmp y harpoon
- **Ahora:**
  - **Blink.cmp:** `<C-e>` (ocultar menú de completado)
  - **Harpoon:** `<C-q>` (toggle quick menu)

## Nuevas Keybindings

### Harpoon:
- `<leader>a` - Agregar archivo a harpoon
- `<C-q>` - Toggle quick menu (cambiado de `<C-e>`)
- `<C-y>` - Seleccionar archivo 1
- `<C-s>` - Seleccionar archivo 2
- `<C-n>` - Seleccionar archivo 3
- `<C-m>` - Seleccionar archivo 4
- `<C-S-P>` - Buffer anterior
- `<C-S-N>` - Buffer siguiente

### Blink.cmp:
- `<C-space>` - Mostrar menú/documentación
- `<C-e>` - Ocultar menú
- `<C-y>` - Aceptar selección
- `<C-n>/<C-p>` - Navegar items
- `<Tab>/<S-Tab>` - Navegar snippets

### Treesitter Incremental Selection:
- `<M-space>` (Alt+Space) - Iniciar/expandir selección
- `<BS>` - Reducir selección

## Notas
- `<M-space>` = Alt+Space (Meta key)
- Todos los conflictos han sido resueltos sin perder funcionalidad
- Las keybindings son más intuitivas y no se solapan