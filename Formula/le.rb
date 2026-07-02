class Le < Formula
  desc "See and stop what's listening on localhost, from the terminal"
  homepage "https://localhostexplorer.com"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.10/le_0.1.10_darwin_arm64.tar.gz"
      sha256 "e145fce71f38976365c28dd3c93b54829b85add5e5a2fbc52d1718d0800df351"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.10/le_0.1.10_darwin_amd64.tar.gz"
      sha256 "eb18cce26961cfec6d671e05a12cb9f18cfaaa2d108ae97a34d44be05ec8854a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.10/le_0.1.10_linux_arm64.tar.gz"
      sha256 "42fa2084ae4a49553f9b4f2dddb012521913e15d283225297512fde91f3084c6"
    end
    on_intel do
      url "https://github.com/alikatgh/le-cli/releases/download/v0.1.10/le_0.1.10_linux_amd64.tar.gz"
      sha256 "c7c0cd7c902bd24849730ccfff3e5b70757654b9c5b513828757d72ce934cde4"
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
