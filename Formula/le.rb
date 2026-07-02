class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.8/le_0.1.8_darwin_arm64.tar.gz"
      sha256 "1892c0ff217ec86b23a5ff6cf831a158f371a91cff3aab1db8c317369beb7bbd"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.8/le_0.1.8_darwin_amd64.tar.gz"
      sha256 "c8eb17a0594fcc5700419cb93fe46e89633d4c1fe3d25ce934caed8d4bf209db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.8/le_0.1.8_linux_arm64.tar.gz"
      sha256 "a984e7c1d8295ae8f76add19d1ede9a20db572176725342e5bf73406eab33cb7"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.8/le_0.1.8_linux_amd64.tar.gz"
      sha256 "4e47de86282e974070152a2422cb529228d015112dfe88904fb455f6275e1b11"
    end
  end

  def install
    bin.install "le"
    man1.install Dir["man/*.1"]
    # Cobra ships `le completion <shell>`; generate + install so `le <tab>`
    # works out of the box. Runs the just-installed binary at install time,
    # so nothing extra is bundled in the tarball. Homebrew's helper emits
    # zsh + fish for Cobra tools (zsh is the macOS default shell).
    generate_completions_from_executable(bin/"le", "completion")
  end

  test do
    system "#{bin}/le", "--version"
  end
end
