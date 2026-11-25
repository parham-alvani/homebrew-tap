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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.31.1/daftar-cli-0.31.1-aarch64-apple-darwin.tar.gz"
      sha256 "c7ef1d7e8c96cdaab19a3c7b5c0e611afd41bf8342b3fd7b831b5118ba949746"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.31.1/daftar-cli-0.31.1-x86_64-apple-darwin.tar.gz"
      sha256 "8ad584e67d929b5183eda77048e8219eb95eb5f39ac4020e8900ba852f575813"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.31.1/daftar-cli-0.31.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c0d4af38c5c8d0e78a9c3f080873ce510306c2fd8d4178c5a05f7cdc1c34b39"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.31.1/daftar-cli-0.31.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88b9093c9bc646b788a83c91afa1be2f39ae0317f9f399bb5a7962bab23086a7"
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
