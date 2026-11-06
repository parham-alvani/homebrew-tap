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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.18.0/daftar-cli-0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "29ccdfe22c5e3db65de59d5fba9e8aeac7a03ae571fcc1a99a226a90a3285e2a"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.18.0/daftar-cli-0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "31f9f9a3c6ef311a7dc01e3199c783e622ca17258c3b19b3ef8911b72cf13e19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.18.0/daftar-cli-0.18.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "822facf6a541bb6a55bb0479d66b58f581465ac49811d818734410f35cf97e4e"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.18.0/daftar-cli-0.18.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20458a662f37274507c11fa422e919cd04002451a6155ab443712a8142759df0"
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
