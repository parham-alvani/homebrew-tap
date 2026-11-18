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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.2/daftar-cli-0.25.2-aarch64-apple-darwin.tar.gz"
      sha256 "3ba37c1feddf6fb55d552a7c40f22e7f2a9ff746f00e8b8b920c36282bfb04bb"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.2/daftar-cli-0.25.2-x86_64-apple-darwin.tar.gz"
      sha256 "31358b4abecb009d5cd9dec181897e2cedcc5285ae786e54d3b76ac56d73549b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.2/daftar-cli-0.25.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e658e1877b4bde9575aa5ae92beb3e2540ddde3cdf03446d36f261c42157af3"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.2/daftar-cli-0.25.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94e8657aa171294c921a03746fb9eb3dcb315d6328b1cc1fd847481d95961b42"
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
