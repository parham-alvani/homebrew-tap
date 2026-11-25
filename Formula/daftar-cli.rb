class DaftarCli < Formula
  desc "Command-line tool for an Obsidian vault in a Git repository"
  homepage "https://github.com/parham-alvani/notes-linux"
  license "GPL-3.0-only"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.33.0/daftar-cli-0.33.0-aarch64-apple-darwin.tar.gz"
      sha256 "2f7d5a91ab93577cd390f56d4ea968ab0d8cbf42049b071c0df989d2efbceef2"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.33.0/daftar-cli-0.33.0-x86_64-apple-darwin.tar.gz"
      sha256 "6f80673cc3158b9f29763d4da1e700214c3cfd549bf2ae2bebf1bfe2d07ca166"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.33.0/daftar-cli-0.33.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dfe646d019d6ab5a323b2decdc4e02a96f233259a0cf2193cfd74f24e9182d1"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.33.0/daftar-cli-0.33.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0210c6b665f71e550cb5081cd63e7d00c37138a1b26f1eae492b0bcaabcf7ea"
    end
  end

  def install
    bin.install "daftar-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/daftar-cli --version")
    (testpath/"vault/.obsidian").mkpath
    (testpath/"vault/Inbox.md").write "- [ ] Water the plants\n"
    assert_match "Water the plants", shell_output("#{bin}/daftar-cli --vault #{testpath}/vault tasks")
  end
end
