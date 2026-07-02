class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.7/le_0.1.7_darwin_arm64.tar.gz"
      sha256 "67ed09aca76b49e9278ef4645ff65e4893dafa2cb1a215813f29de9c633c6264"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.7/le_0.1.7_darwin_amd64.tar.gz"
      sha256 "4136009896a34cd84f4661b85006353911b0eae140923056d7583acff1aea91f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.7/le_0.1.7_linux_arm64.tar.gz"
      sha256 "2e90767cd2947163f4908b5e94e8217d6974042ea407de5351b82d6117be4398"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.7/le_0.1.7_linux_amd64.tar.gz"
      sha256 "749eda2e7c607dd80f5929b1f64621bfc04dba49ca921fff92a3379b130d49f5"
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
