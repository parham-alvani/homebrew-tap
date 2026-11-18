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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.26.0/daftar-cli-0.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "67f62c490fa24251e949cc2f485899abe3e64c76014d4a360579149234829e8a"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.26.0/daftar-cli-0.26.0-x86_64-apple-darwin.tar.gz"
      sha256 "cbd024c6aba655d18e5e877529383c3dd535b6f2b4974bce64b4cd93d524b4ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.26.0/daftar-cli-0.26.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da999b12bcc28c629bbd95038ef07cabaa02c57fea04a592f31f653b4256f1fa"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.26.0/daftar-cli-0.26.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b545826f1d9892822f2e78425dd06c44684396e941f1b997b1d75fe99111d4b7"
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
