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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.16.0/daftar-cli-0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "c128cb8234a33ff1c81f9cdfc4036c709c6c388c2a43ad811945bff5d0c5ec3b"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.16.0/daftar-cli-0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "ebfdd2a8157cb46fec4c9bde29b85e52eece3640af21871f880191db8eb95a69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.16.0/daftar-cli-0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "473f12f3067292d9ac8afe4887a028b869b29ab8be8edd88415346cabced8079"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.16.0/daftar-cli-0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "401d4141a4805b20d4b67f62ed2b0f4412494550459e7b419bf841dc4c94c7b9"
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
