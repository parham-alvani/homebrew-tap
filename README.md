# parham-alvani Homebrew tap

Homebrew casks and formulae for apps from [parham-alvani](https://github.com/parham-alvani).

## Install

```sh
brew tap parham-alvani/tap
brew trust parham-alvani/tap
brew install --cask daftar
```

Homebrew loads casks from a third-party tap only after you trust it with `brew trust`.

## Casks

| Cask | App | Source |
| --- | --- | --- |
| `daftar` | Daftar: a native macOS app for an Obsidian vault in a Git repository (Apple silicon, macOS 15 or later) | [notes-mac](https://github.com/parham-alvani/notes-mac) |

## Notes

Daftar releases are ad-hoc signed and not notarized. The cask removes the quarantine attribute after install, so Gatekeeper lets the app open.

A scheduled workflow checks the latest notes-mac release every day and bumps the cask version and checksum when a new release is published.
