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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.21.1/daftar-cli-0.21.1-aarch64-apple-darwin.tar.gz"
      sha256 "a28db75396b32774e908b978c00ebf0db7c12ac4d1144031812031cebe9cd5c8"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.21.1/daftar-cli-0.21.1-x86_64-apple-darwin.tar.gz"
      sha256 "432ddc77dca1272761ffc2f5541b0d773130ceae17ef46188e670e17a826a0a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.21.1/daftar-cli-0.21.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b129a402b2aea960eb85fc8cebdb6cb8811f26e9cb265d584405b7eb0ac0dde8"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.21.1/daftar-cli-0.21.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8db323c9ddc10376f61e338539b0a424849d219f50d492d8ed099f73e2c4de3a"
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
