class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.13/le_0.1.13_darwin_arm64.tar.gz"
      sha256 "ff12a53f0ea45405e65cc4f3db33c62a9358028360fff8bdb72addfd34720fb1"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.13/le_0.1.13_darwin_amd64.tar.gz"
      sha256 "9044bba011c672f69c36b8f21c5b5254e05cd47e0c3aa26b10f12612909091bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.13/le_0.1.13_linux_arm64.tar.gz"
      sha256 "a2440967ea771c4ccc764d5d2f5c91a7c6e9d64e9938d8831d8bb8c564166ed0"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.13/le_0.1.13_linux_amd64.tar.gz"
      sha256 "848b12fc55b9aafc1288f5b7b47b84da6d6d4eb6d16c7e602ca879f824635d99"
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
