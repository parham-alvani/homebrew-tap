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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.6/daftar-cli-0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "27c1f854237554980c49b93751852a8d29fa06a3527a8fb9fd87c883740f19b1"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.6/daftar-cli-0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "7d734202e1f0fb2d744dee38814508a958478a092f5a64753420c7d7de299288"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.6/daftar-cli-0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d15a861afee956968fdff336d4ff381a60268a0f48836784625c5a4f6bf5722c"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.6/daftar-cli-0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f589aff569ed764ed20db191041bc4e1ce6c01756117ddaeaed60d4b0be70ef2"
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
