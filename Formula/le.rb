class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.16/le_0.1.16_darwin_arm64.tar.gz"
      sha256 "27988a0e337c92861015e04d57b5e7315f487f0357e4d3ffb46def9a047daa7a"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.16/le_0.1.16_darwin_amd64.tar.gz"
      sha256 "dc92d13fc5074354fb9a676fe930b5494ff12cf6daa8b0cd7a5a5e628dc8ee76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.16/le_0.1.16_linux_arm64.tar.gz"
      sha256 "ccb28d54170882e5f3bc71b08fecc12361526fcf53a34b3ab38fb01d2f2aa5b7"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.16/le_0.1.16_linux_amd64.tar.gz"
      sha256 "68b6625329ec4aa9b84366deff9051ef2b7c76ff742bd2cba36b16c5ffe6eca4"
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
