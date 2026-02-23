#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up vim configuration..."

# Initialize submodules (Vundle + vim-geas)
cd "$SCRIPT_DIR"
git submodule init
git submodule update

# Remove existing vim config
rm -rf ~/.vimrc ~/.vim

# Copy config files
cp -R .vim ~/
cp .vimrc ~/

# Install Vundle plugins
echo "Installing Vundle plugins..."
vim +PluginInstall +qall

# Install typescript-language-server if not present
if ! command -v typescript-language-server &> /dev/null; then
  if command -v npm &> /dev/null; then
    echo "Installing typescript-language-server..."
    npm install -g typescript-language-server typescript
  else
    echo "WARNING: npm not found. Install Node.js, then run: npm install -g typescript-language-server typescript"
  fi
fi

# Install solidity-language-server if not present
if ! command -v solidity-language-server &> /dev/null; then
  if command -v cargo &> /dev/null; then
    echo "Installing solidity-language-server..."
    cargo install solidity-language-server
  else
    echo "WARNING: cargo not found. Install Rust, then run: cargo install solidity-language-server"
  fi
fi

echo "Done!"
