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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.11.0/daftar-cli-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "e63d07ed4b9ab65084edfa73a74f7a430d67c0b31f269eccbd7c220ced5133ec"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.11.0/daftar-cli-0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "b163f3e57bb6297c243370129517aa9c2e9a4fbc8f336707e8fecba6db16b83e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.11.0/daftar-cli-0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe22904accab997dae51a09c23d20c7387adb1991058d1e49b1c1340b7eda5a4"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.11.0/daftar-cli-0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b479a0d9038b78e7a2d5bc5007267df6f369c7393120f1f7c9e84bf16cd062a"
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
