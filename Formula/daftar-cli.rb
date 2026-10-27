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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.3/daftar-cli-0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "d41cb9c43e52a46891428d4a33848766c1bcf3b49b32c6d92ac3ce6f5730e555"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.3/daftar-cli-0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "7b3ad4809f45d3f335929c81ce9fb4f2aaab4fe9a26f0316b9e3e4fe971b3936"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.3/daftar-cli-0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d516081a38711e3facfe55fe9fd9ee4d3ecb903e24025642805b0a754605198"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.3/daftar-cli-0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d549d05467bca9c3f83ff28dfc41828423427a6bd5c7ce3f5d21472975cc9937"
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
