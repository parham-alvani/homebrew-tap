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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.2/daftar-cli-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "9222b4bd7ceed208f62e4637c0d8c94ed8261888681df5b68f1856a0e8f15fcc"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.2/daftar-cli-0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "3aa06331b69187d45fdc99cbe58ee6c00d297ea35410fae9fc32d611f8789325"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.2/daftar-cli-0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "491e1b16c5eb64c47c78f478d0b31d68665af677566475012dc52f99efc9d284"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.2/daftar-cli-0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d85ec6d038b7df8551a8eff5ffbd3bfa36cf2b89dc726a8664c1a52e3031a5bf"
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
