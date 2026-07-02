class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.11/le_0.1.11_darwin_arm64.tar.gz"
      sha256 "7c506dc368a75717c684047f99bf68eb815e595c98280ee0488960998ac6af14"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.11/le_0.1.11_darwin_amd64.tar.gz"
      sha256 "fe5e0cf50393a7b4b2f7e3cc54166c634ccf5f290c2bf2315f048bbc444c110b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.11/le_0.1.11_linux_arm64.tar.gz"
      sha256 "edf26461ba7d013d7a32a4b2f9597c026c19310047554222b388e8e6807bb2b5"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.11/le_0.1.11_linux_amd64.tar.gz"
      sha256 "a9478eb99e390c308de8beb70c09bb30189cd5cbd41c53b48f28271b4298979b"
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
