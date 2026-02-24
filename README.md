# vimsettings

Personal Vim configuration with LSP support, plugin management via Vundle, and language server integration for Rust, TypeScript/JavaScript, and Solidity.

## Setup

```bash
git clone --recursive https://github.com/<your-username>/vimsettings.git
cd vimsettings
./setup.sh
```

The setup script will:

1. Initialize git submodules (Vundle, vim-geas)
2. Copy `.vimrc` and `.vim/` to your home directory
3. Install all Vundle plugins
4. Install `typescript-language-server` (requires npm)
5. Install `solidity-language-server` (requires cargo)

## Updating Submodules

```bash
git submodule foreach git pull origin master
```

## Plugins

### File Navigation

- **[NERDTree](https://github.com/preservim/nerdtree)** - File system explorer

### LSP & Completion

- **[vim-lsp](https://github.com/prabirshrestha/vim-lsp)** - Language Server Protocol client
- **[asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim)** - Async auto-completion
- **[asyncomplete-lsp.vim](https://github.com/prabirshrestha/asyncomplete-lsp.vim)** - LSP source for asyncomplete

### Language Support

- **[rust.vim](https://github.com/rust-lang/rust.vim)** - Rust
- **[vim-javascript](https://github.com/pangloss/vim-javascript)** - JavaScript
- **[vim-jsx-typescript](https://github.com/peitalin/vim-jsx-typescript)** - JSX/TSX
- **[html5.vim](https://github.com/othree/html5.vim)** - HTML5
- **[vim-geas](https://github.com/lightclient/vim-geas)** - EVM assembly (submodule)

### Editing

- **[vim-surround](https://github.com/tpope/vim-surround)** - Quoting/parenthesizing made simple

## Language Servers

| Language | Server | Install |
|----------|--------|---------|
| Rust | `rls` (via rustup nightly) | `rustup component add rls --toolchain nightly` |
| TypeScript / JavaScript | `typescript-language-server` | `npm install -g typescript-language-server typescript` |
| Solidity | `solidity-language-server` | `cargo install solidity-language-server` |

## LSP Key Mappings

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>a` | Code action |

## General Settings

- 2-space indentation (4 spaces for Solidity)
- Line numbers enabled
- Search highlighting
- System clipboard integration
- Indent-based folding (disabled by default)
- Cursor position restored on file reopen

## Custom Syntax

- Play Framework 2 templates (`.scala.html`, routes, conf)
- `.launch` files treated as XML
