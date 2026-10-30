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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.3/daftar-cli-0.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "b493870dd01baf524891d8391aaebf77acc710a64559dfdf0c6c13279048fbcd"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.3/daftar-cli-0.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "b6af4b1e55838bc585667c03854df5dcd25bae14918624a312b60ab4dc8b02d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.3/daftar-cli-0.7.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7ebffb061735f60ff8f03a88ac47b3c5ab4d22521370e0bea9cb3d5561faa76"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.7.3/daftar-cli-0.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c7b90fbb1efdc99cb8d11e316c5dfd7d686438172f4412e97d7f677d8324229"
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
