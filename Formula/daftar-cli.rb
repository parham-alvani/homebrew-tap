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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.19.1/daftar-cli-0.19.1-aarch64-apple-darwin.tar.gz"
      sha256 "71fa4af753b846e8699a799e698b90371ae9d559cdf46f8801ea617762aa7b4a"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.19.1/daftar-cli-0.19.1-x86_64-apple-darwin.tar.gz"
      sha256 "9ae56a705858d43a06fedf53f35d29ddd3c3f0b200260757ea1720de553258bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.19.1/daftar-cli-0.19.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3d2be6a380aa6463846dce0ff52b6010ac3e6f537eebf50d3e75e3c90696a25"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.19.1/daftar-cli-0.19.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e329026668af16a7c9154f9c067d92db14eaccba06eaf941f4247fdbee297ff"
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
