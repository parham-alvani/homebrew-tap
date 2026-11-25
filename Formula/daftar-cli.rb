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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.32.0/daftar-cli-0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e60d30702851cdf14462899f3c49b207cb646061e96729e09406e19e547d9aa"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.32.0/daftar-cli-0.32.0-x86_64-apple-darwin.tar.gz"
      sha256 "e6d490befc01351718e2d10928cf2fa2747bcff97d27f16482532e964abb3e3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.32.0/daftar-cli-0.32.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f207ba4bba320cc97a3c871b7b567ea5f4758e505af971d4fc455428179a936"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.32.0/daftar-cli-0.32.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8669613280ac8ca49b23a0f088cd5e91ad8db124405d4eecc1cfd3f95dde010a"
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
