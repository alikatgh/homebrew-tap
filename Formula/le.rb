class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.6/le_0.1.6_darwin_arm64.tar.gz"
      sha256 "6c5e0a91686d2476c8e0625fd98d1de79c20f0b7d244d3c43ccd5d5e4f98d93f"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.6/le_0.1.6_darwin_amd64.tar.gz"
      sha256 "b188d2db1b6f036e8ef7c17ab19c1647bea96d870caf3667dfd4b3c2c365906f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.6/le_0.1.6_linux_arm64.tar.gz"
      sha256 "0c6c20d20b75eac17e143c34f378b90ec9234d3161f5e0049df4d3eaa113c42c"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.6/le_0.1.6_linux_amd64.tar.gz"
      sha256 "47a8e7ae0eeacb15af0f33b35e8ad269d7402365920b9ce7dfc627b35ce849f8"
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
