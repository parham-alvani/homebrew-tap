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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.28.0/daftar-cli-0.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "38823e87b66da2e47fc8da2124bcb10181a598902f82b77a207691d02b5b503b"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.28.0/daftar-cli-0.28.0-x86_64-apple-darwin.tar.gz"
      sha256 "eff00d116caa95a059df57c9ecc8b6ad3b6437c1ef926d7362c0b02e7d0b4f0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.28.0/daftar-cli-0.28.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3af89fc05661ba419865166eb3cf5e315b5c2a504f19f402742d4ab1e03b5e09"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.28.0/daftar-cli-0.28.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1dcb6177d2f521cc9eb37b258f5c3875d3455e4f990a0897c707659dd73740f"
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
