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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.21.0/daftar-cli-0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "cab9d4261e62953f5ae0e0a3d903e8fda3f2ea34023018d19be6a8b6c0ccc56f"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.21.0/daftar-cli-0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "1625faf4866c9e9e71a8bff0117f948a8d5730955d53304c91e6ca1c089422f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.21.0/daftar-cli-0.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9f0d5a4db47d7ca47bc3fea9d0adc9b1fe78c853ecb0f5c3e91883631df2307"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.21.0/daftar-cli-0.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a05dee4c74c0184955a731d3a5cc844d2794a39c6fedf26e36f98d05797c5d8"
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
