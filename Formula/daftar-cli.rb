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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.2/daftar-cli-0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "0f4d12e211778282cb52d7b91a3cbd8fc2b6e8be60c8dfebe99f199e5299f7d2"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.2/daftar-cli-0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "ddf4291ac39d3411e9f7959f769e34c25fdbed50048dc28746789b6f8ea0bf41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.2/daftar-cli-0.7.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e0c5aa1b7ad1c6dc4e55032920ba0b662e8fc8b1487eae7799b85b3ff45fcf5"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.2/daftar-cli-0.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c80f3e92a5d897fb912d903ad047ebe9b46c74c93832fd34e67e41c312b5eddf"
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
