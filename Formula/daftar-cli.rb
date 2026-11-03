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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.14.0/daftar-cli-0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "0c12f38ef8ad57f4f7eef9e2a7b5da527f09825975d59dbcbe33158af496cfc3"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.14.0/daftar-cli-0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "067a5b8565836d09fad375c8869572a5cf0b1b8bf0028431c439ff7f1e5351a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.14.0/daftar-cli-0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d6f4320aeffd888da777c59a46dbe5bd9d7b5ffe86f52e2fb7cdceac750a889d"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.14.0/daftar-cli-0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "027b059d90aaaf29102b05e28e7cabd9d55228e268bbabd9359a397ddf592eb3"
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
