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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.18.1/daftar-cli-0.18.1-aarch64-apple-darwin.tar.gz"
      sha256 "95555beddfdea6932c7915c35bdba64877ac2cf93c609e8fda6d3e33d5775e06"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.18.1/daftar-cli-0.18.1-x86_64-apple-darwin.tar.gz"
      sha256 "686cbde3e1351dbaffb410135f1a5641108757f2018aa0b34b61d929d00db04d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.18.1/daftar-cli-0.18.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33283ea0ce932fa8eb1d465ee76101b2dfaa50bf464ae735394a9e0129fe63f4"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.18.1/daftar-cli-0.18.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce36cba82eef51a22ef87618448ed657ced51068deb90161010dc7e528fa516e"
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
