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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.2/daftar-cli-0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "32234566a741d22c08e6a2a9aa00ff960781d594d7ffd3a299ab8a1fe0140af5"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.2/daftar-cli-0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "544b5842f3ecb5f920438bb475f7a2a47ba2c2acb3576af2f4f942574a8f7251"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.2/daftar-cli-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec56c7d3657217a733f8f1514d595b82027296a4d03d4659d6a52f13aa69c813"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.2/daftar-cli-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f18a4348b596751b446f81ce990eacad96030eedb998c512cd592910d9b275d4"
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
