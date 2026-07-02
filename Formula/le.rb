class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.9/le_0.1.9_darwin_arm64.tar.gz"
      sha256 "efbf20e753c3a36d1ce0fff4796b2ec0609c7578d2d121f0d08ba8a5f5e137fe"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.9/le_0.1.9_darwin_amd64.tar.gz"
      sha256 "d6a5b9e7a91a5e1c3901266c2191ea8ee961fafa29b7bcba4dc39d3f23436218"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.9/le_0.1.9_linux_arm64.tar.gz"
      sha256 "22ef614b4a626e7fb6b693054d6ca96d13b0a39d2d49f4b1423d59bf72de05f8"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.9/le_0.1.9_linux_amd64.tar.gz"
      sha256 "2b345ad7cbe4a9cc1947982125007e43effacf6b5ea1004b92c28adbbe18574f"
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
