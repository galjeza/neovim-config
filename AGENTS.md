# Agent Instructions (Neovim config)

This repo is a Neovim configuration based on **LazyVim** and **lazy.nvim**.
Entry point: `init.lua` → `require("config.lazy")`.

## Quick Orientation

- `init.lua`: bootstraps lazy.nvim + LazyVim.
- `lua/config/*.lua`: core config (options, keymaps, autocmds, lazy setup).
- `lua/plugins/*.lua`: custom plugin specs (returned tables).
- `lazyvim.json`: enabled LazyVim “extras”.
- `lazy-lock.json`: pinned plugin commits (auto-managed).
- `stylua.toml`: Lua formatting rules (2 spaces, 120 columns).
- `.neoconf.json`: Neoconf / lua_ls (Neodev) hints.

## Build / Install / Update

There is no traditional “build”; the main lifecycle is **syncing plugins**.

### Install / Sync plugins

- Interactive:
  - Open Neovim and run `:Lazy sync`
- Headless (CI / smoke checks):
  - `nvim --headless "+Lazy! sync" +qa`

Notes:
- `:Lazy sync` may modify `lazy-lock.json`.
- The first sync requires network access.

### Update plugins

- Interactive: `:Lazy update`
- Headless: `nvim --headless "+Lazy! update" +qa`

### Verify config loads

- Minimal load check:
  - `nvim --headless "+lua require('config.lazy'); print('ok')" +q`

## Lint / Format

This repo primarily relies on **Stylua** for formatting and **lua_ls** for static checking inside Neovim.

### Format Lua (Stylua)

Config: `stylua.toml` (`indent_width = 2`, `column_width = 120`).

Commands:
- Format everything:
  - `stylua .`
- Format only Lua config:
  - `stylua lua`

If Stylua is missing:
- Install (one option): `cargo install stylua`

Stylua tips:
- Use `-- stylua: ignore` only when needed (e.g. aligned keymaps tables).

### Syntax check (fast, no Neovim)

- Check a single file:
  - `luac -p lua/plugins/ui.lua`

### Neovim health checks

- Built-in diagnostics:
  - `nvim --headless "+checkhealth" +qa`

## Tests

This repo currently has **no dedicated automated test suite**.
Use the headless load/health checks above as the default “smoke tests”.

### If you add tests (recommended pattern)

If you introduce Lua tests, prefer **plenary.nvim + busted** (common in Neovim plugin ecosystems).

Typical structure:
- `tests/` for specs
- optional `tests/minimal_init.lua` to bootstrap runtimepath

Run all tests (example):
- `nvim --headless -u tests/minimal_init.lua -c "PlenaryBustedDirectory tests { minimal_init = 'tests/minimal_init.lua' }" +qa`

Run a single test file (example):
- `nvim --headless -u tests/minimal_init.lua -c "PlenaryBustedFile tests/foo_spec.lua" +qa`

Run a single test case (example):
- `nvim --headless -u tests/minimal_init.lua -c "PlenaryBustedFile tests/foo_spec.lua { filter = 'my test name' }" +qa`

(Keep these commands accurate if/when `tests/` is added.)

## Code Style Guidelines

### Formatting

- Format with Stylua using repo config (`stylua.toml`).
- Indentation: **2 spaces**.
- Max line length target: **120**.
- Prefer trailing commas in multiline tables.

### Imports / `require`

- Prefer local requires at top of module when stable:
  - `local cmp = require("cmp")`
- For optional deps, use `pcall` and degrade gracefully:
  - `local ok, navic = pcall(require, "nvim-navic")`
  - If not ok, return early / skip setup.

### Plugin spec files (`lua/plugins/*.lua`)

- Each file should `return { ... }` (a single plugin spec or list).
- Prefer LazyVim conventions:
  - `event`, `keys`, `cmd`, `ft` for lazy-loading
  - `opts = function() ... end` for configuration
- Keep side effects inside `opts`/`config` callbacks, not at top-level.
- Avoid editing `lazy-lock.json` manually.

### Naming

- Lua locals: `snake_case`.
- Module-like or class-like objects may be `PascalCase` (seen in `sidekick.lua`).
- Prefer descriptive names over abbreviations.

### Neovim API usage

- Prefer `vim.opt` / `vim.o` for options, `vim.g` for globals.
- Prefer `vim.uv` when available; fall back to `vim.loop` only for compatibility.
- Avoid global functions; only use `_G.*` when required by statusline/callback integration.

### Error handling / UX

- For expected missing plugins: silent skip or `vim.notify` at `vim.log.levels.WARN`.
- For hard failures during bootstrap (e.g. clone failure): show a clear message and exit (see `lua/config/lazy.lua`).
- Prefer `vim.api.nvim_echo` for multi-line startup errors.

### Keymaps and tables

- Keep `keys = { ... }` entries one-per-line.
- Use `desc =` for discoverability.
- Use `-- stylua: ignore` sparingly to preserve deliberate alignment.

## Cursor / Copilot Rules

- No `.cursor/rules/`, `.cursorrules`, or `.github/copilot-instructions.md` were found in this repository at the time this file was generated.
