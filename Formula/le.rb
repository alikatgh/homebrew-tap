class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.17/le_0.1.17_darwin_arm64.tar.gz"
      sha256 "7a870cdfa89c1460d58a0dbb667e384d88f3e8b9fbf2c4de2de554c69df0a2c0"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.17/le_0.1.17_darwin_amd64.tar.gz"
      sha256 "82aa2ccc6d5e4a0afe7795ab6770bee2b76688afa677c226b0451206ac553033"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.17/le_0.1.17_linux_arm64.tar.gz"
      sha256 "d653581c349c8e398b3efb5609b38c2ad23a441cd48e3f6a2661d7601ff5e02b"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.17/le_0.1.17_linux_amd64.tar.gz"
      sha256 "3777b0efb4fd3836dec3e60c989df6327d2538f6b11c91c08048a7236ee3d471"
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
