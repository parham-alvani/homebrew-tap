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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.4/daftar-cli-0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "2751fcf8ec6b8b8cee7a0c68488afef82a43e9a0de793df1f9eb61132cd08ae3"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.4/daftar-cli-0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "91b507af6b365ab82d4166ba9e0b2ccef5e76828be3c6e2d3886ee9b2ebaf736"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.4/daftar-cli-0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0f4224502ab3c47236e7fd07a552b6108aabf33aceb53238894d37598883cbe"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.4/daftar-cli-0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa63dc7c36324cdc063621cd2ae700127a73c73ddd97a02e60472a5e4f059a47"
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
