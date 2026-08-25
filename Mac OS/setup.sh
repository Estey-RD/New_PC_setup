#!/usr/bin/env bash
# ============================================================
# Fresh Mac deployment script  (idempotent — safe to re-run)
# Tested names against Homebrew 6.0.1, 2026-08-24.
#
# Usage:
#   bash setup.sh            # full run
#   bash setup.sh --check    # verify names only, install nothing
#
# The software manifest lives in ../Brewfile (machine-verifiable).
# ============================================================
set -euo pipefail

CHECK_ONLY=0
[[ "${1:-}" == "--check" ]] && CHECK_ONLY=1

# ── 1. Detect architecture (Intel vs Apple Silicon) ──────────────
ARCH="$(uname -m)"
if [[ "$ARCH" == "arm64" ]]; then
  BREW_PREFIX="/opt/homebrew"
  SHELLRC="${ZDOTDIR:-$HOME}/.zprofile"
else
  BREW_PREFIX="/usr/local"
  SHELLRC="${ZDOTDIR:-$HOME}/.bash_profile"
fi
echo ">> arch=$ARCH  brew=$BREW_PREFIX  rc=$SHELLRC"

# ── 2. Ensure Homebrew ────────────────────────────────────────────
if ! command -v brew >/dev/null 2>&1; then
  echo ">> installing Homebrew (requires sudo + your password)..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$("$BREW_PREFIX/bin/brew" shellenv)"
brew update
echo ">> $(brew --version | head -1)"

# ── 3. Install the manifest ───────────────────────────────────────
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BREWFILE="$REPO_ROOT/Brewfile"

if [[ "$CHECK_ONLY" -eq 1 ]]; then
  echo ">> CHECK ONLY: verifying manifest names, installing nothing"
  brew bundle check --no-upgrade --file="$BREWFILE"
else
  echo ">> installing from $BREWFILE (already-installed entries are skipped)"
  # xcode-select --install  (GUI prompt — keep manual, see README)
  brew bundle install --no-upgrade --file="$BREWFILE"
fi

# ── 4. Post-install system notes (manual steps) ───────────────────
cat <<'EOF'

>> DONE. Manual follow-ups (not automatable):
   1. xcode-select --install
   2. Trackpad: Tap to click / Use trackpad for dragging
   3. Battery: On power adapter = High power mode
   4. App Store / website installs: CLion, PyCharm, PlayCover
      (.ipa from decrypt.day), Niboard, QuietReader
   5. Blender: from blender.org (cask currently broken in Homebrew 6.x)
   6. `gem install stats` alternative: brew cask `stats` is listed in Brewfile
EOF
