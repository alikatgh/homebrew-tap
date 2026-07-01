class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.1/le_0.1.1_darwin_arm64.tar.gz"
      sha256 "77d2d14baf44f66ecdb712d9cdab5ae3e27aca0d1730c84fb9ef796b45f279ec"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.1/le_0.1.1_darwin_amd64.tar.gz"
      sha256 "3c9e93d71b56b3698c7165f2fa10835e6f3564042362e18ae538b46d96f0dfbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.1/le_0.1.1_linux_arm64.tar.gz"
      sha256 "0b3101f29d90dd3d3711d8e4453b19429dcde7dfe32cc5a5c6684223f3c96e8b"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.1/le_0.1.1_linux_amd64.tar.gz"
      sha256 "4d216db1ece69eac86d27aebf4702d1e6828e5ca2e5eb8cfc1df36c848de9c0b"
    end
  end

  def install
    bin.install "le"
  end

  test do
    system "#{bin}/le", "--version"
  end
end
