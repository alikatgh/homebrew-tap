class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.2/le_0.1.2_darwin_arm64.tar.gz"
      sha256 "153af00c8ee7414b69c442560d7558a1fe49bd7f6dfa37d8a2b86f750ca06e9d"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.2/le_0.1.2_darwin_amd64.tar.gz"
      sha256 "e984568a97394aa1ecab85b9a120ef77be4ffc40068ca07b0da1ae8eb2a5df7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.2/le_0.1.2_linux_arm64.tar.gz"
      sha256 "678b43606624202b44f71a1f6129ceff6f7ae8847081b8f082c54da8195d24e7"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.2/le_0.1.2_linux_amd64.tar.gz"
      sha256 "82673fdf4c78acbfd526274f3259126d15c7486c9b7620f6aa1216bfc374d7bc"
    end
  end

  def install
    bin.install "le"
  end

  test do
    system "#{bin}/le", "--version"
  end
end
