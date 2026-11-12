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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.23.0/daftar-cli-0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "854bb937c754979d8eb23e10ef8ef51be61da45d0e8c7248cc738c403318faa4"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.23.0/daftar-cli-0.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "3575202215f9eede7660e876a0fb47ed513df823de4c91539d318823435946e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.23.0/daftar-cli-0.23.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "881fdc62e2d94e3401f3c96c7e15413793e0f335b17776b74ff272a7458da13b"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.23.0/daftar-cli-0.23.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31463a46a415ece8668e01ba8137e044baab9129e820157f291fe83b6f853445"
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
