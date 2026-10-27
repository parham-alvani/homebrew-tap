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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.5.0/daftar-cli-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "bee6890efb3ddf51c3c67bb15e91c88ab4710aa09fb2e03ee5d39b39e285cf24"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.5.0/daftar-cli-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "2d5dfe57c09759c5721e235e1975e524a0236b9ccf65730a104caef23d82678e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.5.0/daftar-cli-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d41e9ea63c0372d6c2c531731cb5ff93403c4844588f8b518e4e44740b4058b7"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.5.0/daftar-cli-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b8d801e7726235568a79effef9bb81c6184b3c52e155877ea179894b768f39b"
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
