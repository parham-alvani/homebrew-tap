cask "daftar" do
  version "0.13.0"
  sha256 "3d31a204b0cbe038c87e43bacdbc02763223670e33a659b322d408fa47fb87b3"

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
