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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.12.2/daftar-cli-0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "53947bdcf572e601b570bba96f11a6d0a82a23a5d6d49bd0d6983bb445d1adea"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.12.2/daftar-cli-0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "119aecd7e039113468ea48044ae64ef770c91f36bfe79593cdd997dd50bf1ec2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.12.2/daftar-cli-0.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf4034690854f71b57c12e5bfe03899e9d6451b6f0828354ba40007e85fcab48"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.12.2/daftar-cli-0.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2341956f982c35d110de92ba405b36c962d32e79ebb364ca47e95309809f1906"
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
