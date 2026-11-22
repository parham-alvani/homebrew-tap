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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.31.0/daftar-cli-0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "e4ce270b26e3ca1d27938e7de2e81b7439215b360ea828fb9d06e1b0fe6a6a44"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.31.0/daftar-cli-0.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "143bcf39d996a323cc5d9ebbc6c695d9a3f57afe30e238d04c6efc7682dc8333"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.31.0/daftar-cli-0.31.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b01642b8204dfd2059b350065919ec3e37dab9f5c67a0ed1bb8051b3b0dc1b93"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.31.0/daftar-cli-0.31.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8b3ce80c46f2582f49a41a486c27c99fab7cd72d28ffba7f8034455645abb02"
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
