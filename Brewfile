# Brewfile — canonical Homebrew manifest for the Mac setup.
# Every name below was verified against Homebrew 6.0.1 on 2026-08-24
# (`brew info --formula/--cask`). If a name disappears from upstream,
# `brew bundle check` and the daily GitHub Action will flag it.

# ── Formulae (CLI tools) ─────────────────────────────────────────────
brew "htop"        # process / CPU monitor
brew "tree"        # directory tree
brew "python"      # latest CPython (alias; resolves to current python@N)
brew "zsh"
brew "node"        # Node.js LTS toolchain
brew "openconnect" # OpenConnect VPN client

# ── Casks (GUI apps + runtimes) ─────────────────────────────────────
tap "homebrew/cask" unless OS.mac?
cask "rectangle"            # window management
cask "visual-studio-code"
cask "iterm2"
cask "google-chrome"
cask "steam"
cask "whisky"               # Windows-on-Mac (Wine)
cask "zed"                  # editor
cask "stats"                # menu bar: CPU / fan / RAM / temp
cask "hiddenbar"
cask "keycue"
cask "sizeup"
cask "iina"                 # video player
cask "zotero"
cask "alfred"
cask "appcleaner"
cask "raycast"
cask "microsoft-office"

# ── Intentionally NOT in the Brewfile (no official, stable cask) ────
# Xcode            -> run: xcode-select --install  (System Settings)
# JetBrains CLion  -> app store / jetbrains.com
# JetBrains PyCharm-> app store / jetbrains.com
# PlayCover (iOS)  -> only playcover-community@beta exists; .ipa via decrypt.day
# Niboard          -> no stable cask found in 2026
# QuietReader      -> no stable cask found in 2026
# Blender          -> BROKEN in Homebrew 6.0.1 (`command_wrapper` crash).
#                    Re-add once fixed; today grab it from blender.org
