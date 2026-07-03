class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.12/le_0.1.12_darwin_arm64.tar.gz"
      sha256 "b170bbb8292aa1806008935ab02159b6f55103301a0409a92e182362e493f18d"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.12/le_0.1.12_darwin_amd64.tar.gz"
      sha256 "4a8aa4fed70524606fb8618aafdad5f329b2ffe239f77cbfd5a3fc2da5a609fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.12/le_0.1.12_linux_arm64.tar.gz"
      sha256 "bc0e7e70acbb8559db73ac39afd638586f1023796448edd78d0b48c5412e67a3"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.12/le_0.1.12_linux_amd64.tar.gz"
      sha256 "8b8d47084732a5e7887bb60cc08c2f764c89bb0870ba9e3fdeb46bd1ade88cb5"
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
