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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.23.1/daftar-cli-0.23.1-aarch64-apple-darwin.tar.gz"
      sha256 "c9144c3793d0044428908cfaa124fddfbb29fb3f8e5ec8ec2b7125f88f3b6ab9"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.23.1/daftar-cli-0.23.1-x86_64-apple-darwin.tar.gz"
      sha256 "d7646063dada8c77c7861811b2afc19f3ce2068ea794c4e35fec8e1924365367"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.23.1/daftar-cli-0.23.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10d2446ce70ac70e43d3ab5c69f00bd52f5264e5196108aba831c00235004308"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.23.1/daftar-cli-0.23.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d901046ca3b6077d0eb94c241db6a84c9a5b8af24a5eba2cc237e89ebc4e2a6"
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
