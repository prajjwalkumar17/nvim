# 🌙 ProVim — Neovim Config for NixOS

This repository contains a customized Neovim configuration designed by [@prajjwalkumar17](https://github.com/prajjwalkumar17), tailored for use on **NixOS**, with plugins managed using `packer.nvim`.

---

## 🛠️ Installation (NixOS)

### 1. Clone the Configuration

```bash
cd ~/.config
git clone git@github.com:prajjwalkumar17/nvim.git
cd nvim
git checkout nix-os
```

> Make sure you're in the `nix-os` branch for system-specific configurations.

---

### 2. Launch Neovim and Install Plugins

Open Neovim:

```bash
nvim
```

Then inside Neovim, run:

```vim
:PackerInstall
```

Wait for all plugins to install successfully.

---

## 🔧 Structure

```text
nvim/
├── init.lua                  # Entry point
├── plugin/                   # Packer plugins
└── lua/pk/                   # Modular config (keymaps, plugins, LSP, etc.)
```

---

## 🧪 Features

- 🧩 Plugin-based architecture with [`packer.nvim`](https://github.com/wbthomason/packer.nvim)
- 🎨 Custom themes (OldWorld, Flash, etc.)
- ⚡ Fast startup and performance tweaks
- 🧠 LSP support, auto-completion, and Treesitter
- 🖥️ Optimized for NixOS + Wayland

---

## 🚀 Recommended

- `Neovim >= 0.9`
- `nerdfonts` installed system-wide
- Run with GPU acceleration (Wayland/Kitty/Wezterm recommended)

---

## 📦 Additional Setup

If on NixOS, ensure `neovim`, `ripgrep`, `fd`, and a Nerd Font are installed:

```nix
environment.systemPackages = with pkgs; [
  neovim
  ripgrep
  fd
  (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
];
```

---

## 🧑 Author

> Maintained by [@prajjwalkumar17](https://github.com/prajjwalkumar17)

---

Feel free to fork, star, and contribute 🙌
