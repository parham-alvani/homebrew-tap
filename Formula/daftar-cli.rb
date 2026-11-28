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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.36.0/daftar-cli-0.36.0-aarch64-apple-darwin.tar.gz"
      sha256 "c204d05d99f38faa3d8a7bcd48cc3f2facae31c00baa21e0a9f5b36e5c1c1967"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.36.0/daftar-cli-0.36.0-x86_64-apple-darwin.tar.gz"
      sha256 "452b75d263ca4e2e40c97fcf007ee342c2bd03cbdad8910c6a4c082748314b9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.36.0/daftar-cli-0.36.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00f84a95094be50e04acb56cdede1c5cf768c41086464a65e316535e3b506a42"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.36.0/daftar-cli-0.36.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cb64fad3a93f48e3d7a07f9c8772f7846d5951200ef0ff8ef58c958dd2e9a23"
    end
  end

  def install
    bin.install "daftar-cli"
    generate_completions_from_executable(bin/"daftar-cli", "completions")
    system bin/"daftar-cli", "man", "--dir", man1
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/daftar-cli --version")
    (testpath/"vault/.obsidian").mkpath
    (testpath/"vault/Inbox.md").write "- [ ] Water the plants\n"
    assert_match "Water the plants", shell_output("#{bin}/daftar-cli --vault #{testpath}/vault tasks")
  end
end
