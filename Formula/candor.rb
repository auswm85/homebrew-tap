class Candor < Formula
  desc "Local-first, live LLM cost tracking via a transparent proxy"
  homepage "https://github.com/auswm85/candor"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auswm85/candor/releases/download/v1.0.0/candor_1.0.0_macOS_Apple-Silicon.tar.gz"
      sha256 "e653bc8d5cdf825d745f22990c65c7ad62ac5e528274f666c111074f5783f02c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/auswm85/candor/releases/download/v1.0.0/candor_1.0.0_macOS_x86-64.tar.gz"
      sha256 "61a0cb4ef5bcd21ca966a3e12d3981e26da567554cfc4d4daf79ed19391dcbdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/auswm85/candor/releases/download/v1.0.0/candor_1.0.0_Linux_ARM64.tar.gz"
      sha256 "2dd7d3e896ae1913d7670b100f218dba9a6f9ba71ba7607d16b80d636d4137a2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/auswm85/candor/releases/download/v1.0.0/candor_1.0.0_Linux_x86-64.tar.gz"
      sha256 "8d4061f3acb78d38037b229d9a651bac66da5fe73866e203f5ee1f0465e5dc00"
    end
  end

  def install
    bin.install "candor"
  end

  test do
    system "#{bin}/candor", "version"
  end
end
