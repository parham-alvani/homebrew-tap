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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.1.0/daftar-cli-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "96e0bd0dc046668fbe4cfcaac11df3175b6f792f1a48bb5db44b14cbcf76cf0e"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.1.0/daftar-cli-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6e887bb4a6762072d7719adb3f941464225aeb1cc29837fd8e979dab3c06d25e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.1.0/daftar-cli-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d8b75f0f8fb723fdeba5368bad68d5fa29d1201a2c5ad4400e4981713f52eaf"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.1.0/daftar-cli-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a00a30dead4af0189fe9c255933a0949c1caa40b44fb60393ef7350c9fc7c24f"
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
