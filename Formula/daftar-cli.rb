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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.1/daftar-cli-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "d82d8ddb17940e8ee4b2e4fdf2eb15018f8fb194b118099feee596efba48e9a8"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.1/daftar-cli-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "9a18b6c7ca475214b65ccb46179edfc919352b8c75aa9b2e1d67161d87cf86ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.1/daftar-cli-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "271ab76571576139eb0a8d92c695c89ce410b499abbd321d103060f54b91e82a"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.8.1/daftar-cli-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80f556a4ebbd3686239dff4a2e20d5666438c0ce6f15ec512ec4279ca3655dac"
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
