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
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.9.0/daftar-cli-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "7e41aaaeb489fc709eb1f420fb5d25ff6b97ddbb2bbb081660fc0ac03c929420"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.9.0/daftar-cli-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "b37cf1084e1adae7eeb6b6c3be0c31fd3ea735e7c5c9bb0476f0e88a40cf94d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.9.0/daftar-cli-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4759c41371c3f35c9f432a9621a568a0af67328375f1334633599da6da2bac5f"
    end
    on_intel do
      url "https://github.com/parham-alvani/notes-linux/releases/download/v0.9.0/daftar-cli-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57c85b7d14e89aa050d1244356f47bc71dcebb1dbe76c2f54eee35922eabd5ce"
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
