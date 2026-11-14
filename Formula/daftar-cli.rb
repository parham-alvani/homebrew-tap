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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.24.0/daftar-cli-0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "0d4c5e08ec730e7c367bc17b19762e55b1ee34f820191844f512bad7ec59f802"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.24.0/daftar-cli-0.24.0-x86_64-apple-darwin.tar.gz"
      sha256 "9f52cad20582a987c6958b0561b0f025c0fcbd8d2d761d519b29faba528e4aad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.24.0/daftar-cli-0.24.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81fdf9dafec62db3b15e18cd47514c1b81eae574039db13a87d805777a1a19db"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.24.0/daftar-cli-0.24.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "195c445d00316ad0b378f27b7d62ab716bc6d10a0696431bdf17bac5b27a02fb"
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
