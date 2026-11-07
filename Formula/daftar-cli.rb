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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.19.0/daftar-cli-0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "37a4106d2ff66e1fa79ab73fcd1db4a34db8e2c033638e71185948ccbc32d007"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.19.0/daftar-cli-0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "18b3fd2a64bccb0a886a6c659bda7ca04e4c224f4810dfc2732fbe0343f0c214"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.19.0/daftar-cli-0.19.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "979f81c699d9bb2638ad78dcb8c52a9ab4390e3e049eb94870d53cf76d95b7ab"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.19.0/daftar-cli-0.19.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a316b0eb747e9fdbfb1aa77f38ec77946a28e176148f1c6731b984a267c5a695"
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
