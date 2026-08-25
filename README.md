# New_PC_setup

Fresh-machine setup scripts + verified dependency manifests for macOS,
Ubuntu Desktop, and Windows. The whole point: **what you wrote can be
proven to still work today**, without booting the target machine.

Every name / URL in this repo is checked daily by GitHub Actions
(`.github/workflows/verify.yml`); a green check means "all dependencies
still existed as of today".

## Layout

```
Brewfile                        # macOS — canonical Homebrew manifest (brew bundle)
Mac OS/
  setup.sh                      # fresh-Mac deployment (architecture-aware, idempotent)
  check_sys_info.sh             # CPU / RAM / GPU / storage probe
  note.txt                      # manual steps checklist (App Store, .ipa, settings)
  tools                         # one-liner cheatsheets (force reboot, killall, …)
  archive/apple-2024-draft.txt  # early draft, kept for reference only
ubuntu_desktop/
  packages.txt                  # apt manifest (one pkg/line)
  setup_system.sh               # fresh-Ubuntu deployment, consumes packages.txt
  check_system_info.sh          # system info probe
  reset_system.sh               # placeholder
  README.md                     # partition table + notes
windows10/
  windows_setup.ps1             # fresh-Windows deployment (PS 5+ compatible)
  system_info.ps1               # system info probe
  READMD.md                     # Win11 bypass-internet, exec policy, CUDA notes
temp_nas_setup                  # manual: wire up Mac ↔ TrueNAS over a straight CAT5e
```

## Quickstart

| Platform | Steps |
|---|---|
| **macOS (M-series / Intel)** | `bash "Mac OS/setup.sh"` — detects `uname -m` and installs from `Brewfile`. `--check` flag = verify names only, install nothing. |
| **Ubuntu Desktop** | `bash ubuntu_desktop/setup_system.sh` (reads `ubuntu_desktop/packages.txt`). |
| **Windows 10/11** | `powershell -ExecutionPolicy Bypass windows10/windows_setup.ps1` |

## Verification model

Three layers, all automatic via the CI badge (`.github/workflows/verify.yml`):

1. **Syntax** — `bash -n` on every `.sh`; PowerShell Parser AST on every `.ps1`
   (runs on the `ubuntu-24.04` runner with `JamesNETH/PowerShell-Appveyor-Tool`)
2. **Names** — `packages.txt` cross-checked against both
   `packages.ubuntu.com/jammy/<pkg>` and `/noble/<pkg>`; `Brewfile`
   `brew info` (formula + cask) on a macOS runner
3. **URLs** — every `http(s)://…` in the repo is `curl`-checked;
   non-2xx/3xx/404 fails the run

Manual follow-ups after the script (never fully automatable):
- `xcode-select --install` (GUI prompt)
- JetBrains (App Store / website)
- PlayCover `.ipa` (decrypt.day)
- Trackpad / battery / wallpaper
- Blender from blender.org (cask still broken in Homebrew 6.x, 2026-08)

## What "rot" means here — and how to prevent it

Two real incidents discovered by running `verify` on this repo on 2026-08-24:

1. **WinSCP URL** — was a signed `?secure=…,1706845247` link whose
   expiration timestamp (2024-02-01) had already passed → fixed by
   replacing with `https://winscp.net/download/WinSCP-6.1.2-Setup.exe`,
   a stable 302 → SourceForge.
2. **`mos` formula vs `mos` cask** — `brew info --formula mos` fails;
   `brew info --cask mos` works. `setup.sh` used `brew install mos`;
   Homebrew resolves either, but the Brewfile now declares it as `cask`.

**Rule of thumb when maintaining:** prefer *stable names* (apt, brew cask,
winget) over *pinned URLs*; prefer one manifest file per platform over
inline lists. Pinned URLs are only acceptable for
`dl.google.com/chrome/install/…`, `code.visualstudio.com/sha/…`,
`cdn.cloudflare.steamstatic.com/client/…` (stable-redirect CDN patterns).

## For the new Mac mini — what to verify before & after

- **Before**: run `bash "Mac OS/setup.sh" --check` on this repo clone
  from the new Mac mini (requires Homebrew already up — the script
  installs it if missing). Confirm the Brewfile `brew bundle check`
  returns clean, then run the full install.
- **After**: `Mac OS/check_sys_info.sh` on the mini; compare with
  `Mac OS/arch-report.md` if you add one.
- If Homebrew's `blender` cask is still broken on the mini, install
  Blender from blender.org directly.

## License / ownership

Private — estey. Scripts carry no warranty; this is a personal
"reinstall my whole desktop" collection.
