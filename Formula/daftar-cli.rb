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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.0/daftar-cli-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "5473be0a32147b72ddfa8281d9908345b93cabcf75a72b3556cc90c4a5b71d71"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.0/daftar-cli-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "1eb3a5c119cfe18e1d8411631726142aacb0c9d3830be88b4606ec7337998218"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.0/daftar-cli-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bada37190e853c32d050ca9b9431e5295855073126a2b8f5d0fd2a03071de052"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.0/daftar-cli-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b42fe0f727c58069dc9cb3716993ce9bfe4d15f594c9740f2d2fdf9a5a28daff"
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
