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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.27.0/daftar-cli-0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "5f8140dd5450f8b80b18d8c04b5ccb8acbf82e81fe4123ea04c28bf9d1791641"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.27.0/daftar-cli-0.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "3768eb6c98d178c6df90754b01f28ab97eb54e9f0ea8e4f41377442a3d9fbf8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.27.0/daftar-cli-0.27.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6910bdc245956a8c543c30c6dee50dae8b3c7123b866db16cfc3dd11ab506ac7"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.27.0/daftar-cli-0.27.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "870ff4a49ca1389a3fa310aec95e169bda0ca6e866d7acf2f24d855ffdee814b"
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
