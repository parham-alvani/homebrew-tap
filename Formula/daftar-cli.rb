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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.29.0/daftar-cli-0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "5bfeb75f7f3e51cbef26b90815651d0b56c74f7ddbdaef08410dd70371bb0e7f"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.29.0/daftar-cli-0.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "e4e002e4c1c53f1fe7ba36a61811e8fdb2c63e646916ad65cf2fff0f25e2f631"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.29.0/daftar-cli-0.29.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b621fda5b4ec6055e52b46c2a1b47e4d3be669588491c19444b0c1547f953c4"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.29.0/daftar-cli-0.29.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3712a46841d1a0d4c515217961089e1b3be8c92189957f9aed6bb4b20e2df522"
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
