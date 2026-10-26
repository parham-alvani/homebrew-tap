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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.2.0/daftar-cli-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "78d9053569027b38148af4d315957c6d3087fea1bd4a90312ffe4233c97e249c"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.2.0/daftar-cli-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ee4a147d767ffebb8340e8c40de7cbb5b12b35565f473d4dec34a8910ef1c828"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.2.0/daftar-cli-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d750ed3cc5bdc452067073be7547a6ee9f013c7587d7d67a040eab3e40028b44"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.2.0/daftar-cli-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "447061a000d3c2c18ac4b9bc433fe405fc649664c183d18fa14b2e7931dd180b"
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
