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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.15.0/daftar-cli-0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "ad5d8c9a2f1e713809048de4c57b0594e0134f03f72fc978a08d4ed8110cc0c2"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.15.0/daftar-cli-0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "c2186706a41cc60ab7fa09cb375b99f873026f1dfba153be933cddbd839c2682"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.15.0/daftar-cli-0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd0e2ec037a30f9fecb3100b3822ed3b06dd6c263ff4240b938922bb4c9cb2d4"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.15.0/daftar-cli-0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "989b4eb6858f83d2861e253e90ef1958ee843a8a653c2c19e81ec20815b6be68"
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
