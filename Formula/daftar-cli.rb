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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.0/daftar-cli-0.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "7c71989f3387ca5e1473ba31edd60a19ab2ca97103e438efd2e560cfcdb6f735"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.0/daftar-cli-0.25.0-x86_64-apple-darwin.tar.gz"
      sha256 "eec4450bf6bc88bb35cc05cb21ad54467881e2eddbc4ad30cac2f783a9d9e2e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.0/daftar-cli-0.25.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9971efd41c0f7a8d6705ceb8601c16f41cf5cc582506a5ddf8e2abb6ee10a735"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.25.0/daftar-cli-0.25.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d59aad944f1194f951de299322ddbb6e4f53043c834c4c03136dc0b38c6bcf4"
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
