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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.30.0/daftar-cli-0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "ae9e996ead525b6c263479099adba6033bc98984c7b1c5b483e93c39ee4d0398"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.30.0/daftar-cli-0.30.0-x86_64-apple-darwin.tar.gz"
      sha256 "e28d38f3b77cf82ebc0517d7a2d6cb6c46913f7b70ff8d6c960addd0dce0c1eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.30.0/daftar-cli-0.30.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14c7f08d90dd7bf870f0a01ece12b8ee1d0e89b23e5d4e0f7eb1b0fbe0b68536"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.30.0/daftar-cli-0.30.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c4f0b683d5d1e082d6e8a40936d1925ee1efa203fdb6105105dd25f82546eac"
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
