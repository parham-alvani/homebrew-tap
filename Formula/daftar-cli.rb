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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.17.0/daftar-cli-0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "173f767982bf32117b5a5f955162de235983a3b0d86c3f9453157aa2990dffb5"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.17.0/daftar-cli-0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "ce680ad72bd42df7938c3ad02efd3a7c30b5d38992a7cdccea879d849758b378"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.17.0/daftar-cli-0.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2dca86d49fb8092613a6bb75e7c5a35f06bfc370f8f6359e962bde9efa8bbf9"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.17.0/daftar-cli-0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f953909cb2274ef0b11485cac463b23c5aca0a584d88b216323fb4fe3b446781"
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
