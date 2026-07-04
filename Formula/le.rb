class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.14/le_0.1.14_darwin_arm64.tar.gz"
      sha256 "f889120da3cef85782e293dddd01b6c7e62c69fb5796621352c5baf015c6dc63"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.14/le_0.1.14_darwin_amd64.tar.gz"
      sha256 "fa65d1aa92a91295d0be23df25c6413e0844132a2d386ba266e915890dd7339f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.14/le_0.1.14_linux_arm64.tar.gz"
      sha256 "bca0214ad86d4633ec3052658cb763c36a8c69cd3bce2866af89f206874e04bd"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.14/le_0.1.14_linux_amd64.tar.gz"
      sha256 "59b5a9e6e5b7696be82031c1587cd3583da27dee58390521fedd74aa03c25a38"
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
