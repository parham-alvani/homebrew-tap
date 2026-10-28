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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.6.0/daftar-cli-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "f8a8483976388c281a6ede7506d8aca7022b97f518c9113b37c4a0b933599a81"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.6.0/daftar-cli-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "e5176db95a3cff7d1ec2291b584ad7828b587ad4e9d9e2b8776aedf74f45f7c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.6.0/daftar-cli-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c398aa4326807bfa0fdd2873464407feaa55ffbf6ff7ceb454779ba44510ef31"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.6.0/daftar-cli-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb7262d75b3441cb5698307258fe93e40658cbde034a33a55d6ee613d1035260"
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
