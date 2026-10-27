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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.0/daftar-cli-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "00d24deab7426ae4ece6acd63bcda1db1317091adc972b17ff9211d2faadfb56"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.0/daftar-cli-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "284438287b58f9d2b509925448b6e5f2acef537cec47cb46d439c8b9cb1ae764"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.0/daftar-cli-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bce934172bb98753d5fc70d01fef73bd167043335175e964a9351b3737b151b6"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.0/daftar-cli-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87b63a1ab8a041af2329dc7053c9c5b46fbee2f4ba2684a7da2467d33f186c48"
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
