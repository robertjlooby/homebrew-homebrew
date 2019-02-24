class DhallToSshConfig < Formula
  desc "Tool for generating an ssh config from Dhall"
  homepage "https://github.com/robertjlooby/dhall-ssh-config"
  url "https://github.com/robertjlooby/dhall-ssh-config/archive/0.1.0.0.tar.gz"
  sha256 "6cbf72f80640d56d37e6c1ddc40b9c23082b8628027004e343cb7d62321c1a82"

  head do
    url "https://github.com/robertjlooby/dhall-ssh-config.git"
  end

  bottle do
    root_url "https://github.com/robertjlooby/dhall-ssh-config/releases/download/0.1.0.0"
    sha256 "f51d6448a0a6580377c3dd06a6c04b30b9a8d31d2ebeb6fbae7f67467beff443" => :mojave
  end

  depends_on "haskell-stack" => :build

  def install
    system "stack", "install", "dhall-ssh-config", "--local-bin-path", bin
  end

  test do
    expected = "Host example\n     User test\n"
    actual = `echo '[{host = "example", user = Some "test"}]' | dhall-to-ssh-config`
    raise "Expected:\n#{expected} Actual:\n#{actual}" unless actual == expected
  end
end
