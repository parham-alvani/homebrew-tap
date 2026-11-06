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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.16.1/daftar-cli-0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "9c372edc88abaf91a3c4e200073596dd0efaa52c79ab6162665e02c83d4f6aec"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.16.1/daftar-cli-0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "9151c09891027b8b9159425429ff6d8a310aaf2b28f0292177af2f13c81b64d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.16.1/daftar-cli-0.16.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8df6b5aa4db2ed97e4bef9bf7c5e73a370d027f1c496fb489c64f35c59228a11"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.16.1/daftar-cli-0.16.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b191a47becfb8fbec2bea68161dea3eaafea8bdba34e81f08acdc18b83af2ef"
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
