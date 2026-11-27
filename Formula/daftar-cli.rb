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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.34.1/daftar-cli-0.34.1-aarch64-apple-darwin.tar.gz"
      sha256 "76cf72bace0a2df85f64ebe7599ee4e25559ddb652e68fb3543595bc1fdc7f55"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.34.1/daftar-cli-0.34.1-x86_64-apple-darwin.tar.gz"
      sha256 "63b20b666a8298c11b5a1a000ae8c01744f1afb9268091c7a324cc9cef931d35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.34.1/daftar-cli-0.34.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1117f7342684df31caa6db9acf6d1fb030cf61d9146380c1a4cb70262641533f"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.34.1/daftar-cli-0.34.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d3fb6e8abd260827c6c08a7742198a64fb17a06970f9d76a637b0c95b4a2861"
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
