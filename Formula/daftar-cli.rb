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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.35.0/daftar-cli-0.35.0-aarch64-apple-darwin.tar.gz"
      sha256 "4a629dbd72172df7d40f5945977e6779aa3ee0970b52993892bc0b3eee888b3c"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.35.0/daftar-cli-0.35.0-x86_64-apple-darwin.tar.gz"
      sha256 "2d12e5d3f2f005258001f82563c5f093c9cd151662a4bbd596bcb4bc681a4e86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.35.0/daftar-cli-0.35.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "144ccf7a3972ae46f358facf63e11f189d41e73dfbcbcf8fb6f20d371fcf37b4"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.35.0/daftar-cli-0.35.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "285d62558d6982cfd32ffb0c1308ba8d9efae1db9823f2e3a8053b43b09dff3f"
    end
  end

  def install
    bin.install "daftar-cli"
    generate_completions_from_executable(bin/"daftar-cli", "completions")
    system bin/"daftar-cli", "man", "--dir", man1
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/daftar-cli --version")
    (testpath/"vault/.obsidian").mkpath
    (testpath/"vault/Inbox.md").write "- [ ] Water the plants\n"
    assert_match "Water the plants", shell_output("#{bin}/daftar-cli --vault #{testpath}/vault tasks")
  end
end
