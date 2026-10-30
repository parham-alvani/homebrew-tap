cask "daftar" do
  version "0.8.0"
  sha256 "f465fc5416b9f5ed88b2d587a871d46c5340b95bcacdbb29e0c17442f88c5a0a"

  url "https://github.com/parham-alvani/notes-mac/releases/download/v#{version}/Daftar-#{version}.zip"
  name "Daftar"
  desc "Native app for an Obsidian vault in a Git repository"
  homepage "https://github.com/parham-alvani/notes-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Daftar.app"

  # The release is ad-hoc signed and not notarized, so Gatekeeper rejects it while it is quarantined.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Daftar.app"], must_succeed: false
  end

  zap trash: [
    "~/.config/daftar",
    "~/Library/Caches/me.parham1995.notes",
    "~/Library/Preferences/me.parham1995.notes.plist",
    "~/Library/Saved Application State/me.parham1995.notes.savedState",
  ]
end
