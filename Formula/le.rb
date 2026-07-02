class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.4/le_0.1.4_darwin_arm64.tar.gz"
      sha256 "aac945b65df975a85ce0daa52a125c0e676209383d55aba061c6219a4896e3b5"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.4/le_0.1.4_darwin_amd64.tar.gz"
      sha256 "b5813f31ae920fa6997b379eb183d1cf322bf0d100078a8e1436ab6e6ea0f39b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.4/le_0.1.4_linux_arm64.tar.gz"
      sha256 "1a0147c6f6e30c9ff4e458c29b1a7adae7330c3e629266168473036269b6ae62"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.4/le_0.1.4_linux_amd64.tar.gz"
      sha256 "42241ca5dd2e42da07643a33e0ba9d0c3bd538f930af9a27c389b80be5d44110"
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
