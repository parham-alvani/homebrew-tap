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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.3.0/daftar-cli-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "ad5ca0b21476b24a107dceccdcb25ec7d30a20e8db732e83a1e7a168b467ee94"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.3.0/daftar-cli-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "4f60a37f4e7a19b6a58d53aef727e37f74b6babd1d990b3e88ea8196fafd4db8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.3.0/daftar-cli-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74c99721cb2374d380f1ff9f590c5989989060c62ed69ae6691aebd8a8a24a6d"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.3.0/daftar-cli-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30629d82006a68c23f32b959385f129f80d1f25ea3072966957c59c1cbf90324"
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
