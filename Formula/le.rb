class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.3/le_0.1.3_darwin_arm64.tar.gz"
      sha256 "20b4d90f9110694fec692c94bfbda22fc856850eb1ff67b67ae38befeda91ee0"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.3/le_0.1.3_darwin_amd64.tar.gz"
      sha256 "e023ee85675552f9a7f6c71c3f1bbe7d3ccc68acf61061510f013ff8927ac6f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.3/le_0.1.3_linux_arm64.tar.gz"
      sha256 "42bb6b6e0db5ef387ae9e5540d04e0f85cfb85741768dd83b8568708540604e3"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.3/le_0.1.3_linux_amd64.tar.gz"
      sha256 "b9df27aad798d98787747de8204094aee98bda3aec4cec3d4c6658344234b04a"
    end
  end

  def install
    bin.install "le"
  end

  test do
    system "#{bin}/le", "--version"
  end
end
