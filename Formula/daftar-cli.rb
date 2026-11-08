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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.20.0/daftar-cli-0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "4c58a86d672e7f465160f51f1d58697eeaa475b08d42099fde5e578ac036abc8"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.20.0/daftar-cli-0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "90279ca6f6832b7bf7dbdfabac0bed3a3e78489284885dec226064b7bc9bae41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.20.0/daftar-cli-0.20.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a39f5c436c925494b6e710d0e79d0dab016f0bcb9466eb1bc41c7e3782ead39"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.20.0/daftar-cli-0.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44d60c0e8881b42d87a8fb1d9829d87c9d10c2b8a17827b81d7a9d9cdf9b85df"
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
