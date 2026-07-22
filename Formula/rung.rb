class Rung < Formula
  desc "Git workflow tool for managing stacked pull and merge requests"
  homepage "https://github.com/auswm85/rung"
  license "MIT"

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/auswm85/rung/releases/download/v1.0.0/rung-1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "a5f751d02c2bd2ee33cd25b4da84985ce9e446b9f4ef460c2b9cdf2637f45d1d"
    end

    on_intel do
      url "https://github.com/auswm85/rung/releases/download/v1.0.0/rung-1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "17805142da2ad0450b3c80a893b85df68a1c7ccc198bc0669b81b9644bd9a7e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/auswm85/rung/releases/download/v1.0.0/rung-1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81710e4172c94db1670485dba7cfbd25bfe88726c98273f22b7c19bafedce998"
    end
  end

  def install
    bin.install "rung"
    generate_completions_from_executable(bin/"rung", "completions")
  end

  test do
    assert_match "rung #{version}", shell_output("#{bin}/rung --version")

    system "git", "init", "test-repo"
    cd "test-repo" do
      output = shell_output("#{bin}/rung status 2>&1", 1)
      assert_match(/not initialized/i, output)
    end
  end
end