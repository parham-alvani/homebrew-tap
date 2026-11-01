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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.12.1/daftar-cli-0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "62ed0a83adc648bd0cf2f7f46a94f6959f2e489f86f2ce360d737317988e9ec5"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.12.1/daftar-cli-0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "d11759da29ab6744e3000f6ac82e61c2e08f6d741fd74f58e5857d4455972cce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.12.1/daftar-cli-0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e8d94bb623cae190e53209deee78f5fa93dddb645863b7b6617e18cb9cc52cb"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.12.1/daftar-cli-0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebb81a37147b2b2a9846849ff0461897f82def24abacbceaff21d7419161b267"
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
