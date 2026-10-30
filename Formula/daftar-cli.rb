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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.4/daftar-cli-0.7.4-aarch64-apple-darwin.tar.gz"
      sha256 "d781794f6484d513947257a1fef188abb2157a1c857024b060138d739f155247"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.4/daftar-cli-0.7.4-x86_64-apple-darwin.tar.gz"
      sha256 "9a4986bdae96b2a81dc47d3d09ad48f66130a3702cee95a4b94edcb5183fe197"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.4/daftar-cli-0.7.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9b11fbebdf43dcc484368b03e315cc63310fada589b7a5357c1c88bd4794257"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.4/daftar-cli-0.7.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1588481841f374bb6df2dacf804e04ce834d2f747572689c19abdf35f961002"
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
