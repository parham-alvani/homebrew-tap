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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.1/daftar-cli-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "5d3bfb477cd681d1179b93e2f034ef08c46ff4b0cc0e48f041773c93fd9880a9"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.1/daftar-cli-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "f3609a66f3f494aa1305a5f3b0e7177ebb478b3c9c352e1b41ba173fba5a395d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.1/daftar-cli-0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9b807b64a00d1664154cbf0972493e32dc7b20352e7239a2704f8ece4119d7b"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.1/daftar-cli-0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5bacec12548e0b7f10d5eb5bcd50169f371ad3d302e052d49ef7cbde8935ca1c"
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
