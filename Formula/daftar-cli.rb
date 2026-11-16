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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.1/daftar-cli-0.25.1-aarch64-apple-darwin.tar.gz"
      sha256 "1e649ff575fb518e4975660cf31626412d3c07e28c23abc5558a88f1d0103e17"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.1/daftar-cli-0.25.1-x86_64-apple-darwin.tar.gz"
      sha256 "82fe377d86063463074a86e7604aa5786fbccde932c2263992a04427466dd951"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.1/daftar-cli-0.25.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15550a4226637299ecf2fa7fd13a0e691a23f5056c04c20d9d1f992302d5a4a6"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.1/daftar-cli-0.25.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf7c5f0b5546ab3178e4021a6d8b0b50086a075514fc124bf5787348530fed60"
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
