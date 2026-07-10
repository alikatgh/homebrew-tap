class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.15/le_0.1.15_darwin_arm64.tar.gz"
      sha256 "071d4b9f9db14066981fe59189efaf54117445212dccf14e4733f91120f95d87"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.15/le_0.1.15_darwin_amd64.tar.gz"
      sha256 "6012721ff85a1cfcdd1a85205fc60c2e47b04e4ae4c0f00e0fc9cc30d686a9bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.15/le_0.1.15_linux_arm64.tar.gz"
      sha256 "8a5c986ff6c3fa4478328c570b2016c3b3d5f974f928b58878c0ecec10cb57e4"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.15/le_0.1.15_linux_amd64.tar.gz"
      sha256 "52e121959c9644004ed23fd45f75aba9c8d4406b4be23996e9c061212d5908d1"
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
