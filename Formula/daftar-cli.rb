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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.5/daftar-cli-0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "686fdf0607fa129a5957daeba2ba4e168a47465c012d5fee73efada3257a9344"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.5/daftar-cli-0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "8f1634696baa3f71d38aa77ff7dab602a49e65bf4dfeefe1eaabf415ced35284"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.5/daftar-cli-0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d571153607c90bf7457e7f4bbc376a5dc0dfab9ad5fc6f4249b6c43c8072e76"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.4.5/daftar-cli-0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "179d77871e800d9d573c6ad944a78c80fe30e20fa1e6f0b6ddba13045b04f830"
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
