class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.5/le_0.1.5_darwin_arm64.tar.gz"
      sha256 "14890035b81b7d038d30ace619f35b3d10b8dacffc626bc96ca277611df8d62c"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.5/le_0.1.5_darwin_amd64.tar.gz"
      sha256 "5d44b696d5ddf8b3ac1feb8598875fd004d6eaef7fd27048a2893b11268a6847"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.5/le_0.1.5_linux_arm64.tar.gz"
      sha256 "db667522ad6045ae863ecd97e785d3d19b490d823edc989d9e82973299428ebe"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.5/le_0.1.5_linux_amd64.tar.gz"
      sha256 "e73b1962ac8901fcc66d8f1e212ea1be8ad0e7c19e92d1f34742ce044fe8229e"
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
